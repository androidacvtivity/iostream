SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
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
                                  WHERE FORM IN (13) AND CUIIO_VERS <=  1066
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (13) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 1004 ) FC 
             
                                        INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                        
             
             
             WHERE
             
             R.CAEM2 IS   NULL 