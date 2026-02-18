


            SELECT 
                L.CUIIO,
                L.DENUMIRE,
                L.CUATM
            
            from USER_BANCU.VW_EI_2023 L LEFT JOIN USER_BANCU.VW_EI_2025 
                        R ON R.CUIIO = L.CUIIO    
                        
                        WHERE 
                        R.CUIIO IS NULL