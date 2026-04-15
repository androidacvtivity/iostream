SELECT *
FROM USER_EREPORTING.F_XML_FORMS f
WHERE f.FORM_TYPE = '65-auto-22'
  AND f.DATA_REG >= TO_DATE('04/01/2026 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
  AND f.STATUS IN ('5')
  AND XMLEXISTS(
        '/dec/DataSet/Data/CAP5_R[
            string-length(normalize-space(CAP5_R_C1)) > 0
         or string-length(normalize-space(CAP5_R_C2)) > 0
         or string-length(normalize-space(CAP5_R_C3)) > 0
        ]'
        PASSING XMLTYPE(f.XML)
      )
      
      
      ORDER BY 
      DATA_REG DESC