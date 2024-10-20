
--CREATE OR REPLACE FORCE VIEW USER_BANCU.BS_RIND_10
--(CUIIO,
-- COL1,
-- COL2)
--AS 
SELECT
A.CUIIO,
--  TR.NR_TABLE,
--  TR.TABLE_DENUMIRE,
--  TR.RIND_DENUMIRE,
--  TR.ORDINE,
--  TR.RIND,
----  SUBSTR(A.CAEM2,1,1),
  COUNT(DISTINCT CASE WHEN A.RIND IN ('10') AND CIS2.NVAL(A.COL1) IN (1) AND (TR.RIND LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR (ROUND(BS.PERS_IT) >= CIS2.NVAL(TR.PERS_INIT) AND ROUND(BS.PERS_IT) <= CIS2.NVAL(TR.PERS_FINAL))) THEN A.CUIIO END) AS COL1,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('10') AND CIS2.NVAL(A.COL2) IN (1) AND (TR.RIND LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR (ROUND(BS.PERS_IT) >= CIS2.NVAL(TR.PERS_INIT) AND ROUND(BS.PERS_IT) <= CIS2.NVAL(TR.PERS_FINAL))) THEN A.CUIIO END) AS COL2
FROM
(

SELECT
  D.ANUL,
  D.CUIIO,
  D.CUATM,
  D.CAEM2,
  D.CAPITOL,
  D.RIND,
  D.COL1, 
  D.COL2
FROM 
  CIS2.VW_DATA_ALL D
WHERE
  D.PERIOADA IN (1062) AND
  D.FORM IN (74) AND 
  D.CAPITOL IN (1197) AND
  D.RIND IN ('10')
 -- AND D.CAEM2 NOT LIKE 'A%'
  AND D.CUIIO  IN (41291133,20477690)
 
) A LEFT JOIN
  CIS2.X_BAZA_SONDAJ BS ON (A.CUIIO=BS.CUIIO AND BS.ANUL=2024)
  CROSS JOIN 
  (
    
    SELECT 2 AS NR_TABLE, 'Clasa de marime' AS TABLE_DENUMIRE, 0 AS PERS_INIT, 999999 AS PERS_FINAL, NULL AS RIND, 'Total salariati' AS RIND_DENUMIRE, '1' AS ORDINE FROM DUAL 
  
  ) TR
GROUP BY

A.CUIIO

HAVING 

COUNT(DISTINCT CASE WHEN A.RIND IN ('10') AND CIS2.NVAL(A.COL1) IN (1) AND (TR.RIND LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR (ROUND(BS.PERS_IT) >= CIS2.NVAL(TR.PERS_INIT) AND ROUND(BS.PERS_IT) <= CIS2.NVAL(TR.PERS_FINAL))) THEN A.CUIIO END) > 0

