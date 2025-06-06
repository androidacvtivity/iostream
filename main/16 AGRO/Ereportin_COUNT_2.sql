SELECT 
  REGEXP_SUBSTR(x.XML_NODE_NAME, 'R[0-9]+') AS MOD_XML_NODE_NAME,
  x.XML_NODE_NAME,
  x.XML_NODE_VALUE,
  h.CUIIO AS XML_CUIIO,
  h.ENT_NAME AS DENUMIRE,
  h.IDNO AS XML_IDNO,
  f.DATA_REG AS DATA_REG
FROM F_XML_FORMS f,
     XMLTABLE(
       '/dec/DataSet/Header'
       PASSING XMLTYPE(f.XML)
       COLUMNS 
         CUIIO VARCHAR2(20) PATH 'CUIIO',
         IDNO  VARCHAR2(20) PATH 'IDNO',
         ENT_NAME  VARCHAR2(20) PATH 'ENT_NAME'
         
        
         
     ) h,
     XMLTABLE(
       '//dec/DataSet/Data/*'
       PASSING XMLTYPE(f.XML)
       COLUMNS 
         XML_NODE_NAME  VARCHAR2(100) PATH 'name()',
         XML_NODE_VALUE VARCHAR2(100) PATH 'text()'
     ) x
WHERE 
--  f.DATA_REG >= TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
--  
--  AND f.STATUS = 5
  
  --AND 
  f.FORMID IN (
  SELECT FORMID

FROM F_XML_FORMS f

WHERE

 f.DATA_REG >= TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
  AND f.FORM_TYPE = '16_agr_23'
  AND f.STATUS = 5
  
  AND f.FORMID = 23504983
  AND x.XML_NODE_NAME IS NOT NULL 
  )
  AND TRIM(REGEXP_SUBSTR(x.XML_NODE_NAME, 'R[0-9]+')) IN (
      'R0688','R0689','R0690','R0691','R0692','R0693','R0694','R0695',
      'R0696','R0697','R0698','R0699','R0700','R0701','R0702','R0703',
      'R0704','R0705'
  )
  
  AND x.XML_NODE_VALUE IS NOT NULL
  
  ORDER BY
  f.DATA_REG DESC 
