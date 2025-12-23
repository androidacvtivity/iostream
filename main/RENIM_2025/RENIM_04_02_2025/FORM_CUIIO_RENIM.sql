
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   R.CUATM,
                   R.CFP,
                   R.CFOJ,
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
             and FC.FORM_VERS = 2000 ) FC 
             
                                        INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                        
             
             
             WHERE
             
             FC.CUIIO_VERS  = 2014
             
            AND R.CAEM2 IS NULL 
             
             
--             AND R.CUIIO IN (
--             
--             SELECT 
-- 
--        TRIM(L.CUIIO) CUIIO 
--               FROM   USER_BANCU.TR_AUTO_2025 L
--             )