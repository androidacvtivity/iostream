 SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   R.CUATM,
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
                                  WHERE FORM IN (76) AND CUIIO_VERS <= 1065
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (76) AND FC.STATUT <> '3') FC  LEFT JOIN CUATM_CIS C ON C.CUIIO = FC.CUIIO 
                            INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS
             
             WHERE 
             C.CUIIO IS NOT NULL 
             
             
         