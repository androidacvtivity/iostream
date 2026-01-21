------------------------------------------------------------------------------------
--UPDATE CIS2.FORM_CUIIO
--
--SET STATUT = '3'

SELECT *
FROM CIS2.FORM_CUIIO 

WHERE 
CUIIO IN (

SELECT R.CUIIO
FROM USER_BANCU.CC_1_2025 L RIGHT JOIN (
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
                                  WHERE FORM IN (12) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (12) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 2000 
             
             ) FC
             
             
             WHERE
               1=1

) R  ON R.CUIIO = L.CUIIO


WHERE 
L.CUIIO  IS NULL 
)


AND FORM = 12 AND CUIIO_VERS = 2014

AND FORM_VERS = 2000

AND STATUT = '1';




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
                                  WHERE FORM IN (71) AND CUIIO_VERS <= 2015
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (71) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 2011 ) FC
             
             
             
             WHERE 
             
             FC.CUIIO_VERS =  2015