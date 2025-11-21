SELECT
        D.CUIIO,
        D.COL31,
        COUNT(D.COL31) AS CNT, 
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    
       WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
        AND D.RIND  NOT IN ('400')
         
         
      GROUP BY
        D.CUIIO,
        D.COL31
        
        HAVING 
        COUNT(D.COL31) > 1