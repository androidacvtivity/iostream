SELECT
D.CUIIO,
 CIS2.NVAL(MAX( CASE WHEN   D.CAPITOL  IN (1124) AND D.RIND IN ('150') AND D.FORM IN (64) THEN CIS2.NVAL(D.COL1)  ELSE 0 END)) ||' <> '||  
 ROUND(CIS2.NVAL(MAX( CASE WHEN   DD.CAPITOL IN (1092) AND DD.RIND IN ('010') AND DD.FORM IN (57) THEN CIS2.NVAL(DD.COL2)   ELSE 0 END))/1000,1)
  
  AS REZULTAT

FROM
 CIS2.VW_DATA_ALL D INNER JOIN CIS2.VW_DATA_ALL_FR DD ON (D.CUIIO=DD.CUIIO AND D.PERIOADA=DD.PERIOADA AND DD.CUIIO=D.CUIIO)

WHERE
  (D.PERIOADA IN(:PERIOADA) AND
  DD.PERIOADA IN (:PERIOADA))AND
 
-- D.CUIIO       = :CUIIO        AND
-- DD.CUIIO       = :CUIIO        AND
 :CUIIO_VERS   = :CUIIO_VERS   AND
-- :FORM         = :FORM         AND 
 :FORM_VERS    = :FORM_VERS    AND
 :CAPITOL      = :CAPITOL      AND 
 :CAPITOL_VERS = :CAPITOL_VERS AND 
 :ID_MD        = :ID_MD         


GROUP BY 
D.CUIIO

HAVING
 CIS2.NVAL(MAX( CASE WHEN   D.CAPITOL  IN (1124) AND D.RIND IN ('150') AND D.FORM IN (64) THEN CIS2.NVAL(D.COL1)  ELSE 0 END)) <>   
ROUND (CIS2.NVAL(MAX( CASE WHEN   DD.CAPITOL IN (1092) AND DD.RIND IN ('010') AND DD.FORM IN (57) THEN CIS2.NVAL(DD.COL2)   ELSE 0 END))/1000,1)
  
