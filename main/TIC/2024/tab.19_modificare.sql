----INSERT INTO CIS2.TABLE_OUT 
----(
----  PERIOADA,
----  FORM,
----  FORM_VERS,
----  ID_MDTABLE,
----  COD_CUATM,
----  NR_SECTIE,
----  NUME_SECTIE,
----  NR_SECTIE1,
----  NUME_SECTIE1,
----  NR_SECTIE2,
----  NUME_SECTIE2,
----  NR_ROW,
----  ORDINE,
----  DECIMAL_POS,
----  NUME_ROW,   
----  COL1,
----  COL2,
----  COL3
----)
--
------------------------------
--
--SELECT 
--  :pPERIOADA AS PERIOADA,
--  :pFORM AS FORM,
--  :pFORM_VERS AS FORM_VERS,
--  :pID_MDTABLE AS ID_MDTABLE,
--  :pCOD_CUATM AS COD_CUATM,
--         
--  '0' AS NR_SECTIE,
--  '0' AS NUME_SECTIE,
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
--   NR_ROW||'~'||ROWNUM AS NR_ROW,
--   ROWNUM  AS ORDINE,
--  '002' AS DECIMAL_POS,
--   NUME_ROW,
--
--   COL1,
--   COL2,
--   ROUND(COL1 / COL2,1) COL3
--FROM
--
--
--(
--SELECT 
--   CODUL  AS NR_ROW,
--   DENUMIRE AS NUME_ROW,
--   FULL_CODE,
--   SUM(COL1) AS COL1,
--   SUM(COL2) AS COL2,
--   SUM(COL3) AS COL3
--FROM
--(
SELECT
DISTINCT 
D.CUIIO,
D.CUIIO_VERS,
D.CAPITOL,
D.CAPITOL_VERS,



SUM(CASE WHEN D.CAPITOL = 1206 AND D.RIND IN ('900') THEN D.COL1 ELSE 0 END ) AS COL1,
COUNT(DISTINCT CASE WHEN D.CAPITOL = 1195 AND D.RIND IN ('1') AND  NVAL(D.COL1) = 1 THEN D.CUIIO ELSE 0 END ) AS COL2,

ROUND(SUM(CASE WHEN D.CAPITOL = 1206 AND D.RIND IN ('900') THEN D.COL1 ELSE 0 END) 
/ COUNT(DISTINCT CASE WHEN D.CAPITOL = 1195 AND D.RIND IN ('1') AND  NVAL(D.COL1) = 1 THEN D.CUIIO ELSE 0 END ),2)
 AS COL3,
 
 SUM(CASE WHEN D.CAPITOL = 1195 AND D.RIND IN ('1') THEN NVAL(D.COL1) ELSE 0 END ) AS COL4

    FROM
      CIS2.VW_DATA_ALL D     
                   
                   INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS  
--       
    WHERE  
       D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS = :pFORM_VERS  AND  
      (:pID_MDTABLE=:pID_MDTABLE) AND
       D.FORM = 71 AND
--       D.CAPITOL IN (1206) AND
       D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
  
    --  AND CC.PRGS IN ('2')
      
      AND D.CAPITOL IN  (1206,1195)
      AND D.CUIIO = 227548
GROUP BY  

D.CUIIO,
D.CUIIO_VERS,
D.CAPITOL,
D.CAPITOL_VERS

--CC.CODUL,
--CC.DENUMIRE,
--CC.FULL_CODE


--HAVING 
--
--SUM(CASE WHEN D.CAPITOL = 1195 AND D.RIND IN ('1') THEN NVAL(D.COL1) ELSE 0 END ) = 1 -- 13784

--AND 
--
--SUM(CASE WHEN D.CAPITOL = 1206 AND D.RIND IN ('900') THEN NVAL(D.COL1) ELSE 0 END ) > 0 --14039



--ORDER BY  
--CC.FULL_CODE


--)
--
--
--GROUP BY
--CODUL,
--FULL_CODE,
--DENUMIRE
--
--ORDER BY
--FULL_CODE
----)