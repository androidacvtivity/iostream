
      SELECT DISTINCT FC.CUIIO,
                   FC.CUIIO_VERS,
                   L.CUATM
                  
                   FROM (
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (2,3,4,5) AND CUIIO_VERS <= 476
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (2,3,4,5) AND FC.STATUT <> '3' ) FC 
             
             
                                                LEFT JOIN USER_BANCU.IDNO L ON L.CUIIO = FC.CUIIO
                                                
                                                
                                                WHERE 
             
                                                L.CUIIO IS NOT NULL 
             
          
        
         
               
               
