CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_RSF_2024

AS

SELECT * 

FROM 

(
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
     
      ROUND(SUM(CASE WHEN D.CAPITOL IN (1092) AND D.RIND IN (010) THEN  D.COL2 END ) / 1000,2)  AS COL1,
      ROUND(SUM(CASE WHEN D.CAPITOL IN (1092) AND D.RIND IN (010) THEN  D.COL2 END ))  AS COL2       
             
        FROM CIS2.VW_DATA_ALL_FR D
       WHERE D.PERIOADA IN (2013) 
       AND D.CAPITOL IN (1092,1091) 
       
       AND D.FORM = 57
       
       
    GROUP BY D.CUIIO, D.FORM

UNION 

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
      ROUND(SUM(CASE WHEN D.CAPITOL IN (1121)AND D.RIND IN (010)  THEN  D.COL2 END ) / 1000,2)  AS COL1,  
      SUM(CASE WHEN D.CAPITOL IN (1121) AND D.RIND IN (010)  THEN  D.COL2 END )  AS COL2      
             
        FROM CIS2.VW_DATA_ALL_FR D
       WHERE D.PERIOADA IN (2013) 
       AND D.CAPITOL IN (1121,1119) 
       
       AND D.FORM = 63
       
       
    GROUP BY D.CUIIO, D.FORM
    )