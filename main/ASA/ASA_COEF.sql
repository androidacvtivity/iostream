SELECT 

CUIIO, 
CAEM2_ACTUALIZAT 
FROM

(
SELECT 
 
 DISTINCT D.CUIIO, 
 MAX( CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END )  AS CAEM2_ACTUALIZAT,
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2

 
FROM   
    CIS2.VW_DATA_ALL_COEF D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND

  D.CAPITOL IN (1129,100) 
--  AND D.CUIIO IN (40996334,41058201,37386492)
 GROUP BY D.CUIIO
--  D.CUIIO_VERS, D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA

  
HAVING
--  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)) >0
 
 )
 
 
 WHERE 
 
 CAEM2_ACTUALIZAT IN (
 
SELECT 
--CODUL,
SUBSTR(CODUL,2,5) AS CODUL_MOd

FROM CIS2.CL_CAEM2

WHERE 

CODUL LIKE 'A%'
 )