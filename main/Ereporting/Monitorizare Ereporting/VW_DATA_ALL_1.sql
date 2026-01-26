        SELECT 
           DISTINCT
           T_XML_FORM_ID,
           CUIIO,
           MAX(DATA_REG) DATA_REG
            
           FROM   USER_EREPORTING.VW_DATA_ALL_PRIMIT
                  --  USER_EREPORTING.VW_DATA_ALL 
           
           WHERE
           
           T_XML_FORM_ID IN (
           
           26531630


           ) 
           
           
           
           GROUP BY
              T_XML_FORM_ID,
           CUIIO