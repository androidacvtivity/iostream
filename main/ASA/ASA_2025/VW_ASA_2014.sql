CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_ASA_2014
AS
SELECT
DISTINCT
             D.CUIIO,   
             D.CUATM,
             D.CAEM2,
             MAX (
                 CASE
                     WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31
                     ELSE NULL
                 END)
                 caem_calc,
             SUM (
                 CASE
                     WHEN D.CAPITOL IN (100) AND D.RIND NOT IN ('98','--','CD','-','INMPUT') THEN D.COL1
                     ELSE NULL
                 END)
                 CAP_SR,
        
                 SUM (
                 CASE
                     WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150') THEN D.COL1
                     ELSE NULL
                 END)
                 RIND_150_COL1,
                 SUM (
                 CASE
                     WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN D.COL1
                     ELSE NULL
                 END)
                 RIND_200,
             ----------------------------------------------------------------------------------------------
             SUM (
                 CASE
                     WHEN D.CAPITOL IN (1125) AND D.RIND IN ('210') THEN D.COL1
                     ELSE NULL
                 END)
                 RIND_210,
             
               NVAL(SUM (
                 CASE
                     WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN D.COL1
                     ELSE NULL
                 END)) +
                  NVAL(SUM (
                 CASE
                     WHEN D.CAPITOL IN (1125) AND D.RIND IN ('210') THEN D.COL1
                     ELSE NULL
                 END))
                 R_200_210,
                 
                 SUM (
                 CASE
                     WHEN D.CAPITOL IN (1126) AND D.RIND IN ('320') THEN D.COL1
                     ELSE NULL
                 END)
                 RIND_320_COL1,
             SUM (
                 CASE
                     WHEN D.CAPITOL IN (1126) AND D.RIND IN ('320') THEN D.COL2
                     ELSE NULL
                 END)
                 RIND_320_COL2
             

 FROM CIS2.VW_DATA_ALL D
            INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
       WHERE D.FORM IN (64) AND D.PERIOADA = 2014
       
       
       GROUP BY 
         D.CUIIO,   
         D.CUATM,
         D.CAEM2
      ORDER BY    
         D.CUATM