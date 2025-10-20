-- Oracle: agregare pe ZI + ORA (ORA = HH24)
WITH
-- 1) Ultima înregistrare per CUIIO în EREPORTING
EREP_RAW AS (
  SELECT 
L.CUIIO, 
L.DATA_REG
FROM  
(
SELECT DISTINCT d.CUIIO, TRUNC(MAX(d.DATA_REG)) AS DATA_REG
  FROM USER_EREPORTING.DATA_ALL_PRIMIT d
  JOIN CIS2.RENIM r ON r.CUIIO = d.CUIIO AND r.CUIIO_VERS = d.CUIIO_VERS
  WHERE d.PERIOADA = :pPERIOADA
    AND d.FORM IN (:pFORM)
    AND d.ID_SCHEMA = '2'
   -- AND r.CUATM LIKE '011%'
  GROUP BY d.CUIIO ) L LEFT JOIN (
  SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                        
                          D.FORM,
                          MAX(D.DATA_REG) DATA_REG,
                          'CIS2' AS COL1
                          
            FROM CIS2.DATA_ALL D
            
                 
           WHERE D.PERIOADA = :pPERIOADA AND D.FORM IN (:pFORM)
           
            GROUP BY 
           
           D.CUIIO,
                         D.CUIIO_VERS,
                       
                          D.FORM
  ) R ON R.CUIIO = L.CUIIO 
  
  
  WHERE 
  R.CUIIO IS NOT NULL 
),
-- 2) Proiectam zi + ora
EREP AS (
  SELECT
    CUIIO,
    TRUNC(DATA_REG)                 AS DATA_ZI,
    TO_CHAR(DATA_REG, 'HH24')       AS ORA,
    TRUNC(DATA_REG, 'HH')           AS DATA_ORA  -- pt. sortare
  FROM EREP_RAW
),
-- 3) Ultima înregistrare per CUIIO în CIS2, excluzând CUIIO care apar în EREPORTING
CIS2_RAW AS (
  SELECT d.CUIIO, MAX(d.DATA_REG) AS DATA_REG
  FROM CIS2.VW_DATA_ALL d
  WHERE d.PERIOADA = :pPERIOADA
    AND d.FORM    IN (:pFORM)
   -- AND d.CUATM LIKE '011%'
    AND NOT EXISTS (
      SELECT 1
      FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT e
      JOIN CIS2.RENIM r
        ON r.CUIIO = e.CUIIO
       AND r.CUIIO_VERS = e.CUIIO_VERS
      WHERE e.PERIOADA = :pPERIOADA
        AND e.FORM    IN (:pFORM)
        AND e.ID_SCHEMA = '2'
     --   AND r.CUATM LIKE '011%'
        AND e.CUIIO = d.CUIIO
    )
  GROUP BY d.CUIIO
),
-- 4) Proiectam zi + ora
CIS2_ONLY AS (
  SELECT
    CUIIO,
    TRUNC(DATA_REG)                 AS DATA_ZI,
    TO_CHAR(DATA_REG, 'HH24')       AS ORA,
    TRUNC(DATA_REG, 'HH')           AS DATA_ORA
  FROM CIS2_RAW
),
-- 5) Unim sursele, etichetam
UNIONED AS (
  SELECT DATA_ZI, ORA, DATA_ORA, 'EREPORTING' AS SRC, CUIIO FROM EREP
  UNION ALL
  SELECT DATA_ZI, ORA, DATA_ORA, 'CIS2'       AS SRC, CUIIO FROM CIS2_ONLY
)
-- 6) Pivotam pe surse ?i calculam TOTAL
SELECT
  u.DATA_ZI,
  u.ORA,
  NVL(u.EREPORTING, 0) AS EREPORTING,
  NVL(u.CIS2, 0)       AS CIS2,
  NVL(u.EREPORTING, 0) + NVL(u.CIS2, 0) AS TOTAL
FROM (
  SELECT DATA_ZI, ORA, DATA_ORA, SRC, CUIIO
  FROM UNIONED
) s
PIVOT (
  COUNT(CUIIO) FOR SRC IN ('EREPORTING' AS EREPORTING, 'CIS2' AS CIS2)
) u
ORDER BY u.DATA_ZI DESC, u.DATA_ORA DESC, u.ORA DESC;
