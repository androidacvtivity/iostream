
            SELECT 
            L.CUIIO 
            
            FROM (

            SELECT 
            DISTINCT D.CUIIO
            
                FROM CIS2.VW_DATA_ALL D
                
                WHERE 
                D.FORM IN (3)
                AND D.PERIOADA = :pPERIOADA_ANUL 
                ) L LEFT JOIN (
                
                  SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (3) AND CUIIO_VERS <= :pPERIOADA_ANUL 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (3) AND FC.STATUT <> '3'  
                
                ) R ON L.CUIIO = R.CUIIO
                
                WHERE 
                R.CUIIO IS NULL