        SELECT 
           DISTINCT

           D.CUIIO,
           D.T_XML_FORM_ID,
           MAX(D.DATA_REG) PRIMIT_DATA_REG,
           DD.FORMID,
 -- DD.XML,
  DD.STATUS,
  DD.FORM_TYPE,
  DD.DATA_REG,
  DD.CHECK_CONFIRM,
  DD.MESAJ,
  DD.CUIIO,
    LENGTH(DD.CUIIO) STR_CUIIO,
  DD.SEND_REQUEST,
  DD.SEND_ATTEMPTS,
  DD.PROCESSING_MESSAGE 
            
           FROM   USER_EREPORTING.VW_DATA_ALL_PRIMIT D INNER JOIN USER_EREPORTING.F_XML_FORMS DD ON D.T_XML_FORM_ID = DD.FORMID
                  --  USER_EREPORTING.VW_DATA_ALL 
           
           WHERE
           
           D.T_XML_FORM_ID IN (
           
      SELECT 
 FORMID
          FROM  USER_EREPORTING.F_XML_FORMS
          WHERE
FORM_TYPE IN  -- ('1-turism_23',
('m1')
 AND DATA_REG >= TO_DATE('01/01/2026 08:00:49', 'MM/DD/YYYY HH24:MI:SS')
           ) 
           
           
           
           GROUP BY
              D.T_XML_FORM_ID,
           D.CUIIO,
                      DD.FORMID,
 -- DD.XML,
  DD.STATUS,
  DD.FORM_TYPE,
  DD.DATA_REG,
  DD.CHECK_CONFIRM,
  DD.MESAJ,
  DD.CUIIO,
    LENGTH(DD.CUIIO),
  DD.SEND_REQUEST,
  DD.SEND_ATTEMPTS,
  DD.PROCESSING_MESSAGE 
           
           ORDER BY 
           PRIMIT_DATA_REG  desc