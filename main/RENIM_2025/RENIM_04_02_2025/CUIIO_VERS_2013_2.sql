-- UPDATE CIS2.FORM_CUIIO
-- 
-- SET STATUT = '3'

SELECT *

FROM CIS2.FORM_CUIIO 

WHERE
    CUIIO IN ( SELECT FC.CUIIO 
              FROM ( 
              
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (63) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (63) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             ) FC
             
             
             WHERE
             
             1=1
             
             AND FC.CUIIO IN (

SELECT 
    CUIIO 
FROM  USER_BANCU.R_63
)
 AND FC.CUIIO_VERS =  2014 )
 
 
 AND FORM IN (63)
 AND FORM_VERS IN (2000)
 AND STATUT = '1'
 AND CUIIO_VERS = 2014;
 
 
 
 SELECT 
    CUIIO 
 FROM USER_BANCU.R_63;
 
 
 
 
 UPDATE CIS2.FORM_CUIIO
-- 
 SET STATUT = '3'
 
 
-- SELECT *
--
--FROM CIS2.FORM_CUIIO 

WHERE
 
 CUIIO IN (
 SELECT 
    CUIIO 
 FROM USER_BANCU.R_63


)

AND CUIIO_VERS = 2015

AND FORM = 63

 AND FORM_VERS IN (2000)
 AND STATUT = '1';