                 INSERT INTO CIS2.MD_RIND_OUT (
                
                 ID_MDTABLE,
                 RINDOUT_VERS,
                 RINDOUT,
                 DENUMIRE,
                 STATUT,
                 ORDINE,
                 DATA_REG,
                 RIND 

                )



                
                SELECT
                  14904 ID_MDTABLE,
                  ITEM_CODE_VERS RINDOUT_VERS, 
                  ITEM_CODE RINDOUT,
                  ITEM_PATH DENUMIRE,
                  NULL STATUT,
                  ROWNUM ORDINE,
                SYSDATE  DATA_REG,
                  NAME RIND
                FROM
                (
SELECT
                  CI.ITEM_CODE,
                  CII.NAME,
                  CII.ITEM_PATH,
                  CI.ITEM_CODE_VERS
                FROM
                (
                SELECT
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE,
                                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                                FROM
                                  CIS2.CLS_CLASS_ITEM CI
                                WHERE
                                  CI.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND
                                  CI.ITEM_CODE_VERS <= :pPERIOADA
                                GROUP BY
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE
                                ORDER BY
                                 CI.ITEM_CODE
                                  
                                  
                                  
        ) CI
        INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CI.CLASS_CODE=CII.CLASS_CODE AND CI.ITEM_CODE=CII.ITEM_CODE AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS)
        
        WHERE
        1=1
        --CII.STATUS = '1'
               ORDER BY
        CII.ITEM_PATH )
        
        
       WHERE
       1=1 
     --   AND TRIM(ITEM_CODE)  LIKE '0480%'
     
   --  AND TRIM(ITEM_CODE)  LIKE '%2000109%'