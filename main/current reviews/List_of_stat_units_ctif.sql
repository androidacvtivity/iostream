



        SELECT 
        DISTINCT 
        D.FORM,
        D.FORM_VERS,
        D.ID_SCHEMA
        
        FROM    USER_EREPORTING.VW_DATA_ALL_FR_PRIMIT D
        
        WHERE 
        D.PERIOADA =  2010 

        GROUP BY
        D.FORM,
        D.FORM_VERS,
        D.ID_SCHEMA
        
--        HAVING 
--        
--        D.FORM_VERS = 1004
        
        ORDER BY 
        D.ID_SCHEMA,
        D.FORM