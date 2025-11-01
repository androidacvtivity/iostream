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
--  COL1, COL2, COL3
--)

SELECT 
  :pPERIOADA   AS PERIOADA,
  :pFORM       AS FORM,
  :pFORM_VERS  AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM  AS COD_CUATM,    
  NR_TABLE     AS NR_SECTIE,
  TABLE_DENUMIRE AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2, 
  COL1||'~'||ROWNUM  NR_ROW,
  ROWNUM AS ORDINE,
  '000000' AS DECIMAL_POS, 
  RIND_DENUMIRE AS NUME_ROW,

  /* Final mapping unchanged (3 output columns) */
  COL5 AS COL1,   -- total (1.8.1 + 1.8.2 + 1.8.3)
  COL6 AS COL2,   -- 1.8.1
  COL7 AS COL3    -- 1.8.2  (1.8.3 computed internally but not output due to 3-col structure)
  
FROM
(
  SELECT
    A.NR_TABLE,
    A.TABLE_DENUMIRE,
    A.RIND_DENUMIRE,
    A.ORDINE,
    A.RIND,
    ROUND(A.COL1,0) AS COL1,
    ROUND(A.COL2,0) AS COL2,
    ROUND(A.COL3,0) AS COL3,
    ROUND(A.COL4,0) AS COL4,
    ROUND(A.COL5,0) AS COL5,
    ROUND(A.COL6,0) AS COL6,
    ROUND(A.COL7,0) AS COL7,
    ROUND(A.COL8,0) AS COL8
  FROM
  (

    /* =====================
       Bloc 1: Clasa de marime (cu BS)
       ===================== */
    SELECT 
      NR_TABLE,
      TABLE_DENUMIRE,
      RIND_DENUMIRE,
      ORDINE,
      RIND,
      /* Keep structure: COL1/COL2 hold TOTAL-style, COL3..COL6 carry items/total for mapping */
      (COL_18_4) AS COL1,
      (COL_18_1 + COL_18_2 + COL_18_3) AS COL2,
      (COL_18_1 + COL_18_2 + COL_18_3) AS COL3,  -- used to build overall; not mapped directly outside
      (COL_18_1 + COL_18_2 + COL_18_3) AS COL4,  -- mapped to final COL1 (total)
      COL_18_1 AS COL5,                          -- mapped to final COL2 (1.8.1)
      COL_18_2 AS COL6,                          -- mapped to final COL3 (1.8.2)
      COL_18_3 AS COL7,                          -- kept (1.8.3) though not output in 3-col structure
      0 AS COL8
    FROM
    (
      SELECT
        TR.NR_TABLE,
        TR.TABLE_DENUMIRE,
        TR.RIND_DENUMIRE,
        TR.ORDINE,
        TR.RIND,

        COUNT(DISTINCT CASE WHEN A.RIND = '1.8.1' AND NVAL(A.COL1)> 0
             AND ((ROUND(BS.PERS_IT) BETWEEN TR.PERS_INIT AND TR.PERS_FINAL) OR ROUND(BS.PERS_IT) IS NULL)
             AND (TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,2,2)||'%')
             THEN A.CUIIO END) AS COL_18_1,

        COUNT(DISTINCT CASE WHEN A.RIND = '1.8.2' AND NVAL(A.COL1)> 0
             AND ((ROUND(BS.PERS_IT) BETWEEN TR.PERS_INIT AND TR.PERS_FINAL) OR ROUND(BS.PERS_IT) IS NULL)
             AND (TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,2,2)||'%')
             THEN A.CUIIO END) AS COL_18_2,

        COUNT(DISTINCT CASE WHEN A.RIND = '1.8.3' AND NVAL(A.COL1)> 0
             AND ((ROUND(BS.PERS_IT) BETWEEN TR.PERS_INIT AND TR.PERS_FINAL) OR ROUND(BS.PERS_IT) IS NULL)
             AND (TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,2,2)||'%')
             THEN A.CUIIO END) AS COL_18_3,
             
             COUNT(DISTINCT CASE WHEN A.RIND LIKE '1.8%' AND NVAL(A.COL1)> 0
             AND ((ROUND(BS.PERS_IT) BETWEEN TR.PERS_INIT AND TR.PERS_FINAL) OR ROUND(BS.PERS_IT) IS NULL)
             AND (TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,2,2)||'%')
             THEN A.CUIIO END) AS COL_18_4

      FROM
      (
        SELECT
          D.ANUL,
          D.CUIIO,
          D.CUATM,
          D.CAEM2,
          D.CAPITOL,
          D.RIND,
          D.COL1 
        FROM CIS2.VW_DATA_ALL D
        WHERE
          D.PERIOADA IN (:pPERIOADA) AND
          D.FORM IN (:pFORM) AND 
          D.CAPITOL=1040 AND D.CAPITOL_VERS=2013 AND 
          D.RIND IN ('1.8.1','1.8.2','1.8.3') AND
          D.CAEM2 NOT LIKE 'A%'
      ) A
      LEFT JOIN CIS2.X_BAZA_SONDAJ BS ON (A.CUIIO=BS.CUIIO AND BS.ANUL=2025)
      INNER JOIN (
        SELECT CODUL, FULL_CODE 
        FROM CIS2.VW_CL_CAEM2
        WHERE SUBSTR(CODUL,1,1) IN ('B','C','D','E','H','J','K') 
           OR SUBSTR(CODUL,1,3) IN ('G46','M71','M72','M73')
      ) C ON C.CODUL = A.CAEM2
      CROSS JOIN 
      (
        SELECT 2 AS NR_TABLE, 'Clasa de marime' AS TABLE_DENUMIRE, 0 AS PERS_INIT, 999999 AS PERS_FINAL, NULL AS RIND, 'Total salariati' AS RIND_DENUMIRE, '1' AS ORDINE, 'B+C+D+E+H+J+K+G46+M71+M72+M73' AS RIND_C FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 0, 9,   NULL, '0-9 salariati',        '2',  'B+C+D+E+H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 10, 49, NULL, '10-49 salariati',       '3',  'B+C+D+E+H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 50, 249,NULL, '50-249 salariati',      '4',  'B+C+D+E+H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 250, 999999, NULL, '250 si peste salariati','5','B+C+D+E+H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 0, 999999, NULL, 'Industrie - total','6',  'B+C+D+E' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 0, 9,   NULL, '0-9 salariati',       '7',  'B+C+D+E' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 10, 49, NULL, '10-49 salariati',     '8',  'B+C+D+E' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 50, 249,NULL, '50-249 salariati',    '9',  'B+C+D+E' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 250, 999999, NULL, '250 si peste salariati', '10','B+C+D+E' FROM DUAL UNION 
        SELECT 2, 'Clasa de marime', 0, 999999, NULL, 'Servicii - total', '11','H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 0, 9,   NULL, '0-9 salariati',       '12','H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 10, 49, NULL, '10-49 salariati',     '13','H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 50, 249,NULL, '50-249 salariati',    '14','H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 250, 999999, NULL, '250 si peste salariati','15','H+J+K+G46+M71+M72+M73' FROM DUAL
      ) TR
      GROUP BY
        TR.NR_TABLE, TR.TABLE_DENUMIRE, TR.RIND_DENUMIRE, TR.ORDINE, TR.RIND
    ) B1

    UNION 

    /* =====================
       Bloc 2: CAEM2 (fara BS)
       ===================== */
    SELECT 
      NR_TABLE,
      TABLE_DENUMIRE,
      RIND_DENUMIRE,
      ORDINE,
      RIND,
      (COL_18_4) AS COL1,
      (COL_18_1 + COL_18_2 + COL_18_3) AS COL2,
      (COL_18_1 + COL_18_2 + COL_18_3) AS COL3,
      (COL_18_1 + COL_18_2 + COL_18_3) AS COL4, -- mapped to final COL1 (total)
      COL_18_1 AS COL5,                         -- mapped to final COL2 (1.8.1)
      COL_18_2 AS COL6,                         -- mapped to final COL3 (1.8.2)
      COL_18_3 AS COL7,                         -- kept (1.8.3)
      0 AS COL8
    FROM
    (
      SELECT 
        TR.NR_TABLE,
        TR.TABLE_DENUMIRE,
        TR.RIND_DENUMIRE,
        TR.ORDINE,
        TR.RIND,

        COUNT(DISTINCT CASE WHEN D.RIND = '1.8.1' AND NVAL(D.COL1)>=1
             AND (TR.RIND LIKE '%'||SUBSTR(D.CAEM2,1,1)||'%' OR TR.RIND LIKE '%'||SUBSTR(D.CAEM2,2,2)||'%')
             THEN D.CUIIO END) AS COL_18_1,

        COUNT(DISTINCT CASE WHEN D.RIND = '1.8.2' AND NVAL(D.COL1)>=1
             AND (TR.RIND LIKE '%'||SUBSTR(D.CAEM2,1,1)||'%' OR TR.RIND LIKE '%'||SUBSTR(D.CAEM2,2,2)||'%')
             THEN D.CUIIO END) AS COL_18_2,

        COUNT(DISTINCT CASE WHEN D.RIND = '1.8.3' AND NVAL(D.COL1)>=1
             AND (TR.RIND LIKE '%'||SUBSTR(D.CAEM2,1,1)||'%' OR TR.RIND LIKE '%'||SUBSTR(D.CAEM2,2,2)||'%')
             THEN D.CUIIO END) AS COL_18_3,
             
           COUNT(DISTINCT CASE WHEN D.RIND LIKE '1.8%' AND NVAL(D.COL1)>=1
             AND (TR.RIND LIKE '%'||SUBSTR(D.CAEM2,1,1)||'%' OR TR.RIND LIKE '%'||SUBSTR(D.CAEM2,2,2)||'%')
             THEN D.CUIIO END) AS COL_18_4
      FROM 
        CIS2.VW_DATA_ALL D 
        INNER JOIN (
          SELECT CODUL, FULL_CODE 
          FROM CIS2.VW_CL_CAEM2
          WHERE SUBSTR(CODUL,1,1) IN ('B','C','D','E','H','J','K')
             OR SUBSTR(CODUL,1,3) IN ('G46','M71','M72','M73')
        ) C ON C.CODUL = D.CAEM2
        CROSS JOIN 
        (
          SELECT 1 AS NR_TABLE, 'CAEM2' AS TABLE_DENUMIRE, NULL AS PERS_INIT, NULL AS PERS_FINAL, 'B+C+D+E+G+H+J+K+M' AS RIND, 'Total' AS RIND_DENUMIRE, '1' AS ORDINE FROM DUAL UNION 
          SELECT 1, 'CAEM2', NULL, NULL, 'B+C+D+E', 'Industrie - total', '2' FROM DUAL  UNION
          SELECT 1, 'CAEM2', NULL, NULL, 'B', 'Industrie extractiva', '3' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, 'C', 'Industrie prelucratoare', '4' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, 'D', 'Productia si furnizarea de energie electrica si termica, gaze, apa calda si aer conditionat', '5' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, 'E', 'Distributia apei; salubritate, gestionarea deseurilor, activitati de decontaminare', '6' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, 'H+J+K+G+M', 'Servicii - total ', '7' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, 'G', 'Comert cu ridicata ', '8' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, 'H', 'Transport si depozitare ', '9' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, 'J', 'Informatii si comunicatii', '10' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, 'K', 'Activitati  financiare si asigurari', '11' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, '71', 'Activitati de arhitectura si inginerie', '12' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, '72', 'Activitati de cercetare dezvoltare', '13' FROM DUAL UNION  
          SELECT 1, 'CAEM2', NULL, NULL, '73', 'Publicitate si activitati de studiere a pietei', '14' FROM DUAL   
        ) TR
      WHERE
        D.PERIOADA IN (:pPERIOADA) AND
        D.FORM IN (:pFORM) AND 
        D.RIND IN ('1.8.1','1.8.2','1.8.3') AND
        D.CAEM2 NOT LIKE 'A%'
      GROUP BY
        TR.NR_TABLE, TR.TABLE_DENUMIRE, TR.RIND_DENUMIRE, TR.ORDINE, TR.RIND
    ) B2

    UNION 

    /* =====================
       Bloc 3: Regiuni de dezvoltare (agregare)
       ===================== */
    SELECT 
      3 AS NR_TABLE, 
      ' Regiuni de dezvoltare' AS TABLE_DENUMIRE,
      NUME_ROW AS RIND_DENUMIRE,
      NR_ROW   AS ORDINE,
      CS_CUATM AS RIND,

      /* Internal COL1..COL6; outside maps COL4..COL6 */
       SUM(COL4) AS COL1,
      (SUM(COL1) + SUM(COL2) + SUM(COL3)) AS COL2,
      (SUM(COL1) + SUM(COL2) + SUM(COL3)) AS COL3,
      (SUM(COL1) + SUM(COL2) + SUM(COL3)) AS COL4, -- final COL1 (total)
      SUM(COL1) AS COL5,                           -- final COL2 (1.8.1)
      SUM(COL2) AS COL6,                           -- final COL3 (1.8.2)
      SUM(COL3) AS COL7,                           -- kept (1.8.3)
      0 AS COL8
    FROM
    (
      SELECT
        CC.NR_ROW,
        CC.CS_CUATM,
        CC.NUME_ROW,
        CC.ORDINE,

        COUNT(DISTINCT CASE WHEN D.RIND = '1.8.1' AND C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%' AND NVAL(D.COL1)>=1
             AND (CC.RIND LIKE '%'||SUBSTR(D.CAEM2,1,1)||'%' OR CC.RIND LIKE '%'||SUBSTR(D.CAEM2,2,2)||'%')
             THEN D.CUIIO END) AS COL1,

        COUNT(DISTINCT CASE WHEN D.RIND = '1.8.2' AND C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%' AND NVAL(D.COL1)>=1
             AND (CC.RIND LIKE '%'||SUBSTR(D.CAEM2,1,1)||'%' OR CC.RIND LIKE '%'||SUBSTR(D.CAEM2,2,2)||'%')
             THEN D.CUIIO END) AS COL2,

        COUNT(DISTINCT CASE WHEN D.RIND = '1.8.3' AND C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%' AND NVAL(D.COL1)>=1
             AND (CC.RIND LIKE '%'||SUBSTR(D.CAEM2,1,1)||'%' OR CC.RIND LIKE '%'||SUBSTR(D.CAEM2,2,2)||'%')
             THEN D.CUIIO END) AS COL3,
             
           

 COUNT(DISTINCT CASE WHEN D.RIND LIKE  '1.8%' AND C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%' AND NVAL(D.COL1)>=1
             AND (CC.RIND LIKE '%'||SUBSTR(D.CAEM2,1,1)||'%' OR CC.RIND LIKE '%'||SUBSTR(D.CAEM2,2,2)||'%')
             THEN D.CUIIO END) AS COL4

      FROM 
        CIS2.VW_DATA_ALL D
        INNER JOIN CIS2.VW_CL_CUATM  C ON C.CODUL = D.CUATM
        CROSS JOIN (
          SELECT '01' AS NR_ROW, 'TOTAL'  AS NUME_ROW, '0000000'  AS CS_CUATM, 'B+C+D+E+H+J+K+G46+M71+M72+M73' AS RIND, 'Total' AS RIND_DENUMIRE, '1'  AS ORDINE FROM  DUAL UNION  
          SELECT '02' AS NR_ROW, 'MUN.CHISINAU'  AS NUME_ROW, '0100000'  AS CS_CUATM, 'B+C+D+E+H+J+K+G46+M71+M72+M73' AS RIND, 'Total' AS RIND_DENUMIRE, '2'  FROM  DUAL UNION
          SELECT '03' AS NR_ROW, 'NORD'  AS NUME_ROW, '1111111'  AS CS_CUATM, 'B+C+D+E+H+J+K+G46+M71+M72+M73' AS RIND, 'Total' AS RIND_DENUMIRE, '3'  FROM  DUAL UNION 
          SELECT '04' AS NR_ROW, 'CENTRU'  AS NUME_ROW, '2222222'  AS CS_CUATM, 'B+C+D+E+H+J+K+G46+M71+M72+M73' AS RIND, 'Total' AS RIND_DENUMIRE, '4'  FROM  DUAL UNION
          SELECT '05' AS NR_ROW, 'SUD'  AS NUME_ROW, '3333333'  AS CS_CUATM, 'B+C+D+E+H+J+K+G46+M71+M72+M73' AS RIND, 'Total' AS RIND_DENUMIRE, '5'  FROM  DUAL UNION
          SELECT '06' AS NR_ROW, 'UTA GAGAUZIA'  AS NUME_ROW, '9800000'  AS CS_CUATM, 'B+C+D+E+H+J+K+G46+M71+M72+M73' AS RIND, 'Total' AS RIND_DENUMIRE, '6'  FROM   DUAL 
        ) CC
      WHERE
        D.PERIOADA IN (:pPERIOADA) AND
        D.FORM     IN (:pFORM) AND 
        D.CAPITOL = 1040 AND D.CAPITOL_VERS = 2013 AND 
        D.RIND IN ('1.8.1','1.8.2','1.8.3') AND
        D.CAEM2 NOT LIKE 'A%'
      GROUP BY
        CC.NR_ROW, CC.NUME_ROW, CC.ORDINE, CC.CS_CUATM
    )
    GROUP BY 
      NR_ROW,
      ORDINE,
      NUME_ROW,
      CS_CUATM

  ) A
  ORDER BY
    TO_NUMBER(A.NR_TABLE),
    TO_NUMBER(A.ORDINE)
)
