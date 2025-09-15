------------------------------------------------------------------------------------
--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)
--
--

------------------------------------------------

SELECT   
        L.CUIIO,
        1065 CUIIO_VERS,
        18 FORM,
        1004 FORM_VERS,
        '1' STATUT 
      
         
         FROM USER_BANCU.CON_5 L LEFT JOIN (SELECT CUIIO 

FROM CIS2.FORM_CUIIO 

WHERE

CUIIO IN (

SELECT 
CUIIO
FROM  CON_5

)

AND 

CUIIO_VERS IN (1065)
AND FORM IN (18)
AND FORM_VERS = 1004
) R ON R.CUIIO = L.CUIIO 

WHERE 
R.CUIIO IS NULL 

;

--SELECT CUIIO 
--
--FROM CIS2.FORM_CUIIO 
--
--WHERE
--
--CUIIO IN (
--
--SELECT 
--CUIIO
--FROM  VINZARI_21
--
--)
--
--AND 
--
--CUIIO_VERS IN (1065)
--AND FORM IN (26)
--         
