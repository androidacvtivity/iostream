                
                CREATE OR REPLACE FORCE VIEW VW_DATA_ALL_490
                AS 
                  SELECT             
                   DISTINCT 
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   R.DENUMIRE,
                   R.CUATM,
                   R.CFP,
                   R.CFOJ,
                   R.CAEM2
              FROM
              ( 
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (3) AND CUIIO_VERS <= 490
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (3) AND FC.STATUT <> '3'
             ) FC
             INNER JOIN CIS.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS;
             
             
             CREATE OR REPLACE FORCE VIEW VW_DATA_ALL_491
                AS 
                  SELECT             
                   DISTINCT 
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   R.DENUMIRE,
                   R.CUATM,
                   R.CFP,
                   R.CFOJ,
                   R.CAEM2
              FROM
              ( 
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (3) AND CUIIO_VERS <= 491
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (3) AND FC.STATUT <> '3'
             ) FC
             INNER JOIN CIS.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS;
             
             
             
             
             
             SELECT 
                   R.CUIIO,
                   R.CUIIO_VERS,
                   L.DENUMIRE,
                   L.CUATM,
                   L.CFP,
                   L.CFOJ,
                   L.CAEM2
                   FROM  VW_DATA_ALL_491 R LEFT JOIN  VW_DATA_ALL_490 L ON L.CUIIO = R.CUIIO 
                   
                   WHERE 
                   L.CUIIO IS NOT NULL;
              