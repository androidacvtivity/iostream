SELECT

   CASE WHEN ltrim(TO_NUMBER(CC.codul),'0') IS NULL THEN '0' ELSE ltrim(TO_NUMBER(CC.codul),'0')  END   CODUL,
   CC.DENUMIRE,
   CC.ORDINE,
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1058) AND C.FULL_CODE LIKE '%'||CC.CODUL||';%' THEN D.COL12 END)) AS COL1,
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' THEN D.COL13 END)) AS COL2,
 
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' THEN D.COL12 END)) -
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' THEN D.COL13 END)) AS COL3,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' THEN D.COL12 END)) -
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' THEN D.COL14 END)) AS COL4,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' THEN D.COL14 END)) AS COL5,
     
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (1) THEN D.COL12 END)) AS COL6,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (1) THEN D.COL13 END)) AS COL7,
 
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (1) THEN D.COL12 END))- 
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (1) THEN D.COL13 END)) AS COL8,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (1) THEN D.COL12 END))-
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (1) THEN D.COL14 END)) AS COL9,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (1) THEN D.COL14 END)) AS COL10,
    
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (25) THEN D.COL12 END)) AS COL11,
    
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (25) THEN D.COL13 END)) AS COL12,
      
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (25)  THEN D.COL12 END))-
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058 AND  C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (25) THEN D.COL13 END)) AS COL13,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  AND C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (25) THEN D.COL12 END))-
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  AND C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (25) THEN D.COL14 END)) AS COL14,
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  AND C.FULL_CODE LIKE  '%'||CC.CODUL||'%' AND R.NFI IN (25) THEN D.COL14 END)) AS COL15

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
--  (:pID_MDTABLE=:pID_MDTABLE) AND
--  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (50)                 AND 
  D.CAPITOL IN (1058) AND     
    
  (
  
  D.RIND NOT IN 
       
       (
       
        SELECT 
        CODUL
        
        FROM CIS2.CL_TARI_CS
        
       )
        
     AND 
     
     D.RIND NOT IN ('010','020','030','035','040','050','060','090','-','100','110','120')
     
       )   

 
  
   ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)   
 
 
     INNER JOIN  (SELECT  
        
        RINDOUT CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13834) C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
     
    CROSS JOIN   (SELECT  
        
        TRIM(RINDOUT) CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13834)   CC 


INNER JOIN CIS2.RENIM R ON (D.CUIIO=R.CUIIO AND D.CUIIO_VERS=R.CUIIO_VERS)

    
 
 WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (50)                 AND 
  D.CAPITOL IN (1058) 
  AND D.CUIIO = 400001



  GROUP BY 



  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  CC.ORDINE
   
  
  
  ORDER BY
  CC.ORDINE