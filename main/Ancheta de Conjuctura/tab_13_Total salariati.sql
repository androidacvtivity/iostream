SELECT
  TR.NR_TABLE,
  TR.TABLE_DENUMIRE,
  TR.RIND_DENUMIRE,
  TR.ORDINE,
  TR.RIND,
--  SUBSTR(A.CAEM2,1,1),
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.1') AND A.COL1 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL1,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.2') AND A.COL1 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL2,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.3') AND A.COL1 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL3,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.4') AND A.COL1 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL4,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.5') AND A.COL1 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL5,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.1') AND A.COL2 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL6,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.2') AND A.COL2 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL7,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.3') AND A.COL2 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL8,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.4') AND A.COL2 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL9,
  COUNT(DISTINCT CASE WHEN A.RIND IN ('13.5') AND A.COL2 IN (1) AND (TR.RIND LIKE '%'|| SUBSTR(A.CAEM2,1,1) ||'%' OR (ROUND(BS.PERS_IT) >= TR.PERS_INIT AND ROUND(BS.PERS_IT) <= TR.PERS_FINAL)) THEN A.CUIIO END) AS COL10
FROM
(SELECT
  D.ANUL,
  D.CUIIO,
  D.CUATM,
  D.CAEM2,
  D.CAPITOL,
  D.RIND,
  D.COL1, 
  D.COL2
FROM 
   CIS2.VW_DATA_ALL D
WHERE
  D.PERIOADA IN (:pPERIOADA) AND
  D.FORM IN (:pFORM) AND 
  D.CAPITOL IN (1197) AND
  D.RIND IN ('13.1','13.2','13.3','13.4','13.5')
) A LEFT JOIN
   CIS2.X_BAZA_SONDAJ BS ON (A.CUIIO=BS.CUIIO AND BS.ANUL=2024)
  CROSS JOIN 
  (
    SELECT 1 AS NR_TABLE, 'CAEM2' AS TABLE_DENUMIRE, NULL AS PERS_INIT, NULL AS PERS_FINAL, 'B+C+D+E+F+G+H+I+J+L+M+N+R+S' AS RIND, 'Total activitati' AS RIND_DENUMIRE, '0.1' AS ORDINE FROM DUAL UNION
    SELECT 1 AS NR_TABLE, 'CAEM2' AS TABLE_DENUMIRE, NULL AS PERS_INIT, NULL AS PERS_FINAL, 'B+C+D+E' AS RIND, 'Industrie (B+C+D+E)' AS RIND_DENUMIRE, '0.2' AS ORDINE FROM DUAL UNION
    SELECT 1 AS NR_TABLE, 'CAEM2' AS TABLE_DENUMIRE, NULL AS PERS_INIT, NULL AS PERS_FINAL, 'F' AS RIND, 'Conctruc?ie (F)' AS RIND_DENUMIRE, '123.1' AS ORDINE FROM DUAL UNION
    SELECT 1 AS NR_TABLE, 'CAEM2' AS TABLE_DENUMIRE, NULL AS PERS_INIT, NULL AS PERS_FINAL, 'G+H+I+J+L+M+N+R+S' AS RIND, 'Servicii (G+H+I+J+L+M+N+R+S)' AS RIND_DENUMIRE, '135.1' AS ORDINE FROM DUAL UNION
    SELECT 2 AS NR_TABLE, 'Clasa de marime' AS TABLE_DENUMIRE, 0 AS PERS_INIT, 999999 AS PERS_FINAL, NULL AS RIND, 'Total salariati' AS RIND_DENUMIRE, '1' AS ORDINE FROM DUAL UNION
    SELECT 2 AS NR_TABLE, 'Clasa de marime' AS TABLE_DENUMIRE, 0 AS PERS_INIT, 9 AS PERS_FINAL, NULL AS RIND, '0-9 salariati' AS RIND_DENUMIRE, '2' AS ORDINE FROM DUAL UNION
    SELECT 2 AS NR_TABLE, 'Clasa de marime' AS TABLE_DENUMIRE, 10 AS PERS_INIT, 49 AS PERS_FINAL, NULL AS RIND, '10-49 salariati' AS RIND_DENUMIRE, '3' AS ORDINE FROM DUAL UNION
    SELECT 2 AS NR_TABLE, 'Clasa de marime' AS TABLE_DENUMIRE, 50 AS PERS_INIT, 249 AS PERS_FINAL, NULL AS RIND, '50-249 salariati' AS RIND_DENUMIRE, '4' AS ORDINE FROM DUAL UNION
    SELECT 2 AS NR_TABLE, 'Clasa de marime' AS TABLE_DENUMIRE, 250 AS PERS_INIT, 999999 AS PERS_FINAL, NULL AS RIND, '250 si peste salariati' AS RIND_DENUMIRE, '5' AS ORDINE FROM DUAL
  ) TR
GROUP BY
  TR.NR_TABLE,
  TR.TABLE_DENUMIRE,
  TR.RIND_DENUMIRE,
  TR.ORDINE,
  TR.RIND
--  A.CAEM2
--ORDER BY
--  TR.NR_TABLE,
--  TR.ORDINE