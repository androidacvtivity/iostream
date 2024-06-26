--DECLARE
--
--  CURSOR C IS
  SELECT
--    :pPERIOADA AS PERIOADA,
--    :pFORM AS FORM,
--    :pFORM_VERS AS FORM_VERS,
--    :pID_MDTABLE AS ID_MDTABLE,
--    :pCOD_CUATM AS COD_CUATM,
--    
--    '0' AS NR_SECTIE,
--    '0' AS NUME_SECTIE,
--    '0' AS NR_SECTIE1,
--    '0' AS NUME_SECTIE1,
--    '0' AS NR_SECTIE2,
--    '0' AS NUME_SECTIE2,
     NR_ROW AS NR_ROW,
     ORDINE AS ORDINE,
    '011111111110' AS DECIMAL_POS,
     NUME_ROW AS NUME_ROW,
     ROUND(COL1,0) AS COL1,
     ROUND(COL2,1) AS COL2,
     ROUND(COL3,1) AS COL3,
     ROUND(COL4,1) AS COL4,
     ROUND(COL5,1) AS COL5,
     ROUND(COL6,1) AS COL6,
     ROUND(COL7,1) AS COL7,
     ROUND(COL8,1) AS COL8,
     ROUND(COL9,1) AS COL9,
     ROUND(COL10,1) AS COL10, 
     ROUND(COL11,1) AS COL11, 
     ROUND(COL12,0) AS COL12

  FROM
  (SELECT
    CASE WHEN A.CAEM2 LIKE '0%' THEN '0000' 
         WHEN A.CAEM2 LIKE 'A00%' THEN 'A'
         WHEN A.CAEM2 LIKE 'B00%' OR A.CAEM2 LIKE 'C00%' OR A.CAEM2 LIKE 'D00%' OR A.CAEM2 LIKE 'E00%' OR A.CAEM2 LIKE 'F00%'  THEN 'B+C+D+E+F'
         WHEN A.CAEM2 LIKE 'O00%' THEN 'O'
         WHEN A.CAEM2 LIKE 'P00%' THEN 'P'
         WHEN A.CAEM2 LIKE 'G00%' OR A.CAEM2 LIKE 'H00%' OR A.CAEM2 LIKE 'I00%' OR A.CAEM2 LIKE 'J00%' OR A.CAEM2 LIKE 'K00%' OR A.CAEM2 LIKE 'L00%' OR 
              A.CAEM2 LIKE 'M00%' OR A.CAEM2 LIKE 'N00%' OR A.CAEM2 LIKE 'Q00%' OR A.CAEM2 LIKE 'R00%' OR A.CAEM2 LIKE 'S00%' THEN 'G+H+I+J+K+L+M+N+Q+R+S'
    END AS NR_ROW,
    CASE WHEN A.CAEM2 LIKE '0%' THEN 'TOTAL'
      WHEN A.CAEM2 LIKE 'A00%' THEN 'Agricultura, sivicultura si pescuit'
      WHEN A.CAEM2 LIKE 'B00%' OR A.CAEM2 LIKE 'C00%' OR A.CAEM2 LIKE 'D00%' OR A.CAEM2 LIKE 'E00%' OR A.CAEM2 LIKE 'F00%' THEN 'Industrie si constructii'
      WHEN A.CAEM2 LIKE 'O00%' THEN 'Administratia publica si aparare; asigurari sociale obligatorii'
      WHEN A.CAEM2 LIKE 'P00%' THEN 'Invatamint'
      WHEN A.CAEM2 LIKE 'G00%' OR A.CAEM2 LIKE 'H00%' OR A.CAEM2 LIKE 'I00%' OR A.CAEM2 LIKE 'J00%' OR A.CAEM2 LIKE 'K00%' OR A.CAEM2 LIKE 'L00%' OR 
           A.CAEM2 LIKE 'M00%' OR A.CAEM2 LIKE 'N00%' OR A.CAEM2 LIKE 'Q00%' OR A.CAEM2 LIKE 'R00%' OR A.CAEM2 LIKE 'S00%' THEN 'Alte activitati'
    END AS NUME_ROW,
    CASE WHEN A.CAEM2 LIKE '0%' THEN 1
      WHEN A.CAEM2 LIKE 'A00%' THEN 2
      WHEN A.CAEM2 LIKE 'B00%' OR A.CAEM2 LIKE 'C00%' OR A.CAEM2 LIKE 'D00%' OR A.CAEM2 LIKE 'E00%' OR A.CAEM2 LIKE 'F00%' THEN 3
      WHEN A.CAEM2 LIKE 'O00%' THEN 4
      WHEN A.CAEM2 LIKE 'P00%' THEN 5
      WHEN A.CAEM2 LIKE 'G00%' OR A.CAEM2 LIKE 'H00%' OR A.CAEM2 LIKE 'I00%' OR A.CAEM2 LIKE 'J00%' OR A.CAEM2 LIKE 'K00%' OR A.CAEM2 LIKE 'L00%' OR 
           A.CAEM2 LIKE 'M00%' OR A.CAEM2 LIKE 'N00%' OR A.CAEM2 LIKE 'Q00%' OR A.CAEM2 LIKE 'R00%' OR A.CAEM2 LIKE 'S00%' THEN 6
    END AS ORDINE,
  --  NR_ROW,
  --  NUME_ROW,
    SUM(A.COL1) AS COL1,
    SUM(A.COL2) AS COL2,
    SUM(A.COL3) AS COL3,
    SUM(A.COL4) AS COL4,
    SUM(A.COL5) AS COL5,
    SUM(A.COL6) AS COL6,
    SUM(A.COL7) AS COL7,
    SUM(A.COL8) AS COL8,
    SUM(A.COL9) AS COL9,
    SUM(A.COL10) AS COL10,
    SUM(A.COL11) AS COL11,
    SUM(A.COL12) AS COL12
  FROM
  (
  SELECT
      SUBSTR(D.CAEM2,0,3) AS CAEM2,
      D.DENUMIRE,
      D.FULL_CODE,    
      SUM(D.COL1) AS COL1,
      SUM(D.COL2) AS COL2,
      SUM(D.COL3) AS COL3,
      SUM(D.COL4) AS COL4,
      SUM(D.COL5) AS COL5,
      SUM(D.COL6) AS COL6,
      SUM(D.COL7) AS COL7,
      SUM(D.COL8) AS COL8,
      SUM(D.COL9) AS COL9,
      SUM(D.COL10) AS COL10,
      SUM(D.COL11) AS COL11,
      SUM(D.COL12) AS COL12
  FROM
  (

  (
  SELECT 
    CR.CODUL AS CAEM2,
    CR.DENUMIRE,
    CR.FULL_CODE,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=1 THEN VAL ELSE NULL END)) AS COL1,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=3 THEN VAL ELSE NULL END)+
          NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=5 THEN VAL ELSE NULL END)) AS COL2,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=3 THEN VAL ELSE NULL END)) AS COL3,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=4 THEN VAL ELSE NULL END)) AS COL4,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=5 THEN VAL ELSE NULL END)) AS COL5,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=6 THEN VAL ELSE NULL END)+
          NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=7 THEN VAL ELSE NULL END)) AS COL6,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=6 THEN VAL ELSE NULL END)) AS COL7,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=7 THEN VAL ELSE NULL END)) AS COL8,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=8 THEN VAL ELSE NULL END)+
          NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=9 THEN VAL ELSE NULL END)) AS COL9,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=8 THEN VAL ELSE NULL END)) AS COL10,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=9 THEN VAL ELSE NULL END)) AS COL11,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=10 THEN VAL ELSE NULL END)) AS COL12

  FROM
  (
  -------------------------------------------------------------------------------
  SELECT
      DISTINCT A.CUIIO,
      A.FILIAL,
      A.CAPITOL,
      A.CAPITOL_DEN,
      A.CUATM,
      A.CUATM_FULL,
      A.COL,
      A.RIND,
      A.CAEM2,
      CASE WHEN A.ANCHETA_A='1' AND A.ANCHETA_B='0' THEN A.VAL ELSE NULL END AS VAL
  FROM
  (SELECT DISTINCT
    D.CUIIO,
    D.FILIAL,
    D.CAPITOL,
    D.CAPITOL_DEN,
    D.PERIOADA,
    D.CUATM,
    D.CUATM_FULL,
    C.COL-1 AS COL,
    MAX(CASE WHEN D.FILIAL='0' THEN 1 ELSE 0 END) AS ANCHETA_A,
    MAX(CASE WHEN D.FILIAL='0' THEN 0 ELSE 1 END) AS ANCHETA_B,
    CASE WHEN D.RIND LIKE '%T' AND S.SEX LIKE 'F' THEN SUBSTR(D.RIND,1,3)||'F' ELSE D.RIND END AS RIND, 
    MAX(CASE WHEN D.RIND LIKE '00%' THEN 0 WHEN D.RIND LIKE '01%' THEN TO_NUMBER(SUBSTR(D.CAEM2,2,5)) ELSE D.COL1 END) AS CAEM2,
    SUM(CASE WHEN D.RIND LIKE '%'||S.SEX THEN DECODE(C.COL, 1,D.COL1, 2,D.COL2, 3,D.COL3, 4,D.COL4, 5,D.COL5, 6,D.COL6, 7,D.COL7, 8,D.COL8, 9,D.COL9, 10,D.COL10, 11,D.COL11, 12,D.COL12, NULL) ELSE NULL END) AS VAL
  FROM 
    VW_DATA_ALL_COEF D,
    (
      SELECT  2 AS COL FROM DUAL UNION
      SELECT  3 AS COL FROM DUAL UNION
      SELECT  4 AS COL FROM DUAL UNION
      SELECT  5 AS COL FROM DUAL UNION
      SELECT  6 AS COL FROM DUAL UNION
      SELECT  7 AS COL FROM DUAL UNION
      SELECT  8 AS COL FROM DUAL UNION
      SELECT  9 AS COL FROM DUAL UNION
      SELECT 10 AS COL FROM DUAL UNION
      SELECT 11 AS COL FROM DUAL UNION
      SELECT 12 AS COL FROM DUAL
    ) C,
    (
      SELECT 'T' AS SEX FROM DUAL UNION
      SELECT 'F' AS SEX FROM DUAL
    ) S
  WHERE
    (D.PERIOADA=:pPERIOADA) AND
    (:pFORM_VERS=:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND
    (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
    D.FORM = 3 AND
    D.CAPITOL IN(301) 
  GROUP BY
    D.CUIIO,
    D.FILIAL,
    D.CAPITOL,
    D.CAPITOL_DEN,
    D.PERIOADA,
    D.CUATM,
    D.CUATM_FULL,
    C.COL,
    CASE WHEN D.RIND LIKE '%T' AND S.SEX LIKE 'F' THEN SUBSTR(D.RIND,1,3)||'F' ELSE D.RIND END
    ) A
    INNER JOIN
    (
    SELECT
      D.PERIOADA,
      D.CUIIO AS CUIIO_1,
      MAX(CASE WHEN D.FILIAL='0' THEN 1 ELSE 0 END) AS ANCHETA_A,
      MAX(CASE WHEN D.FILIAL='0' THEN 0 ELSE 1 END) AS ANCHETA_B
  FROM 
      VW_DATA_ALL_COEF D
  WHERE
    (D.PERIOADA=:pPERIOADA) AND
    (:pFORM_VERS=:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND
    D.FORM = 3 AND
    D.CAPITOL IN(301)
  GROUP BY
      D.PERIOADA,
      D.CUIIO
      ) B ON (A.CUIIO=B.CUIIO_1)
  WHERE
    A.CAEM2<>'0' AND (A.RIND LIKE '%T') AND (A.CUATM<>'0501000' OR A.CUATM<>'0510000') AND B.ANCHETA_B='0'
  -------------------------------------------------------------------------------
  ) D 
    INNER JOIN VW_CL_CAEM2 C  ON(D.CAEM2=C.NUM_CODE)
    INNER JOIN VW_CL_CAEM2 CR ON(C.FULL_CODE LIKE '%'||CR.CODUL||';%')
  WHERE 
    (LENGTH(CR.FULL_CODE)<=16 OR (CR.FULL_CODE NOT LIKE '%0100000;%' AND CR.FULL_CODE NOT LIKE '%9600000;%' AND LENGTH(CR.FULL_CODE)<=24)) --AND D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
  GROUP BY
    CR.DENUMIRE,
    CR.FULL_CODE,
    CR.CODUL
  )
  UNION ALL
  (
  SELECT 
    CR.CODUL AS CAEM2,
    CR.DENUMIRE,
    CR.FULL_CODE,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=1 THEN VAL ELSE NULL END)) AS COL1,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=3 THEN VAL ELSE NULL END)+
          NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=5 THEN VAL ELSE NULL END)) AS COL2,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=3 THEN VAL ELSE NULL END)) AS COL3,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=4 THEN VAL ELSE NULL END)) AS COL4,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=5 THEN VAL ELSE NULL END)) AS COL5,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=6 THEN VAL ELSE NULL END)+
          NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=7 THEN VAL ELSE NULL END)) AS COL6,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=6 THEN VAL ELSE NULL END)) AS COL7,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=7 THEN VAL ELSE NULL END)) AS COL8,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=8 THEN VAL ELSE NULL END)+
          NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=9 THEN VAL ELSE NULL END)) AS COL9,
      
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=8 THEN VAL ELSE NULL END)) AS COL10,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=9 THEN VAL ELSE NULL END)) AS COL11,
      SUM(NVAL(CASE WHEN D.CAPITOL IN (301) AND COL=10 THEN VAL ELSE NULL END)) AS COL12

  FROM
  (
  SELECT
      DISTINCT A.CUIIO,
      A.FILIAL,
      A.CAPITOL,
      A.CAPITOL_DEN,
      A.CUATM,
      A.CUATM_FULL,
      A.COL,
      A.RIND,
      A.CAEM2,
      CASE WHEN A.ANCHETA_A='0' AND A.ANCHETA_B='1' THEN A.VAL ELSE NULL END AS VAL
  FROM
  (-------------------------------------------------------------------------------
  SELECT DISTINCT
    D.CUIIO,
    D.FILIAL,
    CA.FULL_CODE AS FILIAL_FULL,
    D.CAPITOL,
    D.CAPITOL_DEN,
    D.PERIOADA,
    D.CUATM,
    D.CUATM_FULL,
    C.COL-1 AS COL,
    MAX(CASE WHEN D.FILIAL='0' THEN 1 ELSE 0 END) AS ANCHETA_A,
    MAX(CASE WHEN D.FILIAL='0' THEN 0 ELSE 1 END) AS ANCHETA_B,
    CASE WHEN D.RIND LIKE '%T' AND S.SEX LIKE 'F' THEN SUBSTR(D.RIND,1,3)||'F' ELSE D.RIND END AS RIND, 
    MAX(CASE WHEN D.RIND LIKE '00%' THEN 0 WHEN D.RIND LIKE '01%' THEN TO_NUMBER(SUBSTR(D.CAEM2,2,5)) ELSE D.COL1 END) AS CAEM2,
    SUM(CASE WHEN D.RIND LIKE '%'||S.SEX THEN DECODE(C.COL, 1,D.COL1, 2,D.COL2, 3,D.COL3, 4,D.COL4, 5,D.COL5, 6,D.COL6, 7,D.COL7, 8,D.COL8, 9,D.COL9, 10,D.COL10, 11,D.COL11,12,D.COL12, NULL) ELSE NULL END) AS VAL
  FROM 
    VW_DATA_ALL_COEF D
    LEFT JOIN VW_CL_CUATM CA ON (D.FILIAL=CA.CODUL),
    (
      SELECT  2 AS COL FROM DUAL UNION
      SELECT  3 AS COL FROM DUAL UNION
      SELECT  4 AS COL FROM DUAL UNION
      SELECT  5 AS COL FROM DUAL UNION
      SELECT  6 AS COL FROM DUAL UNION
      SELECT  7 AS COL FROM DUAL UNION
      SELECT  8 AS COL FROM DUAL UNION
      SELECT  9 AS COL FROM DUAL UNION
      SELECT 10 AS COL FROM DUAL UNION
      SELECT 11 AS COL FROM DUAL UNION
      SELECT 12 AS COL FROM DUAL
    ) C,
    (
      SELECT 'T' AS SEX FROM DUAL UNION
      SELECT 'F' AS SEX FROM DUAL
    ) S
  WHERE
    (D.PERIOADA=:pPERIOADA) AND
    (:pFORM_VERS=:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND
    (CA.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND 
  --  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
    D.FORM = 3 AND
    D.CAPITOL IN(301) 
  GROUP BY
    D.CUIIO,
    D.FILIAL,
    CA.FULL_CODE,
    D.CAPITOL,
    D.CAPITOL_DEN,
    D.PERIOADA,
    D.CUATM,
    D.CUATM_FULL,
    C.COL,
    CASE WHEN D.RIND LIKE '%T' AND S.SEX LIKE 'F' THEN SUBSTR(D.RIND,1,3)||'F' ELSE D.RIND END
  -------------------------------------------------------------------------------
  ) A
  INNER JOIN
    (
    SELECT
      D.PERIOADA,
      D.CUIIO,
      MAX(CASE WHEN D.FILIAL='0' THEN 1 ELSE 0 END) AS ANCHETA_A,
      MAX(CASE WHEN D.FILIAL='0' THEN 0 ELSE 1 END) AS ANCHETA_B
  FROM 
      VW_DATA_ALL_COEF D
  WHERE
    (D.PERIOADA=:pPERIOADA) AND
    (:pFORM_VERS=:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND
    D.FORM = 3 AND
    D.CAPITOL IN(301)
  GROUP BY
      D.PERIOADA,
      D.CUIIO
      ) B ON (A.CUIIO=B.CUIIO)
    WHERE
    A.CAEM2<>'0' AND (A.RIND LIKE '%T') AND (A.CUATM<>'0501000' OR A.CUATM<>'0510000') AND B.ANCHETA_B='1'
  ) D 
    INNER JOIN VW_CL_CAEM2 C  ON(D.CAEM2=C.NUM_CODE)
    INNER JOIN VW_CL_CAEM2 CR ON(C.FULL_CODE LIKE '%'||CR.CODUL||';%')
  WHERE 
    (LENGTH(CR.FULL_CODE)<=16 OR (CR.FULL_CODE NOT LIKE '%0100000;%' AND CR.FULL_CODE NOT LIKE '%9600000;%' AND LENGTH(CR.FULL_CODE)<=24))-- AND D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
  GROUP BY
    CR.DENUMIRE,
    CR.FULL_CODE,
    CR.CODUL
  )
  )D
  GROUP BY
      D.CAEM2,
      D.DENUMIRE,
      D.FULL_CODE
  ) A
  GROUP BY 
    CASE WHEN A.CAEM2 LIKE '0%' THEN '0000'
         WHEN A.CAEM2 LIKE 'A00%' THEN 'A'
         WHEN A.CAEM2 LIKE 'B00%' OR A.CAEM2 LIKE 'C00%' OR A.CAEM2 LIKE 'D00%' OR A.CAEM2 LIKE 'E00%' OR A.CAEM2 LIKE 'F00%' THEN 'B+C+D+E+F'
         WHEN A.CAEM2 LIKE 'O00%' THEN 'O'
         WHEN A.CAEM2 LIKE 'P00%' THEN 'P'
         WHEN A.CAEM2 LIKE 'G00%' OR A.CAEM2 LIKE 'H00%' OR A.CAEM2 LIKE 'I00%' OR A.CAEM2 LIKE 'J00%' OR A.CAEM2 LIKE 'K00%' OR A.CAEM2 LIKE 'L00%' OR 
              A.CAEM2 LIKE 'M00%' OR A.CAEM2 LIKE 'N00%' OR A.CAEM2 LIKE 'Q00%' OR A.CAEM2 LIKE 'R00%' OR A.CAEM2 LIKE 'S00%' THEN 'G+H+I+J+K+L+M+N+Q+R+S'
    END,
    CASE WHEN A.CAEM2 LIKE '0%' THEN 'TOTAL'
      WHEN A.CAEM2 LIKE 'A00%' THEN 'Agricultura, sivicultura si pescuit'
      WHEN A.CAEM2 LIKE 'B00%' OR A.CAEM2 LIKE 'C00%' OR A.CAEM2 LIKE 'D00%' OR A.CAEM2 LIKE 'E00%' OR A.CAEM2 LIKE 'F00%' THEN 'Industrie si constructii'
      WHEN A.CAEM2 LIKE 'O00%' THEN 'Administratia publica si aparare; asigurari sociale obligatorii'
      WHEN A.CAEM2 LIKE 'P00%' THEN 'Invatamint'
      WHEN A.CAEM2 LIKE 'G00%' OR A.CAEM2 LIKE 'H00%' OR A.CAEM2 LIKE 'I00%' OR A.CAEM2 LIKE 'J00%' OR A.CAEM2 LIKE 'K00%' OR A.CAEM2 LIKE 'L00%' OR 
           A.CAEM2 LIKE 'M00%' OR A.CAEM2 LIKE 'N00%' OR A.CAEM2 LIKE 'Q00%' OR A.CAEM2 LIKE 'R00%' OR A.CAEM2 LIKE 'S00%' THEN 'Alte activitati'
    END,
    CASE WHEN A.CAEM2 LIKE '0%' THEN 1
      WHEN A.CAEM2 LIKE 'A00%' THEN 2
      WHEN A.CAEM2 LIKE 'B00%' OR A.CAEM2 LIKE 'C00%' OR A.CAEM2 LIKE 'D00%' OR A.CAEM2 LIKE 'E00%' OR A.CAEM2 LIKE 'F00%' THEN 3
      WHEN A.CAEM2 LIKE 'O00%' THEN 4
      WHEN A.CAEM2 LIKE 'P00%' THEN 5
      WHEN A.CAEM2 LIKE 'G00%' OR A.CAEM2 LIKE 'H00%' OR A.CAEM2 LIKE 'I00%' OR A.CAEM2 LIKE 'J00%' OR A.CAEM2 LIKE 'K00%' OR A.CAEM2 LIKE 'L00%' OR 
           A.CAEM2 LIKE 'M00%' OR A.CAEM2 LIKE 'N00%' OR A.CAEM2 LIKE 'Q00%' OR A.CAEM2 LIKE 'R00%' OR A.CAEM2 LIKE 'S00%' THEN 6
    END
    )
  WHERE
    NR_ROW IS NOT NULL
--  ;
--BEGIN
--
--  FOR CR IN C
--  LOOP
--    INSERT INTO TABLE_OUT
--    (
--      PERIOADA,
--      FORM,
--      FORM_VERS,
--      ID_MDTABLE,
--      COD_CUATM,
--      NR_SECTIE,
--      NUME_SECTIE,
--      NR_SECTIE1,
--      NUME_SECTIE1,
--      NR_SECTIE2,
--      NUME_SECTIE2,
--      NR_ROW,
--      ORDINE,
--      DECIMAL_POS,
--      NUME_ROW,
--       
--      COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12
--    )
--    VALUES
--    (
--      CR.PERIOADA,
--      CR.FORM,
--      CR.FORM_VERS,
--      CR.ID_MDTABLE,
--      CR.COD_CUATM,
--      CR.NR_SECTIE,
--      CR.NUME_SECTIE,
--      CR.NR_SECTIE1,
--      CR.NUME_SECTIE1,
--      CR.NR_SECTIE2,
--      CR.NUME_SECTIE2,
--      CR.NR_ROW,
--      CR.ORDINE,
--      CR.DECIMAL_POS,
--      CR.NUME_ROW,
--       
--      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8, CR.COL9, CR.COL10, CR.COL11, CR.COL12
--    );
--  END LOOP;
--END;