--UPDATE CIS2.FORM_CUIIO 
--SET STATUT = '3'

SELECT *  ----------------
----
    FROM CIS2.FORM_CUIIO 
    
    
    WHERE 

CUIIO IN (
SELECT FC.CUIIO
      

              FROM
              ( 
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (4) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (4) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             ) FC
             
             
             WHERE
             
             FC.CUIIO IN (
            SELECT
               DISTINCT  CUIIO
            FROM  USER_BANCU.TR_AUTO_2025

          ) )

   

AND CUIIO_VERS = 2014
AND FORM = 4

AND FORM_VERS = 2000

AND STATUT = '1'
        
             