-- Rezultat: o linie pe zi (DATA_REG, trunchiata la zi),
-- cu numarul de CUIIO din EREPORTING (COL1) ?i CIS2 (COL2)

WITH
-- Setul EREPORTING (max DATA_REG / CUIIO, filtrat pe CUATM si parametri)
EREP AS (
  SELECT
      d.CUIIO,
      TRUNC(MAX(d.DATA_REG)) AS DATA_REG
  FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT d
  JOIN CIS2.RENIM r
    ON r.CUIIO = d.CUIIO
   AND r.CUIIO_VERS = d.CUIIO_VERS
  WHERE d.PERIOADA  = :pPERIOADA
    AND d.FORM     IN (:pFORM)
    AND d.ID_SCHEMA = '2'
    AND r.CUATM LIKE '011%'
  GROUP BY d.CUIIO
),

-- Setul CIS2 (max DATA_REG / CUIIO), excluzând CUIIO care apar în EREPORTING
CIS2_ONLY AS (
  SELECT
      d.CUIIO,
      TRUNC(MAX(d.DATA_REG)) AS DATA_REG
  FROM CIS2.VW_DATA_ALL d
  WHERE d.PERIOADA = :pPERIOADA
    AND d.FORM    IN (:pFORM)
    AND d.CUATM LIKE '011%'
    AND NOT EXISTS (
          SELECT 1
          FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT e
          JOIN CIS2.RENIM r
            ON r.CUIIO = e.CUIIO
           AND r.CUIIO_VERS = e.CUIIO_VERS
          WHERE e.PERIOADA  = :pPERIOADA
            AND e.FORM     IN (:pFORM)
            AND e.ID_SCHEMA = '2'
            AND r.CUATM LIKE '011%'
            AND e.CUIIO = d.CUIIO
    )
  GROUP BY d.CUIIO
),

-- Unificam sursele si le etichetam
UNIONED AS (
  SELECT DATA_REG, 'EREPORTING' AS SRC, CUIIO FROM EREP
  UNION ALL
  SELECT DATA_REG, 'CIS2'       AS SRC, CUIIO FROM CIS2_ONLY
)

-- Agregam pe zile si pivotam în cele 2 coloane cerute
SELECT
  u.DATA_REG,
  NVL(u.EREPORTING, 0) AS COL1,  -- COUNT CUIIO din EREPORTING
  NVL(u.CIS2,       0) AS COL2   -- COUNT CUIIO din CIS2
FROM (
  SELECT DATA_REG, SRC, CUIIO
  FROM UNIONED
) s
PIVOT (
  COUNT(CUIIO) FOR SRC IN ('EREPORTING' AS EREPORTING, 'CIS2' AS CIS2)
) u
ORDER BY u.DATA_REG DESC;
