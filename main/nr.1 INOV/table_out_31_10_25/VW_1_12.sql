






            SELECT L.CUIIO 
            FROM VW_1_12 L LEFT JOIN VW_1_11 R ON R.CUIIO = L.CUIIO   
            
            WHERE 
            R.CUIIO IS NULL 