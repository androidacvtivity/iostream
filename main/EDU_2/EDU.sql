SELECT 
DISTINCT D.CUIIO


FROM CIS2.VW_DATA_ALL D 

WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM)
 
--   D.CAPITOL IN (1032) 

GROUP BY 
D.CUIIO 


--HAVING 
--SUM(CASE WHEN D.CAPITOL IN (1032) AND D.RIND IN ('020')  THEN NVAL(D.COL1) ELSE 0 END) = 0 
--
--
--AND 
--
--SUM(CASE WHEN D.CAPITOL IN (1032) AND D.RIND IN ('020')  THEN NVAL(D.COL3) ELSE 0 END) = 0  
