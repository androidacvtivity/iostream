SELECT 
UNIT_CODE,
COUNT (UNIT_CODE) AS CNT

    FROM USER_BANCU.REG_UNIT_GC3_2024
    
    GROUP BY 
    UNIT_CODE 
    
    HAVING 
    COUNT (UNIT_CODE) >  1; 