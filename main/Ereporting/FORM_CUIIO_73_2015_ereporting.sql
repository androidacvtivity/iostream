--CREATE OR REPLACE FORCE VIEW USER_BANCU.F_XML_FORMS_21_vanz
--
--AS

SELECT 
  L.FORMID,
  L.CUIIO,
  D.DESCRIPTION,
  L.STATUS,
  L.FORM_TYPE,
  L.DATA_REG,
  L.CHECK_CONFIRM,
  L.MESAJ,
  L.PROCESSING_MESSAGE 
 
    FROM  USER_EREPORTING.F_XML_FORMS L INNER JOIN USER_EREPORTING.F_XML_FORMS_STATUS D  ON L.STATUS = D.COD_STATUS
          WHERE
          1=1  
          AND  DATA_REG >= TO_DATE('05/01/2026 00:00:', 'MM/DD/YYYY HH24:MI:SS')
         -- AND STATUS  =  '2'  
          AND   FORM_TYPE IN  ('3-agr') 

          AND CUIIO  IN  (
 SELECT FC.CUIIO 
              FROM ( 
              
              SELECT FC.CUIIO,   --4497457
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (73) AND CUIIO_VERS <= 2015
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (73) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             ) FC
             
             
             WHERE
             
             1=1
             
             AND FC.CUIIO IN (

4500656, 4500644, 5693947, 4500478, 4500573, 4500627

)
  )


 ORDER BY 
-- 
DATA_REG DESC 