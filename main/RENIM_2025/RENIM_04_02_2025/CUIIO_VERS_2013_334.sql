SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                  
                   RR.CAEM2
              FROM (
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (74) AND CUIIO_VERS <= 1068
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (74) AND FC.STATUT <> '3' 
             and FC.FORM_VERS = 1004 ) FC  INNER JOIN CIS2.RENIM R  ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                           INNER JOIN  USER_BANCU.KATALOG_74_1068 RR ON RR.CUIIO = FC.CUIIO                                                  
             
--             WHERE 
--             
--             R.IDNO IS NULL 
             
             
             ORDER BY 
             R.CUIIO;
             
             
             
             
              SELECT TRIM(CUIIO) CUIIO,
                   TRIM(CUIIO_VERS) CUIIO_VERS,
                  
                   TRIM(CFP) CFP
              FROM     CFP 