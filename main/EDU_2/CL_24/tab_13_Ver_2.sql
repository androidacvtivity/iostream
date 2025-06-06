SELECT
   D.CUIIO,
   CASE WHEN ltrim(TO_NUMBER(CC.codul),'0') IS NULL THEN '0' ELSE ltrim(TO_NUMBER(CC.codul),'0')  END   CODUL,
   CC.DENUMIRE,
 --  CC.FULL_CODE,
   CASE WHEN ltrim(TO_NUMBER(CC.GRUPA),'0') IS NULL THEN '0' ELSE ltrim(TO_NUMBER(CC.GRUPA),'0')  END  GRUPA,
   CC.ORDINE,
   SUM (CIS2.NVAL(D.COL1)) COL1,
   SUM (CIS2.NVAL(D.COL2)) COL2,
   SUM (CASE WHEN 1=1 THEN CIS2.NVAL(D.COL1)-CIS2.NVAL(D.COL2) END)  COL3,
   SUM (CASE WHEN 1=1 THEN CIS2.NVAL(D.COL1)-CIS2.NVAL(D.COL3) END)  COL4,
   SUM (CIS2.NVAL(D.COL3)) COL5,
   SUM (CIS2.NVAL(D.COL7)) COL6,
   SUM (CIS2.NVAL(D.COL8)) COL7,
   SUM (CASE WHEN 1=1 THEN CIS2.NVAL(D.COL7)-CIS2.NVAL(D.COL8) END) COL8,
   SUM (CASE WHEN 1=1 THEN CIS2.NVAL(D.COL7)-CIS2.NVAL(D.COL9) END) COL9,
   SUM (CIS2.NVAL(D.COL9)) COL10,
   SUM (CIS2.NVAL(D.COL10)) COL11,
   SUM (CIS2.NVAL(D.COL11)) COL12,
   SUM (CASE WHEN 1=1 THEN CIS2.NVAL(D.COL10)-CIS2.NVAL(D.COL11) END) COL13,
   SUM (CASE WHEN 1=1 THEN CIS2.NVAL(D.COL10)-CIS2.NVAL(D.COL12) END)  COL14,
   SUM (CIS2.NVAL(D.COL12)) COL15

FROM 
  CIS2.VW_DATA_ALL D

INNER JOIN (

 
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
(CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN REPLACE(LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0'), '.', '')
  ELSE REPLACE(TO_CHAR(SUBSTR(D.RIND, 2)), '.', '')
END) AS RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    MR.ORDINE
 FROM 
  CIS2.VW_DATA_ALL D  
  
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
  
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
       
       ORDER BY 
       MR.ORDINE
 
  
   ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)   
 
 
     INNER JOIN  USER_BANCU.VW_CL_SPEC_2EDU_24 C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
     
   -- INNER JOIN  USER_BANCU.VW_CL_SPEC_2EDU_24   CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')




    
 
 WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) 
--  
-- AND CC.ITEM_PARENT = '2111'
--  AND CC.ITEM_CODE IN ('2111.102111.5')
--AND D.CUIIO = 20197691
 
--  and LENGTH(TRIM(REPLACE(CC.CODUL, '0', ''))) = 1
  GROUP BY 

D.CUIIO,

   CC.CODUL, 
   CC.DENUMIRE,
   CC.FULL_CODE,
   CC.ORDINE,
   CC.GRUPA
  
  
  ORDER BY
  CC.ORDINE
  
  
  
  
  
  

