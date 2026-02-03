




                SELECT 
                    L.CUIIO,
                    L.CUIIO_VERS

                FROM USER_BANCU.VW_FORM_CUIIO_2013 L LEFT JOIN  CIS2.RENIM R ON R.CUIIO  = L.CUIIO  AND R.CUIIO_VERS = 2014
                
                        WHERE 
                        R.CUIIO IS NULL; 