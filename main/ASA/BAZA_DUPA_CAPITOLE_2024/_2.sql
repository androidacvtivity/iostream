SELECT 
L.CUIIO,
L.CAEM2_CAP4,
L.COL1 R410_COL1,
L.COL2 R410_COL2,
L.COL3 R410_COL3
FROM
(
SELECT
        D.CUIIO,
        D.RIND,
        MAX(D.COL31) AS CAEM2_CAP4,
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    
       WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
        AND D.RIND IN ('410')
      --  AND D.CUIIO = 2936958

        
        GROUP BY
        D.CUIIO,
        D.RIND
        
        ) L
        
        
        WHERE
        
        L.CAEM2_CAP4 LIKE '56%'
        
        ORDER BY
        L.CUIIO