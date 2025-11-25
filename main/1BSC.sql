  SELECT 
        
         D.CUIIO,
         R.DENUMIRE,
         R.CUATM,
         R.CAEM2,
         R.IDNO,
         NVAL(SUM(CASE WHEN D.capitol= 2 AND D.capitol_vers=1027 AND D.RIND IN (01) THEN D.COL1 ELSE NULL END))  AS CAP_SR,  
         NVAL(SUM(CASE WHEN D.capitol= 1017 AND D.capitol_vers= 1004 AND D.RIND IN (000) THEN NVAL(D.COL2) + NVAL(D.COL4) +NVAL(D.COL6)  ELSE NULL END)) AS COL1,
         NVAL(SUM(CASE WHEN D.capitol= 1017 AND D.capitol_vers= 1004 AND D.RIND IN (498) THEN NVAL(D.COL2) + NVAL(D.COL4) +NVAL(D.COL6)  ELSE NULL END)) AS COL2,
         NVAL(SUM(CASE WHEN D.capitol= 1017 AND D.capitol_vers= 1004 AND D.RIND IN (999) THEN NVAL(D.COL2) + NVAL(D.COL4) +NVAL(D.COL6)  ELSE NULL END)) AS COL3
            FROM CIS2.VW_DATA_ALL D INNER JOIN CIS2.RENIM R 
            ON  R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS 
            
            WHERE 
            D.FORM in (19)
            AND D.PERIOADA = 1066 
            
            GROUP BY
             D.CUIIO,
         R.DENUMIRE,
         R.CUATM,
         R.CAEM2,
         R.IDNO
           
            HAVING 
            NVAL(SUM(CASE WHEN D.capitol= 2 AND D.capitol_vers=1027 AND D.RIND IN (01) THEN D.COL1 ELSE NULL END)) > 0
--         AND 
--         R.IDNO IS NULL    
            