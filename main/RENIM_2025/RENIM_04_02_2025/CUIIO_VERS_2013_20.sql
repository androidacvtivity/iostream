------------------------------------------------------------------------------------
--UPDATE CIS2.FORM_CUIIO
--
--SET STATUT = '3'

SELECT *
FROM CIS2.FORM_CUIIO 

WHERE 
CUIIO IN (

SELECT R.CUIIO
FROM USER_BANCU.INOV_1 L RIGHT JOIN (
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
                                  WHERE FORM IN (48) AND CUIIO_VERS <= 2013
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (48) AND FC.STATUT <> '3'
             --and FC.FORM_VERS = 1004 
             
             ) FC
             
             
             WHERE
               1=1

) R  ON R.CUIIO = L.CUIIO


WHERE 
L.CUIIO  IS NULL 
)


AND FORM = 48 AND CUIIO_VERS = 2013

AND FORM_VERS = 2000

AND STATUT = '1'