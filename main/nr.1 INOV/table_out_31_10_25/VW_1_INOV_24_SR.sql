CREATE OR REPLACE FORCE VIEW VW_1_INOV_24_SR
AS 

SELECT
     D.CUIIO,
     SUM(D.COL1) AS COL1 

       
      FROM 
        CIS2.VW_DATA_ALL D
      WHERE
        D.PERIOADA IN (2013) AND
        D.FORM IN (48) AND 
        D.CAPITOL = 100
         
        AND D.RIND IN ('01')
        
        AND
        D.CAEM2 NOT LIKE 'A%'
        

       
GROUP BY 
     D.CUIIO
     