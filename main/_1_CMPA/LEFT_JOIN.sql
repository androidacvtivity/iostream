


                                        SELECT      
                                        R.UNIT_CODE
                                        FROM               
                                        (
                                        SELECT 
                                        DISTINCT D.UNIT_CODE   

                                        FROM CIS2.VW_DATA_ALL_GC D
                                        
                                            WHERE
                                            
                                            D.PERIOADA IN (:pPERIOADA)
                                            AND D.FORM IN (:pFORM) ) L RIGHT  JOIN (
                                            
                                            SELECT 
FC.UNIT_CODE, 
FC.UNIT_CODE_VERS,
FC.NR_GOSP,
FC.NR_MAPS,
FC.FORM,
FC.FORM_VERS,
FC.STATUT    
  FROM CIS2.FORM_REG_UNIT_GC  FC
       INNER JOIN (  
       
       SELECT UNIT_CODE, 
       
       
       
       MAX (UNIT_CODE_VERS) UNIT_CODE_VERS,
       NR_GOSP,
       NR_MAPS
                       FROM CIS2.FORM_REG_UNIT_GC
                      WHERE FORM IN (:pFORM) AND UNIT_CODE_VERS <= :pPERIOADA
                      
                      
                   GROUP BY 
                   UNIT_CODE,
                    NR_GOSP,
                     NR_MAPS
                   
                   
                   
                   
                   
                   ) BB
           ON (    BB.UNIT_CODE = FC.UNIT_CODE
               AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS
               AND BB.NR_GOSP = FC.NR_GOSP
               AND BB.NR_MAPS = FC.NR_MAPS
               
               )
 WHERE FC.FORM IN (:pFORM) 
 
 AND FC.STATUT <> '3'
                                            ) R ON R.UNIT_CODE = L.UNIT_CODE
                                            
                                            
                                            
                                            WHERE 
                                            L.UNIT_CODE IS NULL 
                                            
                                             
                                            