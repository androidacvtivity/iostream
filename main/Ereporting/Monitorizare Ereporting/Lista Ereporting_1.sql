SELECT 
 FORMID,
  STATUS,
  FORM_TYPE,
  DATA_REG,
  CUIIO,
    LENGTH(CUIIO) STR_CUIIO,
  SEND_REQUEST,
  SEND_ATTEMPTS,
  PROCESSING_MESSAGE 
        
        
          FROM  USER_EREPORTING.F_XML_FORMS
          
          
          WHERE
-- in USER_EREPORTING.F_XML_FORMS in total  10.00 - 11.00  -- 276 
-- doar statut 2 -- 146 
-- doar statut 5 - 126 
 
-- FORM_TYPE NOT IN  ('2-inv-anual','ind-ts','1-cc','consts','1-b-sc')
--FORM_TYPE IN  ('1-a-sc')
-- AND 
STATUS =   '5' AND  

  
 
( DATA_REG >= TO_DATE('01/29/2026 13:00:00', 'MM/DD/YYYY HH24:MI:SS')
 AND  DATA_REG <= TO_DATE('01/29/2026 14:00:00', 'MM/DD/YYYY HH24:MI:SS'))
  
 


 ORDER BY 
 
 DATA_REG DESC;
 
 
       SELECT
 DISTINCT CUIIO         
 -- FORMID
          FROM  USER_EREPORTING.F_XML_FORMS
          WHERE
FORM_TYPE IN  ('1-turism_23')
 AND DATA_REG >= TO_DATE('01/01/2026 08:00:49', 'MM/DD/YYYY HH24:MI:SS')
 
 AND STATUS =  '5' 
 