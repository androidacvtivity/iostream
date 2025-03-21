DECLARE

  CURSOR C IS

SELECT 
    DF.PERIOADA,
    DF.FORM,
    DF.FORM_VERS,
    DF.ID_MDTABLE,
    DF.COD_CUATM,
    DF.NR_SECTIE,
    DF.NUME_SECTIE,
    DF.NR_SECTIE1,
    DF.NUME_SECTIE1,
    DF.NR_SECTIE2,
    DF.NUME_SECTIE2,
    DF.NR_ROW NR_ROW,
    DF.ORDINE,
    DF.DECIMAL_POS,
    DF.NUME_ROW,
    DF.COL1,
    DF.COL2,
    DF.COL3,
    DF.COL4
   
   
   FROM 
(

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CUATM_CODUL AS NR_SECTIE,
     CUATM_CODUL||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     DENUMIRE NUME_ROW,
     SERV_CODUL COL1,
     COL1 COL2,
     COL2 COL3,
     COL3 COL4
     
     

 
    FROM  

(
 SELECT 
   '1' AS ORDINE, 
    MAX(CC.CODUL)  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    '0'   SERV_CODUL, 
    SSS.DENUMIRE DENUMIRE,
    
  
   (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
     
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
   
   INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
    
    INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )
   

---
            INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
            INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
           ---
           
           
   
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND
  --(D.PERIOADA =:pPERIOADA) AND
  --(D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405,406) AND  D.CAPITOL_VERS  = 1040
 AND  SSS.CODUL IN ('0000000')
-- AND CC.CODUL IN ('0000000')
  GROUP BY 
  -- CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  SSS.CODUL,
  SSS.DENUMIRE
  
  
  UNION 
  
  SELECT 
    '2' AS ORDINE,
    MAX(CC.CODUL)  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    S.CODUL    SERV_CODUL,
    S.DENUMIRE||'-'||MAX(R.DENUMIRE) DENUMIRE,
    
    
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL1,
        (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    AS COL2,
 
    (
     (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    )
        
    -
    (SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-1) AND  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.PERIOADA IN(:pPERIOADA-1) AND   D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))
    COL3
    
     
    FROM
    
     CIS2.VW_DATA_ALL D 
     INNER JOIN CIS2.CL_SERVICII S ON (S.CODUL=D.COL1)
     INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
     
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
            
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' ) 
     
    
  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-1)) AND    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405,406) AND  D.CAPITOL_VERS  = 1040
  
  AND S.CODUL <> '0'
  
  GROUP BY 
  
 -- CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE,
  D.CUIIO,
  S.CODUL,
  S.DENUMIRE
 -- R.DENUMIRE
  
  ORDER BY  ORDINE
  )
  
   
  
    
   WHERE 
   
   CUATM_CODUL  IN (
   
   '0000000',
   --'0100000',
    '0110000',
    '0120000',
    '0130000',
    '0140000',
    '0150000',
    --'1111111'
    '3000000',
    '1400000',
    '3400000',
    '3600000',
    '4100000',
    '4300000',
    '4500000',
    '4800000',
    '6200000',
    '7100000',
    '7400000',
    '7800000',
--2222222
    '1000000',
    '2500000',
    '3100000',
    '3800000',
    '5300000',
    '5500000',
    '6000000',
    '6400000',
    '6700000',
    '8000000',
    '8300000',
    '8900000',
    '9200000',
    --3333333
    '1200000',
    '1700000',
    '2100000',
    '2700000',
    '2900000',
    '5700000',
    '8500000',
    '8700000',
    
    '9200000',
    '9601000',
    '9602000',
    '9603000'
)

) DF

;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
    
     CIS2.TABLE_OUT
    (
      PERIOADA,
      FORM,
      FORM_VERS,

      ID_MDTABLE,
      COD_CUATM,
      NR_SECTIE,
      NUME_SECTIE,
      NR_SECTIE1,
      NUME_SECTIE1,
      NR_SECTIE2,
      NUME_SECTIE2,
      NR_ROW,
      ORDINE,
      DECIMAL_POS,
      NUME_ROW,
       
      COL1, COL2, COL3,  COL4
    )
    VALUES
    (
      CR.PERIOADA,
      CR.FORM,
      CR.FORM_VERS,
      CR.ID_MDTABLE,
      CR.COD_CUATM,
      CR.NR_SECTIE,
      CR.NUME_SECTIE,
      CR.NR_SECTIE1,
      CR.NUME_SECTIE1,
      CR.NR_SECTIE2,
      CR.NUME_SECTIE2,
      CR.NR_ROW,
      CR.ORDINE,
      CR.DECIMAL_POS,
      CR.NUME_ROW,
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  