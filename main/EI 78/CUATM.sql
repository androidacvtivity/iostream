


        SELECT 
        
             SUM(D.COL4) AS COL1   
                
             FROM CIS2.VW_DATA_ALL D    
                                   INNER JOIN CIS2.VW_CLS_CLASS_ITEM  R ON (R.CLASS_CODE = 'CUATM' AND R.ITEM_CODE = D.CUATM)
             
             WHERE
             
             D.FORM IN (:pFORM)
             AND D.PERIOADA IN (:pPERIOADA) 
             AND D.CAPITOL = 405