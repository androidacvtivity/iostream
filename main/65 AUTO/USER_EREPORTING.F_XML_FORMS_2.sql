SELECT DISTINCT f.FORMID,
       f.CUIIO
--       x.line_no,
--       x.c1,
--       x.c2,
--       x.c3
FROM USER_EREPORTING.F_XML_FORMS f,
     XMLTABLE(
       '/dec/DataSet/Data/CAP5_R'
       PASSING XMLTYPE(f.XML)
       COLUMNS
         line_no VARCHAR2(20)   PATH '@line',
         c1      VARCHAR2(4000) PATH 'CAP5_R_C1',
         c2      VARCHAR2(4000) PATH 'CAP5_R_C2',
         c3      VARCHAR2(4000) PATH 'CAP5_R_C3'
     ) x
WHERE f.FORM_TYPE = '65-auto-22'
  AND f.DATA_REG >= TO_DATE('04/01/2026 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
  AND f.STATUS IN ('5')
  AND (
       TRIM(x.c1) IS NOT NULL
    OR TRIM(x.c2) IS NOT NULL
    OR TRIM(x.c3) IS NOT NULL
  );