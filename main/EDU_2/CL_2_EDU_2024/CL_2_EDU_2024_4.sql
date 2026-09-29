-- SQL oracle 

SELECT ID_MD
                 
                
                FROM CIS2.MD_RIND
                WHERE
                capitol=1049 AND capitol_vers=2015

                   AND STATUT = '1'
                   AND RIND LIKE '5%'
                    AND LENGTH(RIND) > 3
                   -- adauga o conditie ca rind sa fie mai mare de 3 carcatrere 
                   
                   -- 1 - 216
                   -- 2 
                   
                   ORDER BY 
                   ORDINE;
                   
                   
                   

