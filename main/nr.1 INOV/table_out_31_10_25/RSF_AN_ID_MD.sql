
SELECT 
CUIIO,
COL2
FROM 

(
SELECT 
                D.CUIIO,
                SUM(D.COL2) AS COL2 
                FROM CIS2.DATA_ALL_FR D
                WHERE
                

            D.FORM = 57 
-- AND D.CUIIO =  5523 
AND D.PERIOADA = 2013
AND D.FORM_VERS = 2009
--AND D.capitol=1092  
AND D.ID_MD IN (62206)   --62206

GROUP BY 
                D.CUIIO
               



UNION 

SELECT 
                D.CUIIO,
          
                SUM(D.COL2) AS COL2 
                FROM CIS2.VW_DATA_ALL_FR D
                WHERE
                

            D.FORM = 63 
-- AND D.CUIIO =  5523 
AND D.PERIOADA = 2013
--AND D.capitol= 1121  
AND D.ID_MD IN (61891) -- 61891

GROUP BY 
                D.CUIIO
)         
                
                
