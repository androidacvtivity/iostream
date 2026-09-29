CREATE OR REPLACE FORCE VIEW USER_BANCU.VVW_RSFP_2025

AS 

SELECT 
D.CUIIO,
D.CAEM2,
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
                 AS NMP,
                      MAX (
                 CASE
                     WHEN     D.FORM = 63
                          AND D.CAPITOL IN (1119)
                          AND D.RIND IN ('CAEM')
                     THEN
                         D.COL1
                     ELSE
                         NULL
                 END)
                 AS CAEM_TITLU,
SUM(CASE WHEN D.CAPITOL IN (1121) AND D.RIND IN ('010') THEN D.COL1 ELSE NULL END ) RSF1_PRESC_R_010_C3,
SUM(CASE WHEN D.CAPITOL IN (1121) AND D.RIND IN ('010') THEN D.COL2 ELSE NULL END ) RSF1_PRESC_R_010_C4,
SUM(CASE WHEN D.CAPITOL IN (1121) AND D.RIND IN ('040') THEN D.COL1 ELSE NULL END ) RSF1_PRESC_R_040_C3,
SUM(CASE WHEN D.CAPITOL IN (1121) AND D.RIND IN ('040') THEN D.COL2 ELSE NULL END ) RSF1_PRESC_R_040_C4,
SUM(CASE WHEN D.CAPITOL IN (1120) AND D.RIND IN ('060') THEN D.COL1 ELSE NULL END ) RSF1_PRESC_R_060_C4,
SUM(CASE WHEN D.CAPITOL IN (1120) AND D.RIND IN ('060') THEN D.COL2 ELSE NULL END ) RSF1_PRESC_R_060_C5

FROM
       CIS2.VW_DATA_ALL_FR D             
WHERE 
  D.FORM IN (63)           AND 
  D.CAPITOL IN (1121,1120,1119) AND
  D.FORM_VERS = 2000  AND 
  D.FORM = 63 AND
  D.PERIOADA IN (2014) 
  --AND 
 -- D.RIND IN ('010','040','060')
  --AND D.CUIIO = 5523
  GROUP BY
D.CUIIO,
D.CAEM2