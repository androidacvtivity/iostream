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
-- COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,COL12,COL13,COL14,COL15,COL16,COL17,COL18,COL19,COL20,COL21
--)

SELECT
--  :pPERIOADA AS PERIOADA,
--  :pFORM AS FORM,
--  :pFORM_VERS AS FORM_VERS,
--  :pID_MDTABLE AS ID_MDTABLE,
--  :pCOD_CUATM AS COD_CUATM,
--  '0' AS NR_SECTIE,
--  '0' AS NUME_SECTIE,
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
   CODUL||'~'||ORDINE AS NR_ROW,
   ROWNUM AS ORDINE,
  '001111110000111111111' AS DECIMAL_POS,
   DENUMIRE AS NUME_ROW,
   ROUND(COL1,1) AS COL1,
   ROUND(COL2,1) AS COL2,
   ROUND(COL3,1) AS COL3,
   ROUND(COL4,1) AS COL4,
   ROUND(COL5,1) AS COL5,
   ROUND(COL6,1) AS COL6,
   ROUND(COL7,1) AS COL7,
   ROUND(COL8,1) AS COL8,
   ROUND(COL9,1) AS COL9,
   ROUND(COL10,1) AS CO10,
   ROUND(COL11,1) AS COL11,
   ROUND(COL12,1) AS COL12,
   ROUND(COL13,1) AS COL13,
   ROUND(COL14,1) AS COL14,
   ROUND(COL15,1) AS COL15,
   ROUND(COL16,1) AS COL16,
   ROUND(COL17,1) AS CO17,
   ROUND(COL18,1) AS COL18,
   ROUND(COL19,1) AS COL19,
   ROUND(COL20,1) AS COL20,
   ROUND(COL21,1) AS COL21
   
   
FROM
(
SELECT
  DENUMIRE, 
  CODUL,
  FULL_CODE,
  ORDINE,
  PRGS,
  COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,COL12,COL13,COL14,COL15,COL16,COL17,COL18,COL19,COL20,COL21
FROM
(
SELECT
  CC.DENUMIRE,CC.CODUL, CC.FULL_CODE, 0 AS ORDINE, CC.PRGS,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL1 ELSE 0 END)) AS COL1,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL2 ELSE 0 END)) AS COL2,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL3 ELSE 0 END)) AS COL3,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL4 ELSE 0 END)) AS COL4,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL5 ELSE 0 END)) AS COL5,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL6 ELSE 0 END)) AS COL6,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL7 ELSE 0 END)) AS COL7,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL8 ELSE 0 END)) AS COL8,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL9 ELSE 0 END)) AS COL9,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL1 ELSE 0 END)) AS COL10,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL2 ELSE 0 END)) AS COL11,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL3 ELSE 0 END)) AS COL12,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL4 ELSE 0 END)) AS COL13,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL5 ELSE 0 END)) AS COL14,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL6 ELSE 0 END)) AS COL15,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL7 ELSE 0 END)) AS COL16,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL8 ELSE 0 END)) AS COL17,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL9 ELSE 0 END)) AS COL18,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL10 ELSE 0 END)) AS COL19,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL11 ELSE 0 END)) AS COL20,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL12 ELSE 0 END)) AS COL21
  
FROM
  CIS2.VW_DATA_ALL D
 INNER JOIN CIS2.VW_CL_CUATM C ON (D.RIND=C.CODUL )
--  INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||'%')
INNER JOIN CIS2.VW_CL_CUATM CC ON ((C.CODUL=CC.CODUL AND CC.PRGS IN (8,3,5)) OR (CC.PRGS NOT IN (8,3,5) AND C.FULL_CODE LIKE '%'||CC.CODUL||'%'))
  
WHERE
  (D.PERIOADA=:pPERIOADA) AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
   D.FORM = 47 AND
  -- D.CUIIO = 4499605 AND
   D.CAPITOL IN (1034,1035) AND CC.PRGS NOT IN 4  AND
   C.FULL_CODE LIKE '%'||:pCOD_CUATM||'%'
     AND D.RIND LIKE '%8526000%'
   
GROUP BY CC.DENUMIRE,
  CC.CODUL, CC.FULL_CODE,CC.PRGS

UNION
SELECT
  DENUMIRE,
  CODUL,
  FULL_CODE,
  ORDINE,
  PRGS,
  COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,COL12,COL13,COL14,COL15,COL16,COL17,COL18,COL19,COL20,COL21
FROM
(
SELECT
'Localitati urbane' AS DENUMIRE,
  CC.CODUL, CC.FULL_CODE, 1 AS ORDINE, CC.PRGS,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL1 ELSE 0 END)) AS COL1,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL2 ELSE 0 END)) AS COL2,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL3 ELSE 0 END)) AS COL3,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL4 ELSE 0 END)) AS COL4,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL5 ELSE 0 END)) AS COL5,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL6 ELSE 0 END)) AS COL6,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL7 ELSE 0 END)) AS COL7,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL8 ELSE 0 END)) AS COL8,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL9 ELSE 0 END)) AS COL9,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL1 ELSE 0 END)) AS COL10,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL2 ELSE 0 END)) AS COL11,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL3 ELSE 0 END)) AS COL12,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL4 ELSE 0 END)) AS COL13,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL5 ELSE 0 END)) AS COL14,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL6 ELSE 0 END)) AS COL15,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL7 ELSE 0 END)) AS COL16,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL8 ELSE 0 END)) AS COL17,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL9 ELSE 0 END)) AS COL18,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL10 ELSE 0 END)) AS COL19,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL11 ELSE 0 END)) AS COL20,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL12 ELSE 0 END)) AS COL21
  
FROM
  CIS2.VW_DATA_ALL D
   INNER JOIN CIS2.VW_CL_CUATM C ON (D.RIND=C.CODUL )
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||'%')
 INNER JOIN CIS2.VW_CL_CUATM CC ON ((C.CODUL=CC.CODUL AND CC.PRGS IN (3)) OR (CC.PRGS NOT IN (3) AND C.FULL_CODE LIKE '%'||CC.CODUL||'%'))
  
WHERE
  (D.PERIOADA=:pPERIOADA) AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
   D.FORM = 47 AND
   D.CAPITOL IN (1034,1035) AND
   --D.CUIIO = 4499605 AND
   C.PRGS IN (2,3,4,5) AND
   C.FULL_CODE LIKE '%'||:pCOD_CUATM||'%'
     AND D.RIND LIKE '%8526000%'
   
GROUP BY CC.DENUMIRE,
  CC.CODUL, CC.FULL_CODE, CC.PRGS
ORDER BY CC.FULL_CODE
)
WHERE
  PRGS IN (2)
  
  
  
  
UNION

SELECT
  DENUMIRE,
  CODUL,
  FULL_CODE,
  ORDINE,
  PRGS,
  COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,COL12,COL13,COL14,COL15,COL16,COL17,COL18,COL19,COL20,COL21
FROM
(
SELECT
'Localitati rurale' AS DENUMIRE,
  CC.CODUL, CC.FULL_CODE, 2 AS ORDINE, CC.PRGS,
 CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL1 ELSE 0 END)) AS COL1,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL2 ELSE 0 END)) AS COL2,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL3 ELSE 0 END)) AS COL3,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL4 ELSE 0 END)) AS COL4,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL5 ELSE 0 END)) AS COL5,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL6 ELSE 0 END)) AS COL6,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL7 ELSE 0 END)) AS COL7,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL8 ELSE 0 END)) AS COL8,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1034) AND D.RIND NOT IN '0000000' THEN COL9 ELSE 0 END)) AS COL9,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL1 ELSE 0 END)) AS COL10,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL2 ELSE 0 END)) AS COL11,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL3 ELSE 0 END)) AS COL12,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL4 ELSE 0 END)) AS COL13,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL5 ELSE 0 END)) AS COL14,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL6 ELSE 0 END)) AS COL15,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL7 ELSE 0 END)) AS COL16,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL8 ELSE 0 END)) AS COL17,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL9 ELSE 0 END)) AS COL18,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL10 ELSE 0 END)) AS COL19,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL11 ELSE 0 END)) AS COL20,
  CIS2.NVAL(SUM(CASE WHEN CAPITOL IN (1035) AND D.RIND NOT IN '0000000' THEN COL12 ELSE 0 END)) AS COL21
  
FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.VW_CL_CUATM C ON (D.RIND=C.CODUL )
 -- INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||'%')
 INNER JOIN CIS2.VW_CL_CUATM CC ON ((C.CODUL=CC.CODUL AND CC.PRGS IN (8)) OR (CC.PRGS NOT IN (8) AND C.FULL_CODE LIKE '%'||CC.CODUL||'%'))
  
WHERE
  (D.PERIOADA=:pPERIOADA) AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
   D.FORM = 47 AND
   D.CAPITOL IN (1034,1035) AND
    --D.CUIIO = 4499605 AND
   C.PRGS IN (6,8,9) AND
   C.FULL_CODE LIKE '%'||:pCOD_CUATM||'%'
   AND D.RIND LIKE '%8526000%'
   
GROUP BY CC.DENUMIRE,
  CC.CODUL, CC.FULL_CODE, CC.PRGS
ORDER BY CC.FULL_CODE
)
WHERE
  PRGS IN (2)
)
ORDER BY
  FULL_CODE,
  ORDINE  
  )