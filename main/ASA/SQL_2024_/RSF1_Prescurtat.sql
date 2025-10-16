
--CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_REFPRESCURTAT
--AS 
SELECT
                D.CUIIO, 
                D.FORM,
                MAX(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1119) AND D.RIND IN ('3') THEN  D.COL1 ELSE NULL END) AS NUM_MEDIU,
                MAX(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1119) AND D.RIND IN ('CAEM') THEN  D.COL1 ELSE NULL END) AS CAEM,
                (NVAL(SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('020')   THEN  D.COL2 ELSE NULL END)) +
                NVAL(SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('050')   THEN  D.COL2 ELSE NULL END)) + 
                NVAL(SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('060')   THEN  D.COL2 ELSE NULL END)) +
                NVAL(SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('070')   THEN  D.COL2 ELSE NULL END))) / 1000  AS COL1,
                
                NVAL(SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('080')   THEN  D.COL2 ELSE NULL END)) / 1000 AS COL2
                
                
                FROM CIS2.VW_DATA_ALL_FR D 
                 
                WHERE 
                
                D.PERIOADA IN (2013)
                AND D.CAPITOL IN (1119,1121)
                AND D.FORM = 63 
                --AND D.CUIIO = 2936183
                GROUP BY 
                D.CUIIO,
                D.FORM 
                
                ORDER BY 
                D.CUIIO 