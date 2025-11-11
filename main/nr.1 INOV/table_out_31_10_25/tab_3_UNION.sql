
      SELECT
    
        D.CUIIO,
--        DD.COL2 RSF,
        SUM(CASE WHEN D.RIND = '1.3.1' AND NVAL(D.COL1)>=1 THEN NVAL(D.COL1)  END)  AS COL1_INOV,
        
        SUM(DD.COL2) AS COL_RSF,
        
        ROUND(SUM(DD.COL2) / 1000 * SUM(CASE WHEN D.RIND = '1.3.1' AND NVAL(D.COL1)>=1 THEN NVAL(D.COL1)  END) / 100,1) AS COL_FINAL
    --    ROUND((DD.COL2 / 1000 * SUM(CASE WHEN D.RIND = '1.3.1' AND NVAL(D.COL1)>=1 THEN NVAL(D.COL1)  END))/100,1)  AS COL_FINAL
   
        
        

        

      FROM 
        CIS2.VW_DATA_ALL D
        
                  LEFT JOIN (
                  
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
 --AND D.CUIIO =  40585950
 
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
                
                

                  ) DD ON DD.CUIIO = D.CUIIO 
       
        
      WHERE
        D.PERIOADA IN (:pPERIOADA) AND
        D.FORM     IN (:pFORM) AND 
        D.CAPITOL = 1040 AND D.CAPITOL_VERS = 2013 AND 
        D.RIND IN ('1.3.1','1.3.2','1.3.3') AND
        D.CAEM2 NOT LIKE 'A%'
        AND D.CUIIO = 40585950



GROUP BY 
D.CUIIO

ORDER BY
D.CUIIO
 