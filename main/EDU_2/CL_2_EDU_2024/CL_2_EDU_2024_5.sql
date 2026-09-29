-- SQL oracle 

SELECT D.RIND  RIND,
(CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN REPLACE(LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0'), '.', '')
  ELSE REPLACE(TO_CHAR(SUBSTR(D.RIND, 2)), '.', '')
END) AS RIND_MOD
                 
                
                FROM CIS2.MD_RIND D
                WHERE
                D.capitol=1049 AND D.capitol_vers=2015

                   AND D.STATUT = '1'
                   AND D.RIND LIKE '3%'
                    AND LENGTH(D.RIND) > 3
        
                    -- 1 -- 216
                    -- 2 -- 215
                    -- 3 -- 217
                   
                   ORDER BY 
                   D.ORDINE;
                   
                   
                   

