

SELECT D.CUIIO,
       D.RIND,
       SUM(D.COL1) AS COL1
       
       FROM CIS2.VW_DATA_ALL D 
       
       WHERE 
       D.FORM IN (:pFORM)
       AND D.PERIOADA IN (:pPERIOADA)
       
       GROUP BY
       D.CUIIO,
       D.RIND
       
       ORDER BY
        D.CUIIO,
       D.RIND
            
       
       -- B090925 Modificare 5 CON - con5_22_5.js  
       
       
       -- Buna ziua. Branch-ul pentru modificarea la 5 CON TRIM este creat. Cand ve-ti avea deploy - plasati va rog. 
       -- B090925	d48c2a36	Commit to B090925 by vitalie.bancu at 2025-09-09 10:43 - B090925 Modificare 5 CON - con5_22_5.js