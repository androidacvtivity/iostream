

            SELECT 
                L.CUIIO 
            FROM D_ALL_8_2025 L LEFT JOIN VW_ALL_8_2025 R ON R.CUIIO = L.CUIIO 
            
                WHERE 
                R.CUIIO IS NULL;
                
               SELECT *     
               FROM  D_ALL_10_2025;
               
               SELECT *
FROM VW_ALL_10_2025;