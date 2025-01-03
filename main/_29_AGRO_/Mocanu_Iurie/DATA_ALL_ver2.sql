SELECT 
D.CUIIO,
SUBSTR(TO_CHAR(D.CUIIO), -2) LAS_CUIIO_2,
D.CUATM,
SUBSTR(TO_CHAR(D.CUATM), 1,2) FIRST_CUATM_2,
CASE WHEN 
SUBSTR(TO_CHAR(D.CUIIO), -2) = SUBSTR(TO_CHAR(D.CUATM), 1,2) THEN 
SUBSTR(TO_CHAR(D.CUIIO), 1, LENGTH(TO_CHAR(D.CUIIO)) - 2) ELSE TO_CHAR(D.CUIIO) END  AS NEW_CUIIO,


D.RIND,
SUM(D.COL1) AS COL1 

FROM CIS2.VW_DATA_ALL D 
        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 

        

WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (45)                
  AND D.RIND IN ('1440')
  
 -- AND D.CUIIO = 4147293462
  
  
 -- AND D.CUIIO  LIKE '%'||41070998||'%' 
  
GROUP BY 
D.CUIIO,
R.IDNO,
R.DENUMIRE,
D.CUATM,
D.RIND

  

--HAVING 
--
--SUBSTR(TO_CHAR(D.CUIIO), -2) = SUBSTR(TO_CHAR(D.CUATM), 1,2)
  ORDER BY
  
   D.CUIIO   
