SELECT
  'Anexa1 nu are date' AS REZULTAT
FROM
  DUAL DL LEFT JOIN
  (
    SELECT
       DISTINCT D.CUIIO,
       D.RIND,
       SUM(D.COL1) AS COL1, 
       SUM(D.COL2) AS COL2
    FROM
      CIS2.VW_DATA_ALL_FR D
    WHERE
      (D.PERIOADA=:PERIOADA          ) AND
      (D.CUIIO=:CUIIO                ) AND
      (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
      (D.FORM_VERS=:FORM_VERS ) AND
      (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
      (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
      (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
      :FORM = :FORM AND
       D.FORM IN (63)  AND
      D.CAPITOL IN(1120)
      
      
      GROUP BY 
      D.CUIIO,
      D.RIND 
      
      HAVING 
      
      NVAL(SUM(D.COL1)) <> 0
      
      OR 
      NVAL(SUM(D.COL2)) <> 0
      
      
      
      
      
      
      
  ) D ON(1=1)
WHERE
  D.CUIIO IS NULL