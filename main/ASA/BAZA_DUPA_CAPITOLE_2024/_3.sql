SELECT
        D.CUIIO,
      
        MAX(D.COL31) AS CAEM2_CAP4,
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    
       WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
        AND D.RIND IN ('410','400')
 

        HAVING 
        SUM (CASE WHEN D.RIND  IN ('400','410') THEN NVAL(D.COL4) + NVAL(D.COL5) + NVAL(D.COL6) ELSE 0 END ) > 0
        
        GROUP BY
        D.CUIIO
        