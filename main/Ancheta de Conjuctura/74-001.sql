SELECT
--D.CUIIO,
  TR.ORDINE||'. '||
  CASE 
  WHEN
      MAX(TR.CONDITIE1) IN ('=') AND MAX(TR.CONDITIE2) IN ('<=') AND MAX(TR.BOTH_COL) IN ('1') AND
      (SUM(DISTINCT CASE WHEN D.CAPITOL IN (TR.CAPITOL1) AND TR.RIND1 LIKE ('%'||D.RIND||'%') AND LENGTH(D.RIND) = TR.RIND_LENGTH THEN NVAL(DECODE(NR_COLUMN1,'1',D.COL1,'2',D.COL2)) ELSE 0 END) = MAX(TR.RESULT1) AND
  SUM(DISTINCT CASE WHEN D.CAPITOL IN (TR.CAPITOL2) AND TR.RIND2 LIKE ('%'||D.RIND||'%') AND LENGTH(D.RIND) = TR.RIND_LENGTH THEN NVAL(D.COL1)+NVAL(D.COL2) ELSE 0 END) <= MAX(TR.RESULT2)) 
    THEN
      MAX(DISTINCT CASE WHEN D.CAPITOL IN (TR.CAPITOL1) THEN D.CAPITOL_DEN END)||' R�ndul.'||MAX(TR.RIND1)||' a?i selectat '||MAX(DECODE(NR_COLUMN1,'1','Da','2','Nu'))||' atunci R�ndul.'||MAX(TR.RIND2)||' trebuie sa fie bifate'
  WHEN
      MAX(TR.CONDITIE1) IN ('=') AND MAX(TR.CONDITIE2) IN ('<') AND MAX(TR.BOTH_COL) IN ('ROWS2') AND
      (SUM(DISTINCT CASE WHEN D.CAPITOL IN (TR.CAPITOL1) AND TR.RIND1 LIKE ('%'||D.RIND||'%') THEN NVAL(DECODE(NR_COLUMN1,'1',D.COL1,'2',D.COL2)) ELSE 0 END) = MAX(TR.RESULT1) AND
      SUM(CASE WHEN D.CAPITOL IN (TR.CAPITOL2) AND TR.RIND2 LIKE ('%'||D.RIND||'%') AND LENGTH(D.RIND) = TR.RIND_LENGTH THEN NVAL(DECODE(NR_COLUMN2,'1',D.COL1,'2',D.COL2)) ELSE 0 END) < MAX(TR.RESULT2)) 
    THEN
      MAX(DISTINCT CASE WHEN D.CAPITOL IN (TR.CAPITOL1) THEN D.CAPITOL_DEN END)||' R�ndul.'||MAX(TR.RIND1)||' a?i selectat '||MAX(DECODE(NR_COLUMN1,'1','Da','2','Nu'))||' atunci unul din R�ndurile.'||MAX(TR.RIND2)||' trebuie sa fie bifate'
  WHEN
      MAX(TR.CONDITIE1) IN ('=') AND MAX(TR.CONDITIE2) IN ('<') AND MAX(TR.BOTH_COL) IN ('1') AND
      (SUM(DISTINCT CASE WHEN D.CAPITOL IN (TR.CAPITOL1) AND TR.RIND1 LIKE ('%'||D.RIND||'%') THEN NVAL(DECODE(NR_COLUMN1,'1',D.COL1,'2',D.COL2)) ELSE 0 END) = MAX(TR.RESULT1) AND
  SUM(CASE WHEN D.CAPITOL IN (TR.CAPITOL2) AND TR.RIND2 LIKE ('%'||D.RIND||'%') AND LENGTH(D.RIND) = TR.RIND_LENGTH THEN NVAL(D.COL1) ELSE 0 END) < MAX(TR.RESULT2)) 
    THEN
      MAX(DISTINCT CASE WHEN D.CAPITOL IN (TR.CAPITOL1) THEN D.CAPITOL_DEN END)||' R�ndul.'||MAX(TR.RIND1)||' a?i selectat '||MAX(DECODE(NR_COLUMN1,'1','Da','2','Nu'))||' atunci unul din R�ndurile.'||MAX(TR.RIND2)||' trebuie sa fie bifate'  
  END
  AS REZULTAT

FROM 
 (
 SELECT
  D.CUIIO,
  D.CAPITOL,
  D.CAPITOL_DEN,
  D.RIND,
  D.CAEM2,
  D.COL1,D.COL2, D.COL32
FROM
 CIS2.VW_DATA_ALL D 
 
WHERE
  (D.PERIOADA IN (:PERIOADA) ) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS  OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL           OR  :CAPITOL<>:CAPITOL) AND
  (:CAPITOL_VERS = :CAPITOL_VERS OR  :CAPITOL_VERS <> :CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  D.FORM IN (74) AND
  D.CAPITOL IN (1197,1199) 
  
  
  
  AND
  (SELECT
      DD.RIND
    FROM
      VW_DATA_ALL DD
    WHERE
      (DD.PERIOADA IN (:PERIOADA) ) AND
      DD.FORM IN (74) AND
      DD.CAPITOL IN (1199) AND
      DD.CUIIO=D.CUIIO AND
      DD.RIND NOT IN ('CD','PHONE')) IN (1)
 )D
CROSS JOIN
 (

SELECT 1197 AS CAPITOL1, 1197 AS CAPITOL2, '9' AS RIND1, '9.01,9.02,9.03,9.04,9.05,9.06,9.07,9.08' AS RIND2, 9.1 AS ORDINE, '2' AS NR_COLUMN1, '1' AS NR_COLUMN2, '=' AS CONDITIE1, '>' AS CONDITIE2, '1' AS RESULT1, '1' AS RESULT2, 'ROWS2' AS BOTH_COL, 4 AS RIND_LENGTH FROM DUAL UNION
SELECT 1197 AS CAPITOL1, 1197 AS CAPITOL2, '9' AS RIND1, '9.01,9.02,9.03,9.04,9.05,9.06,9.07,9.08' AS RIND2, 9.2 AS ORDINE, '1' AS NR_COLUMN1, '1' AS NR_COLUMN2, '=' AS CONDITIE1, '<' AS CONDITIE2, '1' AS RESULT1, '1' AS RESULT2, 'ROWS2' AS BOTH_COL, 4 AS RIND_LENGTH FROM DUAL 
--UNION
--SELECT 1197 AS CAPITOL1, 1197 AS CAPITOL2, '9.08' AS RIND1, '9.08' AS RIND2, 9.3 AS ORDINE, '1' AS NR_COLUMN1, '32' AS NR_COLUMN2, '=' AS CONDITIE1, '<' AS CONDITIE2, '1' AS RESULT1, '1' AS RESULT2, 'ROWS2' AS BOTH_COL, 4 AS RIND_LENGTH FROM DUAL 
) TR
GROUP BY
--  D.CUIIO,
  TR.ORDINE
HAVING
--   
--------   -----------------------------------------------------------------------------
  (
  MAX(TR.CONDITIE1) IN ('=') 
  
  AND MAX(TR.CONDITIE2) IN ('<') 
  
  AND MAX(TR.BOTH_COL) IN ('ROWS2') 
  AND
  
  SUM(DISTINCT CASE WHEN D.CAPITOL IN (TR.CAPITOL1) AND TR.RIND1 LIKE ('%'||D.RIND||'%') AND LENGTH(D.RIND) = TR.RIND_LENGTH THEN NVAL(DECODE(NR_COLUMN1,'1',D.COL1,'2',D.COL2)) ELSE 0 END) = MAX(TR.RESULT1) 
  
  )
  
--  AND
--  SUM(CASE WHEN D.CAPITOL IN (TR.CAPITOL2) AND TR.RIND2 LIKE ('%'||D.RIND||'%') /*AND LENGTH(D.RIND) = TR.RIND_LENGTH*/ THEN NVAL(DECODE(NR_COLUMN2,'1',D.COL1,'2',D.COL2,'32',LENGTH(D.COL32))) ELSE 0 END) < MAX(TR.RESULT2)) 
--  