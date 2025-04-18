  SELECT 
  '3'||CCU.FULL_CODE ORDINE,
   CCU.CODUL  CUATM_CODUL,
   CCU.DENUMIRE CUATM_DENUMIRE, 
   CCU.FULL_CODE CUATM_FULL_CODE,
  '2' CODUL,
  '..........Centrul de excelenta' DENUMIRE,
   CDD.FULL_CODE_ORDINE FULL_CODE, 
   COUNT (DISTINCT D.CUIIO)  COL1,
   NULL  COL2,NULL  COL3,NULL  COL4,NULL  COL5,NULL  COL6,NULL  COL7,NULL  COL8,NULL  COL9,NULL  COL10,NULL  COL11,NULL  COL12,NULL  COL13,NULL  COL14,NULL  COL15

   
FROM 
  CIS2.VW_DATA_ALL D


     INNER JOIN CIS2.VW_CL_CUATM CU ON (CU.CODUL=D.CUATM)  
     INNER JOIN CIS2.VW_CL_CUATM CCU ON (CU.FULL_CODE LIKE '%'||CCU.CODUL||';%')
     -------------------------------------------------------
INNER JOIN (

 
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
    TO_CHAR(SUBSTR(D.RIND,2)) RIND_MOD,
    D.ID_MD,
    D.RIND_VERS


  
FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) AND     
         
  (
  
  D.RIND NOT IN 
       
       (
       
        SELECT 
        CODUL
        
        FROM CIS2.CL_TARI_CS
        
       )
        
     AND 
     
     D.RIND NOT IN ('010','020','030','035','040','050','060','070')
     
       )   
  
   ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)    
 
    
     INNER JOIN CIS2.RENIM R ON (D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS) 
     INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)
     
     INNER JOIN  (
            SELECT  
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,

            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CD ON (CD.CODUL = R.NTII) 
      
     
     INNER JOIN (
     
     SELECT  
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CDD ON (CD.FULL_CODE LIKE '%'||CDD.CODUL||';%') 
  
 WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) 

  
  AND CDD.CODUL IN ('2')
    AND CCU.PRGS IN ('2')

  GROUP BY 

  CCU.CODUL, 
  CCU.DENUMIRE,
  CCU.FULL_CODE,  
  CDD.CODUL,
  CDD.DENUMIRE,
  CDD.FULL_CODE_ORDINE