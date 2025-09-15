SELECT ------------------------------------------------

L.CUIIO,
L.CAEM2

FROM 

(

SELECT FC.CUIIO,
   --    FC.CUIIO_VERS,
       R.CAEM2  
              FROM(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 2009 
             
             ) FC INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO  AND R.CUIIO_VERS = FC.CUIIO_VERS
             
             
             WHERE
               1=1
               
   
               
               ORDER BY
               FC.CUIIO_VERS ) L INNER  JOIN (
               
               ------------------------------------------------------------------------------------
SELECT FC.CUIIO,
       FC.CUIIO_VERS,
       R.CAEM2  
              FROM(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (18) AND CUIIO_VERS <= 1065
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (18) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 1004 
             
             ) FC INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO  AND R.CUIIO_VERS = FC.CUIIO_VERS
             
             
             WHERE
               1=1
               
               AND R.CAEM2 IS  NULL 
       
    
               
               ORDER BY
               FC.CUIIO_VERS
               ) R ON R.CUIIO = L.CUIIO
               
               
--               WHERE 
--               
--               R.CUIIO IS  NULL 
               
               
               