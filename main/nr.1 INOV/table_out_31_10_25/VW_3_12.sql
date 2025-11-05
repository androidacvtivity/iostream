CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_3_12
(
    CUIIO,
    COL1,
    COL2,
    COL3
)
AS
      SELECT DISTINCT
             D.CUIIO, --    D.RIND,
                       NVAL (SUM (D.COL1)) AS COL1,
                       NVAL (SUM (D.COL2)) AS COL2,
                       NVAL (SUM (D.COL3)) AS COL3
                       
        FROM CIS2.VW_DATA_ALL D
       WHERE     D.PERIOADA IN (2013)
             AND D.FORM IN (48)
             AND D.CAPITOL = 1042
             AND CAPITOL_VERS = 2013
             AND D.RIND IN ('3.1.12')
             AND D.CAEM2 NOT LIKE 'A%'
    -- AND NVAL(D.COL1) = 1
    GROUP BY D.CUIIO
      -- D.RIND


      HAVING 
      
      SUM(NVAL (D.COL1)) + SUM(NVAL (D.COL2)) + SUM(NVAL (D.COL3)) >=  1 
    ORDER BY D.CUIIO