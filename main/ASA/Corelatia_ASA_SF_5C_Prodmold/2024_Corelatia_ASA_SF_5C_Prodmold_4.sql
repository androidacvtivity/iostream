CREATE OR REPLACE FORCE VIEW USER_BANCU.VVW_KATALOG_PRODMOLD_2024
(
    CUIIO,
    CAEM2,
    PRDOMOLD_R10
)
AS
      SELECT D.CUIIO,
             d.CAEM2,
             SUM (
                 CASE
                     WHEN D.CAPITOL = 97 AND D.RIND IN '10' THEN D.COL1
                     ELSE NULL
                 END)
                 AS PRDOMOLD_R10
        FROM CIS.VW_DATA_ALL D
       WHERE D.FORM = 10 AND D.PERIOADA IN (2013)
    --AND D.CUIIO = 411016
    GROUP BY D.CUIIO, d.CAEM2;
