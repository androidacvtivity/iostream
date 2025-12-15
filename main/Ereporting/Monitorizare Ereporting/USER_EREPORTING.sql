SELECT     
 DISTINCT 
 D.CUIIO,
 D.CUIIO_VERS  
 
    FROM  --CIS2.VW_DATA_ALL D
          USER_EREPORTING.VW_DATA_ALL D
    WHERE 
    1=1
    AND D.FORM IN (45)
    AND D.PERIOADA  IN (1067)
    -- AND USER_NAME IN ('e-Reporting')
    AND   D.CUIIO LIKE   40708424||'%';
    
    
    
    
    
    SELECT  D.CUIIO,
            MAX(D.CUIIO_VERS) CUIIO_VERS,
            D.FORM,
            D.FORM_VERS,
            D.STATUT   

 
    FROM  CIS2.FORM_CUIIO D
         
    WHERE 
    1=1
    AND D.FORM IN (45)
    --AND D.CUIIO_VERS  IN (1067)
  
    AND   D.CUIIO LIKE   4509775||'%'
    
    GROUP BY
    D.CUIIO,
            
            D.FORM,
            D.FORM_VERS,
            D.STATUT  
    ;
    
    
    
    SELECT     
 DISTINCT 
 D.CUIIO,
 D.CUIIO_VERS  
 
    FROM  --CIS2.VW_DATA_ALL D
          USER_EREPORTING.VW_DATA_ALL_PRIMIT D
    WHERE 
    1=1
    AND D.FORM IN (45)
    AND D.PERIOADA  IN (1067)
    -- AND USER_NAME IN ('e-Reporting')
    AND   D.CUIIO LIKE   4509775||'%';