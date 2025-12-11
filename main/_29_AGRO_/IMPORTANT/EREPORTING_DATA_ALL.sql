                   SELECT
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS   
                        FROM USER_EREPORTING.VW_DATA_ALL FC
                        
                        WHERE
                        FC.PERIOADA IN (:pPERIOADA)
                        AND FC.FORM  IN (:pFORM)
                        AND   FC.CUIIO LIKE :pCUIIO||'%';
                        
                        
                        
       
                     
                        
                SELECT
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS   
                        FROM USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE FC
                        
                        WHERE
                        FC.PERIOADA IN (:pPERIOADA)
                        AND FC.FORM  IN (:pFORM)
                        AND   FC.CUIIO LIKE :pCUIIO||'%';
                        
                        
                        
                        
              SELECT
                   DISTINCT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS   
                        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT FC
                        
                        WHERE
                        FC.PERIOADA IN (:pPERIOADA)
                        AND FC.FORM  IN (:pFORM)
                        AND   FC.CUIIO LIKE :pCUIIO||'%'
                        ;
                        
                        
                        
    
              SELECT
                   DISTINCT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS   
                        FROM CIS2.VW_DATA_ALL FC
                        
                        WHERE
                        FC.PERIOADA IN (:pPERIOADA)
                        AND FC.FORM  IN (:pFORM)
                        AND   FC.CUIIO LIKE :pCUIIO||'%'
                        ;