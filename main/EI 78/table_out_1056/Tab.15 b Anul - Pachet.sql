SELECT 
--    :pPERIOADA AS PERIOADA,
--    :pFORM AS FORM,
--    :pFORM_VERS AS FORM_VERS,
--    :pID_MDTABLE AS ID_MDTABLE,
--    :pCOD_CUATM AS COD_CUATM,
     D.CUATM_CODUL AS NR_SECTIE,
     D.CUATM_CODUL||'-'||D.DENUMIRE_CUATM AS NUME_SECTIE,
--    '0' AS NR_SECTIE1,
--    '0' AS NUME_SECTIE1,
--    '0' AS NR_SECTIE2,
--    '0' AS NUME_SECTIE2,
     D.CUIIO||'~'|| ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     TRIM(D.DENUMIRE) NUME_ROW,
     L.PACHET     COL1,
     REPLACE(D.SERV_CODUL,'.','')   COL2,
     D.COL1 COL3,
     D.COL2 COL4,
     D.COL3 COL5
     
     FROM
     (

SELECT 
   '1' AS ORDINE, 
    MAX(CC.CODUL)  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL PACHET,
    NULL AS CUIIO_VERS,
    '0'   SERV_CODUL, 
    CII.NAME DENUMIRE,
    SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (407) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL1,
    SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-4) AND  D.CAPITOL IN (407) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL2,
    SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (407) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) - 
    SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-4) AND  D.CAPITOL IN (407) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL3
     
  FROM    
     CIS2.VW_DATA_ALL D 
     
      INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
      INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2') AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
      
      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )

  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-4)) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)   AND
  D.CAPITOL IN (407)
  AND CII.ITEM_CODE = '00.00.00' 
  AND D.CUIIO = 37112001
  
  GROUP BY 
    CII.ITEM_CODE,
    CII.SHOW_ORDER,  
    CII.NAME,
    CC.DENUMIRE,
    CC.FULL_CODE
    
UNION 
SELECT 
   '2' AS ORDINE, 
    MAX(CC.CODUL)  CUATM_CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
     D.CUIIO,
     D.PACHET,
     MAX(D.CUIIO_VERS) AS CUIIO_VERS,
     CI.ITEM_CODE   SERV_CODUL,
     CI.NAME||'-'||MAX(R.DENUMIRE) DENUMIRE,
     SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (407) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL1,
     SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-4) AND  D.CAPITOL IN (407) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL2,
     SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA) AND  D.CAPITOL IN (407) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) - 
    SUM(CASE WHEN D.PERIOADA IN(:pPERIOADA-4) AND  D.CAPITOL IN (407) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL3
     
  FROM    
     CIS2.VW_DATA_ALL D 
     
        INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
        INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 

        INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
      INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )

  WHERE 
  (D.PERIOADA IN(:pPERIOADA,:pPERIOADA-4)) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)   AND
  D.CAPITOL IN (407)
   
  AND D.CUIIO = 37112001
  
  GROUP BY 
    CI.ITEM_CODE,
    CI.NAME,
    D.CUIIO,
    CC.DENUMIRE,
    CC.FULL_CODE,
    PACHET
    
    ORDER BY 
    
  ORDINE
 ) D LEFT JOIN (
 SELECT
  DISTINCT  D.CUIIO,
                    D.PACHET
                    FROM CIS2.DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 44
                    AND D.PERIOADA IN(:pPERIOADA)
                    AND R.CAPITOL IN  (1)
  
 ) L ON L.CUIIO = D.CUIIO  
  

  
    
   
 
 WHERE 
   
   D.CUATM_CODUL  IN (
   
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


