  CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_ASA_25
AS    
  
  SELECT       
               DISTINCT  
               D.CUIIO,
               R.DENUMIRE,
               D.CUATM,
               D.CAEM2,
               MAX(CASE WHEN D.CAPITOL = 100  AND D.RIND IN ('1','2','3','4','5','6','7') THEN D.RIND ELSE NULL END )  AS  CAP_SR_ASA,
               MAX(CASE WHEN D.CAPITOL = 1129  AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END )    AS CAEM_ASA,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('150') THEN D.COL1 ELSE NULL END )    AS R150_COL1,
               NVAL(SUM(CASE WHEN D.CAPITOL = 1125  AND D.RIND IN ('200') THEN D.COL1 ELSE NULL END )) +
               NVAL(SUM(CASE WHEN D.CAPITOL = 1125  AND D.RIND IN ('210') THEN D.COL1 ELSE NULL END )) 
                  AS R200_210_COL1
           
               
           FROM  CIS2.VW_DATA_ALL D 
                    INNER JOIN CIS2.RENIM R ON R.CUIIO  = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                                 
           
           WHERE 
           D.FORM = 64
           AND D.PERIOADA = 2014 
                         
        GROUP BY
            R.DENUMIRE, 
            D.CUIIO,
            D.CUATM,
            D.CAEM2
         
           
        
    