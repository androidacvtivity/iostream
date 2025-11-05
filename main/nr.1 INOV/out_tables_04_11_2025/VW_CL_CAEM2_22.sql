--
--CREATE OR REPLACE FORCE VIEW VW_1_INOV_24_9
--AS 
SELECT
     D.CUIIO,
     SUM(D.COL1) AS COL1 

       
      FROM 
        CIS2.VW_DATA_ALL D
      WHERE
        D.PERIOADA IN (2013) AND
        D.FORM IN (48) AND 
        D.CAPITOL = 1040 AND D.CAPITOL_VERS = 2013 AND 
        D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')
         
        AND
        D.CAEM2 NOT LIKE 'A%'
      --  AND D.CUIIO = 400053

       
GROUP BY 
     D.CUIIO
     
     
     HAVING 
     
     SUM(CASE WHEN D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')  THEN D.COL1 ELSE 0 END ) >= 1
    
     
     ORDER BY 
     D.CUIIO
     
