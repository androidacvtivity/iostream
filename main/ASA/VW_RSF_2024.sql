CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_RSF_2024

AS

SELECT 
CUIIO,
CASE 
WHEN CUIIO = 5575 THEN 40476416
WHEN CUIIO = 5581 THEN 399159
WHEN CUIIO = 5606 THEN 41086545
WHEN CUIIO = 5612 THEN 41171185
WHEN CUIIO = 5749 THEN 9774281
WHEN CUIIO = 5771 THEN 41306456

            ELSE CUIIO END   CUIIO_MOD,
NUM_MEDIU,
COL1

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
     
      ROUND(SUM(CASE WHEN D.CAPITOL IN (1092) THEN  D.COL2 END ) / 1000,2)  AS COL1      
             
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
    
      ROUND(SUM(CASE WHEN D.CAPITOL IN (1121) THEN  D.COL2 END ) / 1000,2)  AS COL2      
             
        FROM CIS2.VW_DATA_ALL_FR D
       WHERE D.PERIOADA IN (2013) 
       AND D.CAPITOL IN (1121,1119) 
       
       AND D.FORM = 63
       
       
    GROUP BY D.CUIIO, D.FORM
    )