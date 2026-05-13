--INSERT INTO CIS2.SYS_USER_ACCES
--(
--       ID_USER, 
--               CUATM,
--               FORM,---           
--               FORM_VERS, 
--               ISADMIN,
--               ACCES_TYPE,
--               CAPITOL_ACCES,   
--               DATA_REG 
--)
--

            SELECT 
               2047 ID_USER, 
               CUATM,
               FORM,           
               FORM_VERS, 
               ISADMIN,
               ACCES_TYPE,
               CAPITOL_ACCES,   
               DATA_REG       
              FROM CIS2.SYS_USER_ACCES
              
              WHERE 
              
              CUATM = '0300000'
                   AND  ID_USER = 2045