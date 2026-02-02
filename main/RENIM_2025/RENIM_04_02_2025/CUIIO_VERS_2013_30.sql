--SELECT DISTINCT  CUIIO 
--FROM CIS2.FORM_CUIIO 
--
--WHERE 
--CUIIO IN (



SELECT *
FROM USER_BANCU.VW_2_IN_NOT_2014_FORM_CUIIO
;

--     CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_2_IN_NOT_2014_FORM_CUIIO
--
--AS


SELECT 
CUIIO,
CUIIO_VERS 
FROM 
(
SELECT 
R.CUIIO,
R.CUIIO_VERS
FROM USER_BANCU.INV_2_2025 L RIGHT JOIN (
SELECT FC.CUIIO,
       FC.CUIIO_VERS  
              FROM(
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
             and FC.FORM_VERS = 2000 
             
             ) FC
             
             
             WHERE
               1=1

) R  ON R.CUIIO = L.CUIIO


WHERE 
L.CUIIO  IS NULL 
)


WHERE 

CUIIO_VERS <> 2014