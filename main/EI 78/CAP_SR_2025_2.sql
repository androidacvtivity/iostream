
CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_EI_2025

AS


SELECT 
     DISTINCT D.CUIIO,
        MAX(R.DENUMIRE) DENUMIRE,
        MAX(R.CUATM) CUATM
        
--        NVAL(SUM(CASE WHEN D.capitol=1 AND D.capitol_vers=1028 AND D.RIND IN ('01') THEN D.COL1 ELSE NULL END)) AS COL1,
--        NVAL(SUM(CASE WHEN D.capitol=14 AND D.capitol_vers=1028 AND D.RIND IN ('01') THEN D.COL1 ELSE NULL END)) AS COL2

        
            FROM CIS2.VW_DATA_ALL D 
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
            
            WHERE
            D.FORM = 44
            AND D.ANUL IN  (2024,2025)
           
            
            
            GROUP BY
             D.CUIIO
             
             
             HAVING 
            NVAL(SUM(CASE WHEN D.capitol=14 AND D.capitol_vers=1028 AND D.RIND IN ('01') THEN D.COL1 ELSE NULL END))
            + 
            NVAL(SUM(CASE WHEN D.capitol=1 AND D.capitol_vers=1028 AND D.RIND IN ('01') THEN D.COL1 ELSE NULL END))
             = 0
             
             ;
             
             
             
             
             
             
             
             
             
             
             
             
             
             