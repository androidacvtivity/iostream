
SELECT 
  TO_NUMBER(CR.NR_ROW) AS ORDINE,
  CR.NUME_ROW AS NR_ROW,
  SUM(CASE WHEN C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%' THEN L.COL1 ELSE NULL END) AS KATALOG,
  SUM(CASE WHEN C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%' THEN L.COL2 ELSE NULL END) AS TOTAL_CIS2,
  SUM(CASE WHEN C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%' THEN L.COL3 ELSE NULL END) AS EREPORTING,
  SUM(CASE WHEN C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%' THEN L.COL4 ELSE NULL END) AS ONLY_CIS2
FROM 
(

-----------------------------------------------------------------
  SELECT 
    C.CODUL,
    C.FULL_CODE,
    COUNT (DISTINCT CASE WHEN FC.FORM = :pFORM THEN FC.CUIIO END) AS COL1,
    NULL AS COL2,
    NULL AS COL3,
     NULL AS COL4
  FROM (
    SELECT     
      R.CUIIO,
      R.CUIIO_VERS,
      FC.FORM,
      R.CUATM
    FROM (
      SELECT FC.CUIIO,
             FC.CUIIO_VERS,
             FC.FORM,
             FC.FORM_VERS,
             FC.STATUT
      FROM CIS2.FORM_CUIIO FC
      INNER JOIN (
        SELECT CUIIO, MAX(CUIIO_VERS) CUIIO_VERS
        FROM CIS2.FORM_CUIIO
        WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA_LUNA  
        GROUP BY CUIIO
      ) BB
      ON BB.CUIIO = FC.CUIIO AND BB.CUIIO_VERS = FC.CUIIO_VERS
      WHERE FC.FORM IN (:pFORM) 
        AND FC.STATUT <> '3'
        AND FC.FORM_VERS IN (:pFORM_VERS)           
    ) FC
    INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS
  ) FC 
  INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = FC.CUATM
  GROUP BY C.CODUL, C.FULL_CODE
----------------------------------------------------------------------------
  UNION 

  SELECT 
    C.CODUL,
    C.FULL_CODE,
    NULL AS COL1,
    COUNT (DISTINCT CASE WHEN D.FORM = :pFORM THEN D.CUIIO END) AS COL2,
    NULL AS COL3,
     NULL AS COL4
  FROM (
    SELECT DISTINCT D.CUIIO,
                    D.CUIIO_VERS,
                    R.CUATM,
                    D.FORM
    FROM CIS2.DATA_ALL D
    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    WHERE D.PERIOADA = :pPERIOADA_LUNA 
      AND D.FORM IN (:pFORM)
      AND D.DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
      AND D.FORM_VERS IN (:pFORM_VERS)      
  ) D
  INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
  GROUP BY C.CODUL, C.FULL_CODE

  UNION 
------------------------------------------------------------------------------
  SELECT 
    C.CODUL,
    C.FULL_CODE,
    NULL AS COL1,
    NULL AS COL2,
    COUNT (DISTINCT CASE WHEN D.FORM = :pFORM THEN D.CUIIO END) AS COL3,
    NULL AS COL4
  FROM (
    SELECT DISTINCT D.CUIIO,
                    D.CUIIO_VERS,
                    R.CUATM,
                    D.FORM
    FROM USER_EREPORTING.DATA_ALL_PRIMIT D
    
    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
    
    INNER JOIN CIS2.DATA_ALL RR ON RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS 
    WHERE D.PERIOADA = :pPERIOADA 
      AND D.FORM IN (:pFORM)
      AND D.ID_SCHEMA = '2'
      AND D.FORM_VERS IN (:pFORM_VERS)  
      AND D.DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS')  
--      AND D.CUIIO  IN (
--        SELECT DISTINCT D.CUIIO
--        FROM CIS2.DATA_ALL D
--        WHERE D.PERIOADA = :pPERIOADA 
--          AND D.FORM IN (:pFORM)
--          AND D.DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
--      )
      
      
  ) D
  INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
  GROUP BY C.CODUL, C.FULL_CODE
  UNION 
  -----------------------------------------------------------------
  SELECT 
  C.CODUL,
  C.FULL_CODE,
  NULL AS COL1,
  NULL AS COL2,
  NULL AS COL3,
  COUNT (DISTINCT CASE WHEN D.FORM = :pFORM THEN D.CUIIO END) AS COL4

FROM (
  SELECT DISTINCT D.CUIIO, D.CUIIO_VERS, R.CUATM, D.FORM
  FROM CIS2.DATA_ALL D
  INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
  WHERE 
    D.PERIOADA = :pPERIOADA AND
    D.FORM IN (:pFORM) AND
    D.FORM_VERS IN (:pFORM_VERS) AND
    D.DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') AND
    D.CUIIO NOT IN (
      SELECT DISTINCT CUIIO FROM USER_EREPORTING.DATA_ALL_PRIMIT
      WHERE 
        PERIOADA = :pPERIOADA AND
        FORM IN (:pFORM) AND
        ID_SCHEMA = '2' AND
        DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
    )
) D
INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
  
) L
INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = L.CODUL
CROSS JOIN (
  SELECT
    DECODE(CS.CODUL, 
      '0000000','01','0140000','02',
      '0110000','02','0120000','02','0150000','02'
       ) AS NR_ROW,
    CS.DENUMIRE AS NUME_ROW,
    CS.CODUL AS CS_CUATM
  FROM CIS2.VW_CL_CUATM CS
  WHERE CS.CODUL IN (
    '0000000','0110000','0120000'
  )
) CR 
WHERE 1=1
GROUP BY 
  CR.NUME_ROW, 
  TO_NUMBER(CR.NR_ROW),
  CR.CS_CUATM 
ORDER BY
  CR.NR_ROW
