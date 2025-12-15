SELECT

  'CODUL CAEM2 - '||D.COL32||'  este adaugat de '||COUNT(D.COL32) ||' ori'  
  
  AS REZULTAT

FROM
 CIS2.VW_DATA_ALL D 
 
WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1)
  
  AND capitol=1127 
  AND D.RIND NOT IN ('400')
  
  GROUP BY

  D.COL32
  
  HAVING 
  COUNT(D.COL32) > 1 