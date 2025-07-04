SELECT DISTINCT
  PERIOADA,
  CASE
    WHEN LENGTH(CUIIO)>=8 THEN
      CASE WHEN LENGTH(CUIIO)=9 THEN SUBSTR(CUIIO,1,7) ELSE SUBSTR(CUIIO,1,8) END
  ELSE
    TO_CHAR(CUIIO) END,
  FORM,
  ID_SCHEMA
  --INTO  vPERIOADA, vCUIIO, vFORM, vID_SCHEMA
FROM
(SELECT DISTINCT PERIOADA, CUIIO, FORM, ID_SCHEMA
FROM DATA_ALL_FOR_VALIDATE
WHERE
T_XML_FORM_ID IN (TRIM(TO_CHAR(:pF_XML_FORM_ID)))
UNION
SELECT DISTINCT PERIOADA, CUIIO, FORM, ID_SCHEMA
FROM DATA_ALL_FOR_VALIDATE_FR
WHERE
T_XML_FORM_ID IN (TRIM(TO_CHAR(:pF_XML_FORM_ID))))