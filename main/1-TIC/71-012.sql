SELECT DISTINCT
  'Nu satisface conditia' AS REZULTAT
  

FROM
VW_DATA_ALL  D                                  
WHERE
  (D.PERIOADA=:PERIOADA) AND
  (D.CUIIO=:CUIIO               ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS  ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
 
  D.FORM = 71
  AND D.CAPITOL IN (1181)

HAVING
 
SUM(CASE WHEN D.RIND IN ('170') THEN NVAL(D.COL2) ELSE 0 END) > 0 

AND 

SUM(CASE WHEN D.RIND IN ('180') THEN NVAL(D.COL1) + NVAL(D.COL2) ELSE 0 END)
 +
SUM(CASE WHEN D.RIND IN ('181') THEN NVAL(D.COL1) + NVAL(D.COL2) ELSE 0 END)  > 0 






  




  
  

  
  
  