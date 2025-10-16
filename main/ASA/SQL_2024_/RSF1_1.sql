CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_RSF1
AS        

       SELECT
                D.CUIIO, 
                D.FORM,
                MAX(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1091) AND D.RIND IN ('6') THEN  D.COL1 ELSE NULL END) AS NUM_MEDIU,
                MAX(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1091) AND D.RIND IN ('CAEM') THEN  D.COL1 ELSE NULL END) AS CAEM,
                (NVAL(SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('020')  THEN  D.COL2 ELSE NULL END)) + 
                NVAL(SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('050')  THEN  D.COL2 ELSE NULL END)) +
                NVAL(SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('060')  THEN  D.COL2 ELSE NULL END)) +
                NVAL(SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('070')  THEN  D.COL2 ELSE NULL END))) / 1000   AS COL1,
                NVAL(SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('080')   THEN  D.COL2 ELSE NULL END)) / 1000 AS COL2
                 
                
                FROM CIS2.VW_DATA_ALL_FR D 
                 
                WHERE 
                
                D.PERIOADA IN (2013)
                AND D.CAPITOL IN (1091,1092)
                AND D.FORM = 57 
                
                GROUP BY 
                D.CUIIO,
                D.FORM 
                
                ORDER BY 
                D.CUIIO 