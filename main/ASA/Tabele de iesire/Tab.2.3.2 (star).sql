--DECLARE
--
--  CURSOR C IS
--  
---- FINAL SELECT ===============================================================
--SELECT
--  DF.PERIOADA,
--  DF.FORM,
--  DF.FORM_VERS,
--  DF.ID_MDTABLE,
--  DF.COD_CUATM,
--  DF.NR_SECTIE,
--  DF.NUME_SECTIE,
--  DF.NR_SECTIE1,
--  DF.NUME_SECTIE1,
--  DF.NR_SECTIE2,
--  DF.NUME_SECTIE2,
--  DF.NR_ROW ,
--  DF.ORDINE,
--  DF.DECIMAL_POS,
--  DF.NUME_ROW ,  
--  DF.COL1,  DF.COL2,  DF.COL3,  DF.COL4,  DF.COL5,  DF.COL6,  DF.COL7,  DF.COL8,  DF.COL9,  DF.COL10, DF.COL11, DF.COL12, DF.COL13,
--  DF.COL14, DF.COL15, DF.COL16, DF.COL17, DF.COL18, DF.COL19, DF.COL20, DF.COL21, DF.COL22, DF.COL23, DF.COL24, DF.COL25, DF.COL26,
--  DF.COL27, DF.COL28
--
--
--FROM
--(--

BEGIN
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
 COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19,
    COL20, COL21, COL22,COL23,COL24,COL25,COL26,COL27,COL28
)
SELECT 
 
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,    
 '0' AS  NR_SECTIE,
 '0' AS  NUME_SECTIE,
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2, 
NR_ROW,
ROWNUM AS ORDINE,--||'~'||ORDINE
'22222222222222222222222222222222222222222222222222' AS DECIMAL_POS,

NUME_ROW,
ROUND(COL1,2) AS COL1, ROUND(COL2,2) AS COL2,ROUND(COL3,2) AS COL3, ROUND(COL4,2)  AS COL4, ROUND(COL5,2)  AS COL5, ROUND(COL6,2)  AS COL6,
ROUND(COL7,1) AS COL7, ROUND(COL8,2) AS COL8,ROUND(COL9,2) AS COL9, ROUND(COL10,2) AS COL10,ROUND(COL11,2) AS COL11,ROUND(COL12,2) AS COL12,
ROUND(COL13,2) AS COL13, ROUND(COL14,2) AS COL14, ROUND(COL15,2) AS COL15, ROUND(COL16,2) AS COL16, ROUND(COL17,2) AS COL17,ROUND(COL18,2) AS COL18,
ROUND(COL19,2) AS COL19, ROUND(COL20,2) AS COL20, ROUND(COL21,2) AS COL21, ROUND(COL22,2) AS COL22, ROUND(COL23,2) AS COL23,ROUND(COL24,2) AS COL24,
ROUND(COL25,2) AS COL25, ROUND(COL26,2) AS COL26, ROUND(COL27,2) AS COL27, ROUND(COL28,2) AS COL28
     FROM (
SELECT 
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,    
  NR_SECTIE,
  NUME_SECTIE,
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2, 
NR_ROW||'~'|| NR_SECTIE||COL1||'1' AS NR_ROW,
 1||ORDINE AS ORDINE,
'22222222222222222222222222222222222222222222222222' AS DECIMAL_POS,
NUME_ROW,
COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19,
    COL20, COL21, COL22,COL23,COL24,COL25,COL26,COL27,COL28
FROM
(
SELECT 
    NR_ROW AS NR_SECTIE ,         
    NUME_ROW AS NUME_SECTIE,  
    DENUMIRE AS NUME_ROW,
    CODUL AS NR_ROW,    
    ORDINE,
    COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19,
    COL20, COL21, COL22,COL23,COL24,COL25,COL26,COL27,COL28
   
   FROM(

SELECT 
   '05' AS NR_ROW,
   'Intreprinderile cu numarul de salariati 0-249 persoane' AS NUME_ROW,
   CC.FULL_CODE,
   CASE WHEN  CC.CODUL like '%0000' THEN CC.DENUMIRE END AS DENUMIRE,   
   CASE WHEN  Substr(CC.CODUL,1,1)||'0000' IS NOT NULL THEN Substr(CC.CODUL,1,1)||'0000' END AS codul, 
   '05'||'~'||CC.FULL_CODE AS ORDINE,
   
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN  DR.COL1 ELSE 0 END)  AS COL1, 
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DD.COL0 BETWEEN 0 AND 3  AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN DR.COL1  END) AS COL2, 
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DD.COL0 BETWEEN 3 AND 6  AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN DR.COL1  END) AS COL3, 
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DD.COL0 BETWEEN 6 AND 9  AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN DR.COL1  END) AS COL4, 
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DD.COL0 BETWEEN 9 AND 12  AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN DR.COL1  END) AS COL5,
   
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('300') THEN  DR.COL1 END) AS COL6,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('300') THEN  DR.COL2 END) AS COL7,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('310') THEN  DR.COL1 END) AS COL8,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('310') THEN  DR.COL2 END) AS COL9,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('320') THEN  DR.COL1 END) AS COL10,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('320') THEN  DR.COL2 END) AS COL11,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('330') THEN  DR.COL1 END) AS COL12,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('330') THEN  DR.COL2 END) AS COL13,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('340') THEN  DR.COL1 END) AS COL14,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('340') THEN  DR.COL2 END) AS COL15,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('350') THEN  DR.COL1 END) AS COL16,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('350') THEN  DR.COL2 END) AS COL17,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('360') THEN  DR.COL1 END) AS COL18,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('360') THEN  DR.COL2 END) AS COL19,
   
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('400') THEN  DR.COL3 END) AS COL20,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('400') THEN  DR.COL4 END) AS COL21,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('400') THEN  DR.COL5 END) AS COL22,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('500') THEN  DR.COL8 END) AS COL23,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('500') THEN  DR.COL9 END) AS COL24,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('500') THEN  DR.COL10 END) AS COL25,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('510') THEN  DR.COL8 END) AS COL26,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('510') THEN  DR.COL9 END) AS COL27,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('510') THEN  DR.COL10 END) AS COL28
   
                                                                                     
                
    FROM
    
    
    CIS2.VW_DATA_ALL_COEF DR INNER JOIN
    
    (
-------------------------------------------------------------------------------     
         SELECT 
    DISTINCT D.CUIIO,D.CUIIO_VERS, D.CUATM,
 MAX( CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END )  AS CAEM2_ACTUALIZAT,
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2,
    D.PERIOADA,D.FORM_VERS,D.FORM,CUATM_FULL,D.CFOJ,
    SUM(CASE WHEN D.CAPITOL IN (1123) AND D.RIND IN ('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII') THEN  D.COL1 ELSE 0 END)  AS COL0 ,  
    SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  D.COL4 ELSE 0 END)  AS COL4,
    SUM(CASE WHEN D.CAPITOL IN (100) AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)  AS CD,
    (SELECT  CASE WHEN DD.COL4 IS NOT NULL THEN DD.COL4 ELSE 0 END 
 FROM
   CIS2.DATA_ALL DD
 WHERE
   DD.PERIOADA IN (D.PERIOADA) AND
   DD.FORM=D.FORM AND
   DD.ID_MD IN (69986) AND
   DD.CUIIO IN (D.CUIIO)) AS PERS  
FROM   
    CIS2.VW_DATA_ALL_COEF D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (100,1123,1127,1129)
  AND D.RIND IN ('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII','400','CD','8')
-- AND  D.CUIIO=40075114
 GROUP BY D.CUIIO,D.CUIIO_VERS, D.CUATM,D.PERIOADA,D.FORM_VERS,D.FORM,CUATM_FULL,D.CFOJ
 
 HAVING
 
 SUM(CASE WHEN D.CAPITOL IN (100) AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)>0

) DD ON DR.CUIIO=DD.CUIIO AND DR.CUIIO_VERS=DD.CUIIO_VERS

 INNER JOIN CIS2.VW_CL_CAEM2 C ON SUBSTR(C.CODUL,2,4)  = CASE WHEN DD.CAEM2_ACTUALIZAT IS NULL THEN DD.CAEM2 ELSE DD.CAEM2_ACTUALIZAT END                 
 INNER JOIN CIS2.VW_CL_CAEM2 CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
 
--  CROSS JOIN
--  ( 
--     SELECT 'Total republica Moldova'     AS NUME_ROW, '05' AS NR_ROW, 0 AS PERS_FROM, 99999999 AS PERS_TO FROM DUAL       
--    
--  ) RR  
         
 WHERE 
  (DR.FORM=:pFORM) AND
  (DR.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (DR.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
  DR.PERIOADA IN (:pPERIOADA) 
 -- AND  C.CODUL LIKE '%00'
 
   GROUP BY
    CC.FULL_CODE,
   CC.DENUMIRE,
    CC.CODUL
--    RR.NR_ROW,       
--    RR.NUME_ROW
     
    ORDER BY 
--     RR.NR_ROW,
     CC.CODUL)
     
     WHERE DENUMIRE IS NOT NULL)
     
     
     UNION
     
     
     
     
SELECT 
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,    
  NR_SECTIE,
  NUME_SECTIE,
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2, 
NR_ROW||'~'|| NR_SECTIE||COL1||'2' AS NR_ROW,
2||ORDINE AS ORDINE,
'22222222222222222222222222222222222222222222222222' AS DECIMAL_POS,
NUME_ROW,
ROUND(COL1,2) AS COL1, ROUND(COL2,2) AS COL2,ROUND(COL3,2) AS COL3, ROUND(COL4,2)  AS COL4, ROUND(COL5,2)  AS COL5, ROUND(COL6,2)  AS COL6,
ROUND(COL7,1) AS COL7, ROUND(COL8,2) AS COL8,ROUND(COL9,2) AS COL9, ROUND(COL10,2) AS COL10,ROUND(COL11,2) AS COL11,ROUND(COL12,2) AS COL12,
ROUND(COL13,2) AS COL13, ROUND(COL14,2) AS COL14, ROUND(COL15,2) AS COL15, ROUND(COL16,2) AS COL16, ROUND(COL17,2) AS COL17,ROUND(COL18,2) AS COL18,
ROUND(COL19,2) AS COL19, ROUND(COL20,2) AS COL20, ROUND(COL21,2) AS COL21, ROUND(COL22,2) AS COL22, ROUND(COL23,2) AS COL23,ROUND(COL24,2) AS COL24,
ROUND(COL25,2) AS COL25, ROUND(COL26,2) AS COL26, ROUND(COL27,2) AS COL27, ROUND(COL28,2) AS COL28
FROM
(
 SELECT
D.NR_ROW AS NR_SECTIE,         
D.NUME_ROW AS NUME_SECTIE,
D.CODUL AS NR_ROW,
ORDINE,
D.DENUMIRE AS NUME_ROW,
COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19,
    COL20, COL21, COL22,COL23,COL24,COL25,COL26,COL27,COL28

FROM(
SELECT 
   '05' AS NR_ROW,
   'Intreprinderile cu numarul de salariati 0-249 persoane' AS NUME_ROW,
   CC.FULL_CODE,
   CC.DENUMIRE,
   CC.CODUL,
   '05'||'~'||CC.FULL_CODE AS ORDINE,
   
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN  DR.COL1 ELSE 0 END)  AS COL1, 
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DD.COL0 BETWEEN 0 AND 3  AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN DR.COL1  END) AS COL2, 
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DD.COL0 BETWEEN 3 AND 6  AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN DR.COL1  END) AS COL3, 
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DD.COL0 BETWEEN 6 AND 9  AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN DR.COL1  END) AS COL4, 
   SUM( CASE  WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND DD.COL0 BETWEEN 9 AND 12  AND DR.CAPITOL IN (100)  AND DR.RIND IN ('CD')  THEN DR.COL1  END) AS COL5,
   
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('300') THEN  DR.COL1 END) AS COL6,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('300') THEN  DR.COL2 END) AS COL7,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('310') THEN  DR.COL1 END) AS COL8,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('310') THEN  DR.COL2 END) AS COL9,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('320') THEN  DR.COL1 END) AS COL10,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('320') THEN  DR.COL2 END) AS COL11,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('330') THEN  DR.COL1 END) AS COL12,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('330') THEN  DR.COL2 END) AS COL13,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('340') THEN  DR.COL1 END) AS COL14,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('340') THEN  DR.COL2 END) AS COL15,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('350') THEN  DR.COL1 END) AS COL16,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('350') THEN  DR.COL2 END) AS COL17,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('360') THEN  DR.COL1 END) AS COL18,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('360') THEN  DR.COL2 END) AS COL19,
   
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('400') THEN  DR.COL3 END) AS COL20,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('400') THEN  DR.COL4 END) AS COL21,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('400') THEN  DR.COL5 END) AS COL22,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('500') THEN  DR.COL8 END) AS COL23,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('500') THEN  DR.COL9 END) AS COL24,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('500') THEN  DR.COL10 END) AS COL25,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('510') THEN  DR.COL8 END) AS COL26,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('510') THEN  DR.COL9 END) AS COL27,
   SUM(CASE WHEN (DD.PERS BETWEEN 0 AND 249 OR DD.PERS IS NULL ) AND  DR.RIND IN ('510') THEN  DR.COL10 END) AS COL28
                                                                                                                                                                          
                
    FROM
    
    
    CIS2.VW_DATA_ALL_COEF DR INNER JOIN
    
    (
-------------------------------------------------------------------------------     
  SELECT 
    DISTINCT D.CUIIO,D.CUIIO_VERS, D.CUATM,
 MAX( CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END )  AS CAEM2_ACTUALIZAT,
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2,
    D.PERIOADA,D.FORM_VERS,D.FORM,CUATM_FULL,D.CFOJ,
    SUM(CASE WHEN D.CAPITOL IN (1123) AND D.RIND IN ('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII') THEN  D.COL1 ELSE 0 END)  AS COL0 ,  
    SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  D.COL4 ELSE 0 END)  AS COL4,
    SUM(CASE WHEN D.CAPITOL IN (100) AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)  AS CD,
    (SELECT  CASE WHEN DD.COL4 IS NOT NULL THEN DD.COL4 ELSE 0 END 
 FROM
   CIS2.DATA_ALL DD
 WHERE
   DD.PERIOADA IN (D.PERIOADA) AND
   DD.FORM=D.FORM AND
   DD.ID_MD IN (69986) AND
   DD.CUIIO IN (D.CUIIO)) AS PERS  
FROM   
    CIS2.VW_DATA_ALL_COEF D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (100,1123,1127,1129)
  AND D.RIND IN ('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII','400','CD','8')
-- AND  D.CUIIO=40075114
 GROUP BY D.CUIIO,D.CUIIO_VERS, D.CUATM,D.PERIOADA,D.FORM_VERS,D.FORM,CUATM_FULL,D.CFOJ
 
 HAVING
 SUM(CASE WHEN D.CAPITOL IN (100) AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)>0

) DD ON DR.CUIIO=DD.CUIIO AND DR.CUIIO_VERS=DD.CUIIO_VERS
-------------------------------------------------------------------------------    

 INNER JOIN CIS2.VW_CL_CAEM2 C ON SUBSTR( C.CODUL,2,4)  = CASE WHEN DD.CAEM2_ACTUALIZAT IS NULL THEN DD.CAEM2 ELSE DD.CAEM2_ACTUALIZAT END                   
 INNER JOIN CIS2.VW_CL_CAEM2 CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
 
--  CROSS JOIN
--  ( 
--    SELECT 'Total republica Moldova'  AS NUME_ROW, '05' AS NR_ROW, 0 AS PERS_FROM, 99999999 AS PERS_TO FROM DUAL       
--    
--  ) RR  
         
 WHERE 
  (DR.FORM=:pFORM) AND
  (DR.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (DR.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
  DR.PERIOADA IN (:pPERIOADA) 
 -- AND  C.CODUL LIKE '%0'
 
   GROUP BY
    CC.FULL_CODE,
    CC.DENUMIRE,
    CC.CODUL
--    RR.NR_ROW,       
--    RR.NUME_ROW
    
    ORDER BY 
--     RR.NR_ROW,
     CC.CODUL
     ) D
     
      WHERE
         
         nval(D.COL1)+nval(D.COL2)+ nval(D.COL3)+nval(D.COL4)+nval(D.COL5)>0 )
     ORDER BY ORDINE) ; END;