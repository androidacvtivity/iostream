
CREATE OR REPLACE FORCE VIEW VW_1_INOV_24
AS 
SELECT
     D.CUIIO,
     SUM(D.COL1) AS COL1 

       
      FROM 
        CIS2.VW_DATA_ALL D
      WHERE
        D.PERIOADA IN (2013) AND
        D.FORM IN (48) AND 
        D.CAPITOL = 1040 AND CAPITOL_VERS = 2013 AND 
        (D.RIND LIKE '1.10%'
        OR
        D.RIND LIKE '1.9%') 
        
        AND
        D.CAEM2 NOT LIKE 'A%'
        

       
GROUP BY 
     D.CUIIO
     
     
     HAVING 
     
     SUM(CASE WHEN D.RIND LIKE '1.10%' THEN D.COL1 ELSE 0 END ) >= 0
     OR 
     SUM(CASE WHEN D.RIND LIKE '1.9%' THEN D.COL1 ELSE 0 END ) >= 0
     
     ORDER BY 
     D.CUIIO
     
