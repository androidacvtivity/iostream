

SELECT 
 FORMID,
--  XML,
  STATUS,
  FORM_TYPE,
  DATA_REG,
  CHECK_CONFIRM,
  MESAJ,
  CUIIO,
    LENGTH(CUIIO) STR_CUIIO,
  SEND_REQUEST,
  SEND_ATTEMPTS,
  PROCESSING_MESSAGE 
        
        
          FROM  USER_EREPORTING.F_XML_FORMS
          
          
          WHERE
          1=1 AND 
--
--AND 
STATUS  =  '5' AND 
--
----
-- DATA_REG >= TO_DATE('03/01/2023 00:00:', 'MM/DD/YYYY HH24:MI:SS')

-- AND CUIIO = 13706
   
  (
  FORM_TYPE = '16_agr_23'
----  OR 
--  FORM_TYPE = '1-ac' 
  ) 
  
  
  AND CUIIO IN (
  
  
  SELECT 
  CUIIO 
  FROM USER_BANCU.CTIF_16_AGRO
  
  )
  
  
  
  GROUP BY
   FORMID,
--  XML,
  STATUS,
  FORM_TYPE,
  DATA_REG,
  CHECK_CONFIRM,
  MESAJ,
  CUIIO,
--    LENGTH(CUIIO) STR_CUIIO,
  SEND_REQUEST,
  SEND_ATTEMPTS,
  PROCESSING_MESSAGE
  



 ORDER BY 
 
DATA_REG DESC 