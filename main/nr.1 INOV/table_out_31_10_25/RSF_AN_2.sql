--SELECT * 
--
--
--FROM 
--
--
--(
SELECT 
                D.CUIIO,
                D.RIND,
                SUM(D.COL2) AS COL2 
                FROM CIS2.VW_DATA_ALL_FR D
                WHERE
                

            D.FORM = 57 
-- AND D.CUIIO =  5523 
AND D.PERIOADA = 2013
AND D.FORM_VERS = 2009
AND D.capitol=1092  
AND D.RIND IN ('010')

GROUP BY 
                D.CUIIO,
                D.RIND



UNION 

SELECT 
                D.CUIIO,
                D.RIND,
                SUM(D.COL2) AS COL2 
                FROM CIS2.VW_DATA_ALL_FR D
                WHERE
                

            D.FORM = 63 
-- AND D.CUIIO =  5523 
AND D.PERIOADA = 2013
AND D.capitol= 1121  
AND D.RIND IN ('010')

GROUP BY 
                D.CUIIO,
                D.RIND
                
                
                ORDER BY 
                CUIIO 
--                
--                )
--                
--                
--                
--                WHERE 
--                
--                CUIIO IN 5533