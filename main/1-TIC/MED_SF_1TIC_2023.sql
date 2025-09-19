
SELECT 
D.CUIIO,
D.DENUMIRE,
D.CAEM2,
D.CAP_SR,
R.NM_S, 
R.NM_SCRIPT,
R.COL1,
R.COL2,
R.NM_PG,
R.NM_PP

FROM (
SELECT 
              DISTINCT  D.CUIIO,
                        R.DENUMIRE,
                        D.CAEM2,
                        SUM(CASE WHEN D.CAPITOL = 1195 AND D.RIND IN ('1') AND NVAL(D.COL1) = 1 THEN NVAL(D.COL1) ELSE 0 END) AS CAP_SR
         FROM
               CIS2.VW_DATA_ALL D  INNER JOIN 
                                   CIS2.RENIM R ON R.CUIIO =  D.CUIIO AND R.CUIIO_VERS =  D.CUIIO_VERS 
         WHERE   
               D.PERIOADA IN (2012) AND
               D.FORM = 71 
               AND D.FORM_VERS = 2011
               AND D.CAPITOL = 1195
         GROUP BY 
              D.CUIIO,
                        R.DENUMIRE,
                        D.CAEM2
         HAVING 
           SUM(CASE WHEN D.CAPITOL = 1195 AND D.RIND IN ('1') AND NVAL(D.COL1) = 1 THEN NVAL(D.COL1) ELSE 0 END) > 0 )D LEFT JOIN USER_BANCU.SF_24_23 R ON R.CUIIO = D.CUIIO 
           
           
--           ORDER BY 
--           D.CUIIO   