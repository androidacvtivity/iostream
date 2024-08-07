SELECT   

  DECODE(CC.NR_COLUMN,  '1', 'COL.1: ','2', 'COL.2: ')||'['||
  SUM(CASE WHEN D.CAPITOL IN (1001)  AND CIS2.D.RIND IN ('010') AND D.PERIOADA IN (:PERIOADA)     THEN DECODE(CC.NR_COLUMN, '1', CIS2.NVAL(D.COL1), '2', CIS2.NVAL(D.COL2) ) ELSE 0 END) ||' <> '||
  SUM(CASE WHEN D.CAPITOL IN (1001)  AND  CIS2.D.RIND IN ('010') AND D.PERIOADA IN (:PERIOADA - 1) THEN DECODE(CC.NR_COLUMN, '1', CIS2.NVAL(D.COL1), '2', CIS2.NVAL(D.COL2) ) ELSE 0 END )  
 ||']'
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D,             
       (                             
       SELECT '1' AS NR_COLUMN FROM DUAL UNION
       SELECT '2' AS NR_COLUMN FROM DUAL
                                            
       ) CC     
 
WHERE
  (D.PERIOADA IN (:PERIOADA,:PERIOADA-1)      ) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (:CUIIO_VERS=:CUIIO_VERS      OR :CUIIO_VERS <>  :CUIIO_VERS) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS  OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (:CAPITOL_VERS = :CAPITOL_VERS OR  :CAPITOL_VERS <> :CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (17)   AND  D.CAPITOL IN (1001) 
  
--  AND (
--  
--  SELECT 
--
--COUNT (DISTINCT D.PERIOADA) AS CNT
-- 
--
--FROM
--  CIS2.VW_DATA_ALL D            
--            
-- 
--WHERE
--  (D.PERIOADA IN (:PERIOADA,:PERIOADA-1)      ) AND
--  (D.CUIIO=:CUIIO ) AND
--
--  
--  D.FORM IN (17)   AND  D.CAPITOL IN (1034) 
--  ) >= 2 
  
 
 
GROUP BY CC.NR_COLUMN

HAVING

SUM(CASE WHEN CIS2.D.RIND IN ('010') AND D.PERIOADA IN (:PERIOADA)     THEN DECODE(CC.NR_COLUMN, '1', CIS2.NVAL(D.COL1), '2', CIS2.NVAL(D.COL2) ) ELSE 0 END)  <> 
  SUM(CASE WHEN CIS2.D.RIND IN ('010') AND D.PERIOADA IN (:PERIOADA - 1) THEN DECODE(CC.NR_COLUMN, '1', CIS2.NVAL(D.COL1), '2', CIS2.NVAL(D.COL2) ) ELSE 0 END )  

