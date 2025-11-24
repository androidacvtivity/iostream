
      SELECT 
      D.CUIIO,
            MAX (
                 CASE
                     WHEN     D.FORM = 63
                          AND D.CAPITOL IN (1119)
                          AND D.RIND IN ('3')
                     THEN
                         D.COL1
                     ELSE
                         NULL
                 END)
                 AS NUM_MEDIU,
      ROUND(SUM(CASE WHEN D.CAPITOL IN (1120) THEN   D.COL1 END ) / 1000,2)  AS COL4,
      ROUND(SUM(CASE WHEN D.CAPITOL IN (1120) THEN  D.COL2 END ) / 1000,2)  AS COL5      
             
        FROM CIS2.VW_DATA_ALL_FR D
       WHERE D.PERIOADA IN (2013) 
       AND D.CAPITOL IN (1120,1119) 
       
       AND D.FORM = 63
       
       
    GROUP BY D.CUIIO, D.FORM
    ORDER BY D.CUIIO;
