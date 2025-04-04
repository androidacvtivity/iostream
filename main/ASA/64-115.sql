SELECT

 'Ati selectat -  Chestionar cu date '|| CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100) AND D.RIND IN ('1') THEN D.COL1 ELSE 0 END )) ||'- Raportul nu are date '  
 
 AS REZULTAT

 
--------------------------------------------
        
FROM VW_DATA_ALL D

WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (:CAPITOL=:CAPITOL           OR :CAPITOL <>  :CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS <> :CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
   D.FORM IN (64)
  
HAVING
--
NVAL(SUM(CASE WHEN D.CAPITOL     IN (100)  AND D.RIND IN ('1') THEN D.COL1 ELSE 0 END )) = 1 
--
--
AND 
--
(NVAL(SUM(CASE WHEN D.CAPITOL  IN (1124)  THEN D.COL1 ELSE 0 END )) = 0 

OR  

NVAL(MAX(CASE WHEN D.CAPITOL  IN (1127) AND D.RIND IN ('410')  THEN D.COL31  ELSE  NULL END )) = 0 )

