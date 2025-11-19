
--SELECT 
--RR.CUIIO,
--RR.RIND,
--RR.CAEM2_CAP4,
--SUM(RR.COL1) AS COL1,
--SUM(RR.COL2) AS COL2,
--SUM(RR.COL3) AS COL3
--
--FROM
--(
SELECT
        D.CUIIO,
        56 RIND,
        D.COL31 AS CAEM2_CAP4,
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    
       WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
        AND D.RIND NOT IN ('400')
        AND D.CUIIO = 458963



        HAVING 
        SUM (CASE WHEN D.RIND  NOT IN ('400') THEN NVAL(D.COL4) + NVAL(D.COL5) + NVAL(D.COL6) ELSE 0 END ) > 0
        
        GROUP BY
        D.CUIIO,
        D.COL31
        
        
--        SUM () 
        
        
--        
--        ) RR
--        
--        
--        GROUP BY 
--        RR.CUIIO,
--RR.RIND,
--RR.CAEM2_CAP4