
SELECT 
ITEM_CODE,
MAX(ITEM_CODE_VERS)

FROM CIS2.VW_CLS_CLASS_ITEM


WHERE 
CLASS_CODE IN ('CUATM') AND  
ITEM_CODE IN ('0154000')

GROUP BY 


;




-- INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
--         
--          INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
--          
--     
--          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')