
SELECT 
            DISTINCT 
              CFF.CODUL,  
              CFF.DENUMIRE,
              CFF.FULL_CODE,
              COUNT (DISTINCT D.CUIIO) AS CNT
           
        

FROM
       
  CIS2.VW_DATA_ALL D
  
                INNER JOIN CIS2.VW_CL_CFOJ   CF ON CF.CODUL  =  D.CFOJ 
                INNER JOIN CIS2.VW_CL_CFOJ   CFF ON CF.FULL_CODE  LIKE '%'||CFF.CODUL||'%'             
WHERE
  (D.PERIOADA=:pPERIOADA) AND
  (D.FORM=:pFORM) AND

   D.FORM = 47 
   
   

    GROUP BY
   CFF.CODUL,  
              CFF.DENUMIRE,
              CFF.FULL_CODE

    ORDER BY 
    CFF.FULL_CODE
  