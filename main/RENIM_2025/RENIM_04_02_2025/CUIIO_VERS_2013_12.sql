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
        1068 CUIIO_VERS,
        5 FORM,
        1004 FORM_VERS,
        '1' STATUT 
      
         
         FROM USER_BANCU.AUTO_65_1067 L LEFT JOIN (
         
         
         SELECT DISTINCT CUIIO 

FROM CIS2.FORM_CUIIO 

WHERE

CUIIO IN (

SELECT 
CUIIO
FROM  USER_BANCU.AUTO_65_1067

)

AND 

CUIIO_VERS IN (1068)
AND FORM IN (5)
AND FORM_VERS = 1004
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
FROM  USER_BANCU.AUTO_65_1067

)

AND 

CUIIO_VERS IN (1068)
AND FORM IN (5)
         
