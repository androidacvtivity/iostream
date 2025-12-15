SELECT

  'CODUL CAEM2 - '||D.COL31||'  este adaugat de '||COUNT(D.COL31) ||' ori'  
  
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

  D.COL31
  
  HAVING 
  COUNT(D.COL31) > 1 