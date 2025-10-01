

       SELECT 
          UNIT_CODE,
       COL1
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
       