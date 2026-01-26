 SELECT 
           DISTINCT
        
           CUIIO,
           MAX(DATA_REG) DATA_REG
            
           FROM     --USER_EREPORTING.VW_DATA_ALL_PRIMIT
                    USER_EREPORTING.VW_DATA_ALL 
           
           WHERE
             PERIOADA IN (:pPERIOADA)
             and CUIIO LIKE :pCUIIO||'%'


AND 

FORM IN (:pFORM)

           
           GROUP BY
      
           CUIIO







--- 20284620