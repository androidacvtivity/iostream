
SELECT
DISTINCT 
D.CUIIO,
R.DENUMIRE,
SUM (CASE WHEN D.CAPITOL = 1032 THEN  NVAL(D.COL1) + NVAL(D.COL2) + NVAL(D.COL3) ELSE 0 END) AS COL1
FROM 
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  
  D.FORM = 40  
 

GROUP BY
D.CUIIO,
R.DENUMIRE
HAVING
SUM (CASE WHEN D.CAPITOL = 1032 THEN  NVAL(D.COL1) + NVAL(D.COL2) + NVAL(D.COL3) ELSE 0 END )  =  0
   



  