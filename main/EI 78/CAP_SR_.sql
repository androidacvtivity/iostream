SELECT 
DISTINCT CUIIO, 
MAX(DENUMIRE) DENUMIRE,
MAX(CUATM)    CUATM,
SUM(COL1) AS COL1

FROM 
(
SELECT 
         
        DISTINCT D.CUIIO,
        MAX(R.DENUMIRE) DENUMIRE,
        MAX(R.CUATM) CUATM,
        
        SUM(CASE WHEN D.RIND IN ('01') THEN D.COL1 ELSE NULL END) AS COL1

        
            FROM CIS2.VW_DATA_ALL D 
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
            
            WHERE
            D.FORM = 44
            AND D.ANUL IN  (2023,2024,2025)
            AND D.capitol=1 AND D.capitol_vers=1028
            
            
            GROUP BY
             D.CUIIO
             
             
             HAVING 
             SUM(CASE WHEN D.RIND IN ('01') THEN D.COL1 ELSE NULL END) IS  NULL 
             
             
             
             UNION 
             
             
             SELECT 
         
        DISTINCT D.CUIIO,
         MAX(R.DENUMIRE) DENUMIRE,
        MAX(R.CUATM) CUATM,
        
        SUM(CASE WHEN D.RIND IN ('01') THEN D.COL1 ELSE NULL END) AS COL1

        
            FROM CIS2.VW_DATA_ALL D 
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
            
            WHERE
            D.FORM = 44
           AND D.ANUL IN  (2023,2024,2025)
            AND D.capitol=14 AND D.capitol_vers=1028
            
            
            GROUP BY
             D.CUIIO
             
             
             HAVING 
             SUM(CASE WHEN D.RIND IN ('01') THEN D.COL1 ELSE NULL END) IS  NULL
             
             )
             
             
             GROUP BY 
             CUIIO 
             
             
             
             HAVING 
             SUM(COL1) IS  NULL 