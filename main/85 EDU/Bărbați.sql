                SELECT 
                
                    D.ANUL,
                    ROUND(
                    (SUM(CASE WHEN D.RIND IN ('020','030') THEN NVL(D.COL9,0) ELSE 0 END) 
                    - SUM(CASE WHEN D.RIND IN ('020','030') THEN NVL(D.COL10,0) ELSE 0 END)) /
                    
                     (SUM(CASE WHEN D.RIND IN ('020','030') THEN NVL(D.COL1,0) ELSE 0 END) 
                    - SUM(CASE WHEN D.RIND IN ('020','030') THEN NVL(D.COL2,0) ELSE 0 END)) 
                    
                    * 100,1)  AS REZULT  
                
                        FROM CIS2.VW_DATA_ALL D
                        
                        WHERE 
                        --D.PERIOADA IN (:pPERIOADA)
                        --AND 
                        D.FORM =  17 
                        AND D.CAPITOL IN (1004)
                        AND D.RIND IN ('020','030') 
                        
                        GROUP BY 
                        D.ANUL    
                        
                        
                        
                        ORDER BY 
                        D.ANUL
                        