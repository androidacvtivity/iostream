
      SELECT 
      D.CUIIO,
            MAX (
                 CASE
                     WHEN     D.FORM = 57
                          AND D.CAPITOL IN (1091)
                          AND D.RIND IN ('6')
                     THEN
                         D.COL1
                     ELSE
                         NULL
                 END)
                 AS NUM_MEDIU,
      ROUND(SUM(D.COL1) / 1000,2)  AS COL4,
      ROUND(SUM(D.COL2) / 1000,2)  AS COL5      
             
        FROM CIS2.VW_DATA_ALL_FR D
       WHERE D.PERIOADA IN (2013) AND D.CAPITOL IN (1090,1091) AND D.FORM = 57
    GROUP BY D.CUIIO, D.FORM
    ORDER BY D.CUIIO;
