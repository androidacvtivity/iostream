------------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)



------------------------------------------------

SELECT   
        L.CUIIO,
        2014 CUIIO_VERS,
        4 FORM,
        2000 FORM_VERS,
        '1' STATUT 
      
         
         FROM USER_BANCU.TR_AUTO_2025 L LEFT JOIN (SELECT CUIIO 

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
AND FORM_VERS = 2000
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
         
