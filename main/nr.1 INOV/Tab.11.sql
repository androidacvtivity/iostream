--INSERT INTO CIS2.TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,  
--  COL1,COL2
--)
SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   1  AS NR_ROW,
   1  AS ORDINE,
  '00' AS DECIMAL_POS,
  'Total intreprinderi' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(
SELECT
  D.CUIIO,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN D.CAPITOL||'.'||D.RIND IN ('100.00','100.01','100.02','100.03','100.04','100.05','100.06','100.07')THEN D.CUIIO END )) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO
)

--
UNION

SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   2  AS NR_ROW,
   2  AS ORDINE,
  '00' AS DECIMAL_POS,
  'Intreprinderi inovatoare - total' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(
SELECT
  D.CUIIO,
   CIS2.NVAL(MAX(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2', '1042.3.1.1','1042.3.1.2','1042.3.1.3','1046.7.1.1','1046.7.1.2','1046.7.1.3','1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 
  THEN D.COL1 ELSE NULL END)) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO
)
--
UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   3  AS NR_ROW,
   3 AS ORDINE,
  '00' AS DECIMAL_POS,
  '�ntreprinderi care au realizat mai multe tipuri de inovari (de produs, proces, metode de organizare ?i marketing)' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(
SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING

 ((CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+

  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))) > 0 AND
  
  (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
    
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))> 0 )
  
  )
 --- 
--  OR
-- ------- 
--  ((CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))= 0 AND
--  
--  (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1)  
----  
 ---- 
--  OR
-- ----- 
-- ((CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))) =1 AND
--  
--  (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0 AND
--  
-- (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
--  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0)
--
    UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   4  AS NR_ROW,
   4  AS ORDINE,
  '00' AS DECIMAL_POS,
  '�ntreprinderi inovatoare de produse ?i/sau procese' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(
SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING

 ((CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+

  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0 AND
    
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 ) 
 ----- 
  OR
 ------- 
  ((CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+

  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))= 0 AND
  
  (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1)  
  
 ---- 
  OR
 ----- 
 ((CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+

  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))) =0 AND
  
  (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 AND
  
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1)
  
)

--
    UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   5  AS NR_ROW,
   5  AS ORDINE,
  '00' AS DECIMAL_POS,
  'intreprinderi inovatoare doar de produse' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(

SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING

 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+

  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0
  
   AND
    
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 
)

---

    UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   6  AS NR_ROW,
   6  AS ORDINE,
  '00' AS DECIMAL_POS,
  'intreprinderi inovatoare doar de procese'
  AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(

SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+

  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))= 0 AND
  
  (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1
)

---


    UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   7  AS NR_ROW,
   7  AS ORDINE,
  '00' AS DECIMAL_POS,
  'intreprinderi inovatoare de produse ?i procese' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(

SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING

 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+

  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))) =0 AND
  
  (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 AND
  
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1
)

---


    UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   8  AS NR_ROW,
   8  AS ORDINE,
  '00' AS DECIMAL_POS,
  'Intreprinderi inovatoare de metode de organizare si/sau marketing ' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(

SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING

((CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+


  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0  AND
  
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1)
  
 ---
  OR
 ---
 (
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 AND


 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0)
  
  --
  OR
  --
 ( (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 AND
  
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 AND

 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0)
)

---


    UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   9  AS NR_ROW,
   9  AS ORDINE,
  '00' AS DECIMAL_POS,
  'intreprinderi inovatoare doar de metode de organizare ' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(

SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING

 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+


  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0  AND
  
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1
  

)

---


    UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   10  AS NR_ROW,
   10  AS ORDINE,
  '00' AS DECIMAL_POS,
  'intreprinderi inovatoare doar de metode de  marketing ' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(

SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING

(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 AND


 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0
  

)

---


    UNION
    
    SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   11  AS NR_ROW,
   11  AS ORDINE,
  '00' AS DECIMAL_POS,
  '�ntreprinderi inovatoare de metode de organizare ?i metode de marketing ' AS NUME_ROW,
  SUM(COL1) AS COL1,
  NULL AS COL2
   
FROM
(

SELECT
  COUNT(DISTINCT D.CUIIO) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO

HAVING

(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1047.8.1.4') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 AND
  
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1046.7.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))>=1 AND

 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.2') AND D.COL1=1 THEN D.COL1 ELSE NULL END))+
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1042.3.1.3') AND D.COL1=1 THEN D.COL1 ELSE NULL END)))=0
  
)
  

