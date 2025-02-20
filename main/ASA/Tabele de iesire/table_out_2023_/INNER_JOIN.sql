SELECT  
    DISTINCT 
    D.CUIIO,
    D.CUIIO_VERS,
    MAX(CASE WHEN  D.ID_MD IN (61832) THEN  D.COL31 ELSE NULL END)  AS CAEM_ACT,
    
    CASE WHEN MAX(CASE WHEN  D.ID_MD IN (61832) THEN  D.COL31 ELSE NULL END) IS NULL 
 THEN    MAX(SUBSTR(R.CAEM2,2,4))  ELSE MAX(CASE WHEN  D.ID_MD IN (61832) THEN  D.COL31 ELSE NULL END)  END 
 
 AS CAEM2_ACTUALIZAT,
    NVAL(SUM(CASE WHEN  D.ID_MD IN (59334,59336,59337,59338,59339,59340,59341,59342,59343,59344,59345,59346) THEN  D.COL1 ELSE 0 END))  AS COL0,  
    NVAL(SUM(CASE WHEN  D.ID_MD IN (69986) THEN  D.COL4 ELSE 0 END))  AS COL4,
    NVAL(SUM(CASE WHEN  D.ID_MD IN (69986) THEN  D.COL4 ELSE 0 END))  AS PERS
        
   
    
    
    --61832 
FROM   
    CIS2.DATA_ALL D   INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS   
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA --AND

 AND  D.CUIIO=41175467
 GROUP BY 
 D.CUIIO,
 D.CUIIO_VERS
 
 
 HAVING 
 NVAL(SUM(CASE WHEN  D.ID_MD IN (62382,62413) THEN  D.COL1 ELSE 0 END)) > 0
 
 AND 
  NVAL(SUM(CASE WHEN  D.ID_MD IN (62451) THEN  D.COL1 ELSE 0 END)) > 0