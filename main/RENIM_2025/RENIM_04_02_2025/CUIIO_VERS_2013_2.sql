     CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_2_IN_NOT_2014_FORM_CUIIO

AS
SELECT FC.CUIIO,
       FC.CUIIO_VERS

      

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
                                  WHERE FORM IN (8) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (8) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             ) FC
             
             
             WHERE
             
             FC.CUIIO_VERS <> 2014 ;
             
             
          CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_2_IN_NOT_2014_RENIM

AS        
             
             
             SELECT 
 
        TRIM(L.CUIIO) CUIIO
        
       
        FROM   USER_BANCU.VW_2_IN_NOT_2014_FORM_CUIIO L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =   2014 --   TRIM(L.CUIIO_VERS) 
                        
                        WHERE
                        
                        C.CUIIO IS  NULL; 