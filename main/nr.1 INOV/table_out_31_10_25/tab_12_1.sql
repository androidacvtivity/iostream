



           SELECT  L.CUIIO  
            FROM VW_has_12 L LEFT JOIN VW_has_11 R ON R.CUIIO = L.CUIIO 
            
                WHERE 
                
                R.CUIIO IS NULL 