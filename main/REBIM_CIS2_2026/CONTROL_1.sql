


--Find duplicates CUIIO -- SQL Oracle 



--SELECT D.*
--FROM
--(
SELECT 
                   L.CUIIO,
                   L.CUIIO_VERS,
                   L.FORM,
                   L.FORM_VERS,
                   L.STATUT,
                   
                   R.CONTROL,
  R.CONTROL_VERS,  
  R.PERIOADA,      
  R.CUIIO,         
  R.CUIIO_VERS,    
  R.FORM,          
  R.FORM_VERS,     
  R.CAPITOL,       
  R.CAPITOL_VERS,  
  R.ID_MD,         
  R.REZULTAT,      
  R.DATA_REG      
                   
                  


FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM( 

SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (8) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (8) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             
             ) FC
             
             WHERE 
             
             FC.CUIIO_VERS <>   2014) L  INNER JOIN CIS2.CONTROL R ON L.CUIIO = R.CUIIO    AND R.PERIOADA IN (2014)





--WHERE 
--R.FORM = 8

ORDER BY 
R.CUIIO 