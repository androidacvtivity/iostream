SELECT
DISTINCT 
  D.PERIOADA,
  D.CUIIO,
  D.COL2 AS COL1
  
FROM 
  CIS2.VW_DATA_ALL D
  
WHERE
 D.PERIOADA IN (1052,1053,1054,1055) AND
  
 
 
  D.FORM IN (26)AND   
  D.CAPITOL IN (367) AND
  D.RIND IN ('11')

AND D.CUIIO IN (
40758988,
40027227,
40984549
)
GROUP BY
   D.CUIIO,
   D.COL2,
   D.PERIOADA
   

   HAVING 
   
  NVAL(D.COL2) >= 1200 AND  NVAL(D.COL2) <= 2200
    
   ORDER BY
   D.CUIIO
   
   