--
--CREATE OR REPLACE FORCE VIEW USER_BANCU.DATA_ALL_RIND_10
--(CUIIO,
-- COL1,
-- COL2)
--AS 
SELECT
  A.CUIIO,
  SUM(CASE WHEN A.RIND IN ('1.2')   THEN A.CUIIO END) AS COL1,
 
FROM
(SELECT
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
  D.RIND IN ('1.2')
  
--  AND D.CUIIO IN (41291133,
--20477690)


) A
  INNER JOIN CIS2.VW_CL_CUATM C ON(A.CUATM = C.CODUL)
     WHERE 
  A.CAEM2 NOT LIKE 'A%' 

GROUP BY
A.CUIIO

HAVING 
COUNT(DISTINCT CASE WHEN A.RIND IN ('10') AND CIS2.NVAL(A.COL1) IN (1)  THEN A.CUIIO END) > 0 