

    SELECT 
        DISTINCT 
       R.ITEM_CODE,
        R.NAME,
        R.A01
    
    FROM CIS2.VW_CLS_CLASS_ITEM R
    
    WHERE 
    R.CLASS_CODE IN ('CSPM2')
    AND R.A01 <> '1'