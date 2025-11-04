
SELECT 
DISTINCT 
D.CUIIO,
SUM(D.COL1) + SUM(D.COL2) + SUM(D.COL3) AS COL1
FROM
(
SELECT
        DISTINCT D.CUIIO,
        D.RIND,
        SUM(D.COL1) AS COL1,
        SUM(D.COL2) AS COL2,
        SUM(D.COL3) AS COL3
        --COUNT (DISTINCT D.CUIIO) AS CNT 
       
      FROM 
        CIS2.VW_DATA_ALL D
      WHERE
        D.PERIOADA IN (:pPERIOADA) AND
        D.FORM IN (:pFORM) AND 
        D.CAPITOL = 1040 AND CAPITOL_VERS = 2013 AND 
        D.RIND LIKE '1.12%' AND
        D.CAEM2 NOT LIKE 'A%'
        -- AND NVAL(D.COL1) = 1
         
         
         GROUP BY
         
         D.CUIIO,
         --,
        D.RIND
        
        ) D
        
        GROUP BY 
        D.CUIIO
        
        HAVING 
--        NVAL(SUM(D.COL1)) + NVAL(SUM(D.COL2)) + NVAL(SUM(D.COL3)) <> 0
--        
--        AND
--        
--        NVAL(SUM(D.COL1)) + NVAL(SUM(D.COL2)) + NVAL(SUM(D.COL3)) IS NOT NULL

SUM(D.COL1) + SUM(D.COL2) + SUM(D.COL3) IS NOT NULL    
        
        