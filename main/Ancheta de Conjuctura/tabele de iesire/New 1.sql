SELECT
  D.ANUL,
  D.CUIIO,
  D.CUATM,
  D.CAEM2,
  D.CAPITOL,
  D.RIND,
  D.COL1, 
  D.COL2
FROM 
  CIS2.VW_DATA_ALL D
WHERE
  D.PERIOADA IN (1062) AND
  D.FORM IN (74) AND 
  D.CAPITOL IN (1197) AND
--  D.RIND IN ('10')
 -- AND D.CAEM2 NOT LIKE 'A%'
   D.CUIIO  IN (41291133,20477690)
   
   ORDER BY 
   D.CUIIO,
   TO_NUMBER(D.RIND)
