INSERT INTO CIS2.TABLE_OUT 
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
  COL1,COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15--, COL16
)

SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  NR_SECTIE AS NR_SECTIE,
  NUME_SECTIE AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' as NR_SECTIE2,
  '0' as NUME_SECTIE2,
---------------------------------
  LL.ITEM_CODE NR_ROW,
  LL.ORDINE AS ORDINE,
 '00000000000000000' AS DECIMAL_POS,
  LL.NAME NUME_ROW,
   CASE WHEN  L.COL1 =  0 THEN NULL ELSE L.COL1 END COL1,
    CASE WHEN  L.COL2 =  0 THEN NULL ELSE L.COL2 END COL2,
    CASE WHEN  L.COL3 =  0 THEN NULL ELSE L.COL3 END COL3,
    CASE WHEN  L.COL4 =  0 THEN NULL ELSE L.COL4 END COL4,
    CASE WHEN  L.COL5 =  0 THEN NULL ELSE L.COL5 END COL5,
    CASE WHEN  L.COL6 =  0 THEN NULL ELSE L.COL6 END COL6,
    CASE WHEN  L.COL7 =  0 THEN NULL ELSE L.COL7 END COL7,
    CASE WHEN  L.COL8 =  0 THEN NULL ELSE L.COL8 END COL8,
    CASE WHEN  L.COL9 =  0 THEN NULL ELSE L.COL9 END COL9,
    CASE WHEN  L.COL10 =  0 THEN NULL ELSE L.COL10 END COL10,
    CASE WHEN  L.COL11 =  0 THEN NULL ELSE L.COL11 END COL11,
    CASE WHEN  L.COL12 =  0 THEN NULL ELSE L.COL12 END COL12,
    CASE WHEN  L.COL13 =  0 THEN NULL ELSE L.COL13 END COL13,
    CASE WHEN  L.COL14 =  0 THEN NULL ELSE L.COL14 END COL14,
    CASE WHEN  L.COL15 =  0 THEN NULL ELSE L.COL15 END COL15 
  
FROM
(
SELECT
  NR_SECTIE,
  NUME_SECTIE,
  NR_ROW AS NR_ROW,
  rownum AS ORDINE,
  '00000000000000000' AS DECIMAL_POS,
  NUME_ROW AS NUME_ROW,
  COL1,COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15--, COL16
FROM
(
SELECT
 
CTM.NR_ROW    AS NR_SECTIE,
  CTM.NUME_ROW AS NUME_SECTIE,
   CASE WHEN ltrim(TO_NUMBER(CC.codul),'0') IS NULL THEN '0' ELSE ltrim(TO_NUMBER(CC.codul),'0')  END   NR_ROW,
   CC.DENUMIRE NUME_ROW,
   CC.ORDINE,
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1058)  THEN D.COL15 END)) AS COL1,
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   THEN D.COL16 END)) AS COL2,
 
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   THEN D.COL15 END)) -
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   THEN D.COL16 END)) AS COL3,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  THEN D.COL15 END)) -
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  THEN D.COL17 END)) AS COL4,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  THEN D.COL17 END)) AS COL5,
     
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  AND R.NFI IN (1) THEN D.COL15 END)) AS COL6,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  AND R.NFI IN (1) THEN D.COL16 END)) AS COL7,
 
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   AND R.NFI IN (1) THEN D.COL15 END))- 
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   AND R.NFI IN (1) THEN D.COL16 END)) AS COL8,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  AND R.NFI IN (1) THEN D.COL15 END))-
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   AND R.NFI IN (1) THEN D.COL17 END)) AS COL9,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   AND R.NFI IN (1) THEN D.COL17 END)) AS COL10,
    
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   AND R.NFI IN (25) THEN D.COL15 END)) AS COL11,
    
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058  AND R.NFI IN (25) THEN D.COL16 END)) AS COL12,
      
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058   AND R.NFI IN (25)  THEN D.COL15 END))-
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058    AND R.NFI IN (25) THEN D.COL16 END)) AS COL13,
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058    AND R.NFI IN (25) THEN D.COL15 END))-
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058    AND R.NFI IN (25) THEN D.COL17 END)) AS COL14,
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1058    AND R.NFI IN (25) THEN D.COL17 END)) AS COL15

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
     
    INNER  JOIN   (SELECT  
        
        TRIM(RINDOUT) CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13834)  CC ON   C.FULL_CODE LIKE '%'||CC.CODUL||';%'


INNER JOIN CIS2.RENIM R ON (D.CUIIO=R.CUIIO AND D.CUIIO_VERS=R.CUIIO_VERS)

    INNER JOIN CIS2.VW_CL_CUATM CCU ON(D.CUATM = CCU.CODUL)
   CROSS JOIN 
  (
    SELECT
      DECODE(CS.CODUL, 
     -- '0000000','01',
'0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39',
      '9601000','40')
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      CIS2.VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         --'0000000',
'0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000','9601000')
  ) CTM 
 
 WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
    CCU.FULL_CODE LIKE '%'||CTM.CS_CUATM||'%' AND
  D.FORM IN (50)                 AND 
  D.CAPITOL IN (1058) 
  --AND D.CUIIO = 400001



  GROUP BY 



  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  CC.ORDINE,
     CTM.NR_ROW,   
   CTM.NUME_ROW 
   
  
  
  ORDER BY
  CC.ORDINE ) ) L  RIGHT JOIN (

SELECT 
C.ITEM_CODE,
REPLACE(C.ITEM_CODE, '.', '') AS COD_SPEC,
NAME,
C.SHOW_ORDER ORDINE
FROM CIS2.VW_CLS_CLASS_ITEM C

WHERE 
C.CLASS_CODE = 'SPEC_3EDU') LL ON LL.COD_SPEC = L.NR_ROW

WHERE
 L.NR_ROW IS NOT NULL