   SELECT
        ID_SCHEMA,
        PERIOADA,
        FORM,
        FORM_VERS,
        DENUMIRE,
        COUNT (DISTINCT CUIIO) AS CNT
            
         
        FROM 

        (
                SELECT 
                DISTINCT D.CUIIO,
                D.ID_SCHEMA,
                D.PERIOADA,
                D.FORM,
                D.FORM_VERS,
                M.DENUMIRE
                
                
                        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                                            INNER JOIN CIS2.MD_FORM M ON M.FORM = D.FORM AND M.FORM_VERS = D.FORM_VERS 
                        
                      
                        
                        
                        
                        WHERE 
                        D.ID_SCHEMA = 2
                        AND 
                        
                        D.PERIOADA  IN  (1060,2012)
                        
                       
                      
                        )
                        
                        
                        GROUP BY
                            ID_SCHEMA, 
                            PERIOADA,
                            FORM,
                            FORM_VERS,
                            DENUMIRE   
                            
                            
                            ORDER BY 
                            FORM,
                            FORM_VERS,
                            DENUMIRE            
                         
                        