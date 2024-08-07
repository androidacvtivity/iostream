

SELECT

  C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE,
  NULL CUIIO,
  NULL IDNO,
  NULL DENUMIRE_CUIIO,
  NULL AS CFP,
  NULL RIND,
  NULL AS COL1,
  NULL AS COL2,
  NULL AS COL3,
  NULL AS COL4,
  NULL AS COL5,
  NULL AS COL6,
  NULL AS COL7,
  NULL AS COL8,         
  NULL AS COL9

    

        FROM  CIS2.VW_CL_CUATM C
        
        
            WHERE 
            
            C.PRGS IN ('2')
                
            
            GROUP BY 
              C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE
  


UNION 

SELECT
  C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE,
  D.CUIIO,
  
  R.IDNO,
  R.DENUMIRE DENUMIRE_CUIIO,
  R.CFP, 
  D.RIND,
  SUM(D.COL1) AS COL1,
  SUM(D.COL2) AS COL2,
  SUM(D.COL3) AS COL3,
  SUM(D.COL4) AS COL4,
  SUM(D.COL5) AS COL5,
  SUM(D.COL6) AS COL6,
  SUM(D.COL7) AS COL7,
  SUM(D.COL8) AS COL8,
  SUM(D.COL9) AS COL9
     
    FROM CIS2.VW_DATA_ALL D 
    
            INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    
    WHERE 
    
    D.PERIOADA IN (:pPERIOADA)
    AND D.FORM IN (:pFORM)    
    AND D.CAPITOL IN (1037)
    AND D.RIND IN ('0000000')
   
    
GROUP BY 
  C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE,
  D.CUIIO,
  R.DENUMIRE,
  R.CFP,
  D.RIND,
  R.IDNO


ORDER BY 
FULL_CODE



        