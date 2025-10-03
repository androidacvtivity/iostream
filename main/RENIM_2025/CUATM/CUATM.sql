



   SELECT 
   
            L.*
            
               
            FROM CIS2.VW_CLS_CLASS_ITEM L INNER JOIN  (

            SELECT
            CLASS_CODE, 
            ITEM_CODE,
            MAX(ITEM_CODE_VERS) ITEM_CODE_VERS
               
            FROM CIS2.VW_CLS_CLASS_ITEM
            
                WHERE 
                CLASS_CODE IN ('CUATM')
                
                GROUP BY
                 CLASS_CODE, 
                 ITEM_CODE
                
                ) R ON R.ITEM_CODE =  L.ITEM_CODE AND L.ITEM_CODE_VERS =  R.ITEM_CODE_VERS AND R.CLASS_CODE = L.CLASS_CODE
                
                
                 WHERE 
                 L.CLASS_CODE IN ('CUATM')