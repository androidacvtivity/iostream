  CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_ASA_24
AS    
  
  SELECT       
               DISTINCT  
               D.CUIIO,
               D.CUATM,
               D.CAEM2,
               MAX(CASE WHEN D.CAPITOL = 1129  AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END )    AS CAEM_ASA,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('150') THEN D.COL1 ELSE NULL END )    AS R150_COL1,
               NVAL(SUM(CASE WHEN D.CAPITOL = 1125  AND D.RIND IN ('200') THEN D.COL1 ELSE NULL END )) +
               NVAL(SUM(CASE WHEN D.CAPITOL = 1125  AND D.RIND IN ('210') THEN D.COL1 ELSE NULL END )) 
                  AS R200_210_COL1
           
               
           FROM  CIS2.VW_DATA_ALL D 
           
           
           
                                  
           
           WHERE 
           D.FORM = 64
           AND D.PERIOADA = 2013 
                               
                        
                         
        GROUP BY 
            D.CUIIO,
            D.CUATM,
            D.CAEM2
         
           
        
    