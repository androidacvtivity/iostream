--INSERT INTO TABLE_OUT 
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
--  
--  COL1,  COL2,  COL3,  COL4,  COL5,
--  COL6,  COL7,  COL8,  COL9,  COL10,
--  COL11, COL12, COL13, COL14, COL15
--)

-- FINAL SELECT ===============================================================
SELECT
  DF.PERIOADA,
  DF.FORM,
  DF.FORM_VERS,
  DF.ID_MDTABLE,
  DF.COD_CUATM,
  DF.NR_SECTIE,
  DF.NUME_SECTIE,
  DF.NR_SECTIE1,
  DF.NUME_SECTIE1,
  DF.NR_SECTIE2,
  DF.NUME_SECTIE2,
  DF.NR_ROW,
  DF.ORDINE,
  DF.DECIMAL_POS,
  DF.NUME_ROW,
  
  DF.COL1  AS COL1,  
  DF.COL2  AS COL2,
  DF.COL3  AS COL3,
  DF.COL4   AS COL4,
  DF.COL5   AS COL5,
  DF.COL6   AS COL6,
  DF.COL7   AS COL7,
  DF.COL8   AS COL8,
  DF.COL9   AS COL9,
  DF.COL10  AS COL10,
  DF.COL11  AS COL11,
  DF.COL12  AS COL12,
  DF.COL13  AS COL13,
  DF.COL14  AS COL14,
  DF.COL15  AS COL15
  
FROM
(
-- PRIMARY SELECT .............................................................
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
  C.CODUL AS NR_ROW,
  0 AS ORDINE,
  '000000000000011' AS DECIMAL_POS,
  C.DENUMIRE AS NUME_ROW,
  
  ROUND(SUM(CASE WHEN D.RIND IN('10') THEN NVAL(COL)  ELSE NULL END),0) AS COL1,
  ROUND(SUM(CASE WHEN D.RIND IN('20') THEN NVAL(COL)  ELSE NULL END),0) AS COL2,
  ROUND(SUM(CASE WHEN D.RIND IN('30') THEN NVAL(COL)  ELSE NULL END),0) AS COL3,
  ROUND(SUM(CASE WHEN D.RIND IN('40') THEN NVAL(COL)  ELSE NULL END),0) AS COL4,
  ROUND(SUM(CASE WHEN D.RIND IN('50') THEN NVAL(COL)  ELSE NULL END),0) AS COL5,
  ROUND(SUM(CASE WHEN D.RIND IN('60') THEN NVAL(COL)  ELSE NULL END),0) AS COL6,
  ROUND(SUM(CASE WHEN D.RIND IN('70') THEN NVAL(COL)  ELSE NULL END),0) AS COL7,
  ROUND(SUM(CASE WHEN D.RIND IN('80') THEN NVAL(COL)  ELSE NULL END),0) AS COL8,
  ROUND(SUM(CASE WHEN D.RIND IN('90') THEN NVAL(COL)  ELSE NULL END),0) AS COL9,
  ROUND(SUM(CASE WHEN D.RIND IN('100') THEN NVAL(COL) ELSE NULL END),0) AS COL10,
  ROUND(SUM(CASE WHEN D.RIND IN('110') THEN NVAL(COL) ELSE NULL END),0) AS COL11,
  ROUND(SUM(CASE WHEN D.RIND IN('120') THEN NVAL(COL) ELSE NULL END),0) AS COL12,
  ROUND(SUM(CASE WHEN D.RIND IN('130') THEN NVAL(COL) ELSE NULL END),0) AS COL13,
  
  
  ROUND(SUM(CASE WHEN D.RIND IN('160') THEN NVAL(COL) ELSE NULL END),1) AS COL14,                --
  
  ROUND((
  ROUND(SUM(CASE WHEN D.RIND IN('160') THEN CIS.NVAL(COL) ELSE NULL END),1)  /
  ROUND(CIS.NOZERO(CIS.NVAL(SUM(CASE WHEN D.RIND IN('10') THEN CIS.NVAL(COL)  ELSE NULL END))),0)) * 1000,1) AS COL15

FROM
  VW_CL_CAEM2 C
  INNER JOIN VW_CL_CAEM2 CD ON(CD.FULL_CODE LIKE '%'||C.CODUL||';%')
  INNER JOIN 
  (
  
    
 SELECT
      DECODE(CL.COL,
        1,  TO_NUMBER(SUBSTR(D.CAEM2,2,5)),
        2,  TO_NUMBER(SUBSTR(D.CAEM2,2,5)),
        3,  C.COL3,
        4,  C.COL4,
        5,  C.COL5,
        6,  C.COL6,
        7,  C.COL7,
        8,  C.COL8,
        9,  C.COL9,
        10, C.COL10,
        11, C.COL11,
        12, C.COL12
        ) AS CAEM2,
      D.RIND,
      SUM(DECODE(CL.COL,
        1,  CASE WHEN D.COL2 IS NULL AND D.COL3 IS NULL AND D.COL4 IS NULL AND D.COL5 IS NULL AND D.COL6 IS NULL AND D.COL7 IS NULL AND D.COL8 IS NULL AND D.COL9 IS NULL AND D.COL10 IS NULL AND D.COL11 IS NULL AND D.COL12 IS NULL THEN D.COL1 ELSE NULL END,
        2,  D.COL2,
        3,  D.COL3,
        4,  D.COL4,
        5,  D.COL5,
        6,  D.COL6,
        7,  D.COL7,
        8,  D.COL8,
        9,  D.COL9,
        10, D.COL10,
        11, D.COL11,
        12, D.COL12
        )) AS COL
       -- DD.NUM_PERS
    FROM
      VW_DATA_ALL D --INNER JOIN  VW_DATA_ALL_CALC DD ON (D.CUIIO=DD.CUIIO AND D.PERIOADA=DD.PERIOADA  AND DD.FORM||'.'||DD.CAPITOL||'.'||DD.RIND IN ('5.27.30')) 
      LEFT JOIN
      VW_DATA_ALL C ON(D.PERIOADA=C.PERIOADA AND D.CUIIO=C.CUIIO AND D.CUIIO_VERS=C.CUIIO_VERS AND D.FORM=C.FORM AND D.CAPITOL=C.CAPITOL AND C.RIND='CAEM'),
      MD_COLOANA CL 
      
    WHERE D.PERIOADA   = :pPERIOADA
      AND D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
      AND D.FORM       IN(7)
    -- and d.cuiio = 9202
      AND D.CAPITOL    IN(40)
      AND D.RIND       NOT IN('CAEM')
--      AND DD.FORM||'.'||DD.CAPITOL||'.'||DD.RIND IN ('5.27.30')     
      AND CL.COL       <= 12 
      
   --   AND D.CUIIO = 40521542
--   
    GROUP BY
      DECODE(CL.COL,
        1,  TO_NUMBER(SUBSTR(D.CAEM2,2,5)),
        2,  TO_NUMBER(SUBSTR(D.CAEM2,2,5)),
        3,  C.COL3,
        4,  C.COL4,
        5,  C.COL5,
        6,  C.COL6,
        7,  C.COL7,
        8,  C.COL8,
        9,  C.COL9,
        10, C.COL10,
        11, C.COL11,
        12, C.COL12
        ),
      D.RIND
      -- DD.NUM_PERS
    
  ) D ON(CD.NUM_CODE = D.CAEM2)
WHERE
  D.COL IS NOT NULL
  AND C.CODUL LIKE '%00'
GROUP BY
  C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE
--.............................................................................
) DF
--=============================================================================