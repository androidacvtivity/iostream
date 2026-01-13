----------------------------------------------------------------------------------

--------------------------------------------------------------------------
--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)



----------------------------------------------

SELECT   
        L.CUIIO,
        2015 CUIIO_VERS,
        71 FORM,
        2011 FORM_VERS,
        '1' STATUT 
      
         
         FROM USER_BANCU.TIC_1_26 L LEFT JOIN (
         
         
         SELECT DISTINCT CUIIO 

FROM CIS2.FORM_CUIIO 

WHERE

CUIIO IN (

SELECT 
CUIIO
FROM  USER_BANCU.TIC_1_26

)

AND 

CUIIO_VERS IN (2015)
AND FORM IN (71)
AND FORM_VERS = 2011
AND STATUT = '1'



) R ON R.CUIIO = L.CUIIO 

WHERE 
R.CUIIO IS NULL 

;

SELECT CUIIO 

FROM CIS2.FORM_CUIIO 

WHERE

CUIIO IN (

SELECT 
CUIIO
FROM  USER_BANCU.TR_AUTO_2025

)

AND 

CUIIO_VERS IN (2014)
AND FORM IN (4)
         
