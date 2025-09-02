SELECT *
FROM USER_BANCU.VVW_KATALOG_M3_2024
;


CREATE OR REPLACE FORCE VIEW USER_BANCU.VVW_KATALOG_M3_2024
(
    CUIIO,
    CAEM2,
    M3_00_T_COL2
)
AS
      SELECT D.CUIIO,
             D.caem2,
             SUM (
                 CASE
                     WHEN D.CAPITOL = 301 AND D.RIND IN '00-T' THEN D.COL3
                     ELSE NULL
                 END)
                 AS M3_00_T_COL2
        FROM CIS2.VW_DATA_ALL D
       WHERE D.FORM = 3 AND D.PERIOADA IN (2013)
    --AND D.CUIIO = 9202
    GROUP BY D.CUIIO, D.caem2;
