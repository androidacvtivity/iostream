        SELECT 
             D.*
            
                FROM CIS2.VW_DATA_ALL D
                
                WHERE
                
                D.FORM IN (:pFORM)
                AND D.PERIOADA IN (:pPERIOADA)
                AND D.CAPITOL IN (407)
                AND D.CUIIO =  2744457
                AND D.RIND IN ('1')
                AND (D.COL4) > 0 
    

                