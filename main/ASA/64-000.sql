SELECT 
 -- 'Ati selectat '||SUM(R.CNUM)||' cauza(e)' 
  'Nu ati completat toate cimpurile'
  
  AS REZULTAT 
FROM
(

SELECT COUNT(D.COL31) AS CNUM
FROM VW_DATA_ALL D
WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.CAPITOL IN (1129) AND
  D.RIND IN('3')

UNION
SELECT 0 AS CNUM
FROM DUAL

) R

HAVING
  SUM(R.CNUM)<>1