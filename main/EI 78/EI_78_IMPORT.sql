        SELECT 
              COUNT (DISTINCT D.CUIIO) AS CNT
            
                FROM CIS2.VW_DATA_ALL D
                
                WHERE
                
                D.FORM IN (:pFORM)
                AND D.PERIOADA IN (1051,1050,1049,1048)
                AND D.CAPITOL IN (407)
              --  AND D.CUIIO =  2744457
                AND D.RIND IN ('1')
                AND (D.COL4) > 0 
    

                