SELECT 

   CC.FULL_CODE,
   CC.DENUMIRE,

   CC.CODUL,
   CC.FULL_CODE AS ORDINE,
   
 ROUND(SUM ( CASE WHEN  1=1 THEN  DD.COL1 ELSE NULL END ),2) AS COL1, 
   
 ROUND(SUM ( CASE WHEN  C.FULL_CODE LIKE '%'||CC.CODUL||';%' THEN  DD.COL1 ELSE NULL END ),1) AS COL2
         

    FROM 
  (
-------------------------------------------------------------------------------
SELECT 
 
 DISTINCT D.CUIIO, 
 D.CAEM2,


 ROUND(SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  D.COL4 ELSE NULL  END) , 1) AS COL1
 

 

 
FROM   
    CIS2.VW_DATA_ALL_COEF D   
    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS      
WHERE
  D.FORM IN (64)             AND 
   
  D.PERIOADA =:pPERIOADA AND

  D.CAPITOL IN (1127) 


 GROUP BY 
 D.CUIIO, 
 D.CAEM2
 

 )DD

-------------------------------------------------------------------------------


 INNER JOIN CIS2.VW_CL_CAEM2 C ON    C.CODUL = DD.CAEM2
 INNER JOIN CIS2.VW_CL_CAEM2 CC ON  (C.FULL_CODE LIKE '%'||CC.CODUL||';%') 
 


         

 
   GROUP BY
   CC.FULL_CODE,
    CC.DENUMIRE,
   CC.CODUL

    
    ORDER BY 

    CC.CODUL