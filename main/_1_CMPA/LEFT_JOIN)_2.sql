

       SELECT 
       UNIT_CODE,
       COUNT (UNIT_CODE) AS CNT
     
       FROM  

      (  
       SELECT 
       UNIT_CODE,
       COL1
            
       FROM CMPA_1_2
       
       
       UNION ALL 
       
           SELECT 
       UNIT_CODE,
       COL1
            
       FROM CMPA_1_1
       )
       
       
       
       HAVING 
       COUNT (UNIT_CODE) > 1 
       GROUP BY 
       UNIT_CODE