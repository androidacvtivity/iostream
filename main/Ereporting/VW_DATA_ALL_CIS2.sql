SELECT 
DISTINCT CUIIO 

FROM USER_EREPORTING.VW_DATA_ALL
WHERE 
FORM IN  27

AND PERIOADA = 2013


AND CUIIO IN (

SELECT 
  CUIIO
        
        
          FROM  USER_EREPORTING.F_XML_FORMS
          
          
          WHERE
          1=1  
--
AND STATUS  =  '5' 
--AND 
--
----
AND  DATA_REG >= TO_DATE('01/20/2024 00:00:', 'MM/DD/YYYY HH24:MI:SS')
--------------------------------------------------------
--AND   CUIIO IN (
--
-- 41255321
--)
--  AND 
--  
--  FORM_TYPE = '1-ac'
----  OR 
AND   FORM_TYPE IN  ('24_agr_24') 
--   
--AND CUIIO IN (
--40583939,
--41583965
--)  
  
  
--  GROUP BY
--   FORMID,
----  XML,
--  STATUS,
--  FORM_TYPE,
--  DATA_REG,
--  CHECK_CONFIRM,
--  MESAJ,
--  CUIIO,
--    LENGTH(CUIIO) STR_CUIIO,
--  SEND_REQUEST,
--  SEND_ATTEMPTS,
--  PROCESSING_MESSAGE
  



  
)

--------------------------------------------------------------------------------