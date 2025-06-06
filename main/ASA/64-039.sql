
--Modify this Oracle SQL If two columns are equal and it not equal with 0 , we filter it out (won't display) 
SELECT 

    
     NVAL(L.COL1)||' <> '||NVAL(R.COL2)||' <> '||NVAL(R.COL1) 
     
     AS REZULTAT
FROM

(


SELECT
D.CUIIO,
SUM(CASE  WHEN  D.CAPITOL IN (1126)  AND D.RIND IN ('320') THEN  NVAL(D.COL2) ELSE 0 END ) AS COL1

   
    FROM
 CIS2.VW_DATA_ALL D 


WHERE
  (D.PERIOADA=:PERIOADA        ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS       ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  D.FORM IN (64) 

 

GROUP BY 
D.CUIIO





) L LEFT JOIN (

SELECT
D.CUIIO,
ROUND(SUM(CASE WHEN   D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('63.1120.060') THEN  D.COL2 ELSE NULL END ) / 1000,1) AS COL1,
ROUND(SUM(CASE WHEN   D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('57.1090.290') THEN  D.COL2 ELSE NULL END ) /1000,1)AS COL2
    
    FROM
 CIS2.VW_DATA_ALL_FR D 


WHERE
  (D.PERIOADA=:PERIOADA ) AND
    (D.CUIIO=:CUIIO                ) AND
  (:CUIIO_VERS=:CUIIO_VERS      OR :CUIIO_VERS <> CUIIO_VERS) AND
  (:FORM = :FORM                OR :FORM <> :FORM) AND
  (:FORM_VERS=:FORM_VERS        OR :FORM_VERS <>:FORM_VERS) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (:CAPITOL_VERS = :CAPITOL_VERS OR :CAPITOL_VERS <> :CAPITOL_VERS) AND
  (:ID_MD=:ID_MD                 OR :ID_MD<>:ID_MD) AND
  

   
    D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('63.1120.060','57.1090.290')
    
    
    GROUP BY
    D.CUIIO

) R ON R.CUIIO = L.CUIIO 



GROUP BY
L.CUIIO,
L.COL1,

R.COL1,
R.COL2


--
--HAVING
--
--
----NVAL(L.COL1) <> NVAL(R.COL1) + NVAL(R.COL2)
--
--CASE 
--        WHEN NVL(L.COL1, 0) = NVL(R.COL1, 0) OR NVL(L.COL1, 0) = NVL(R.COL2, 0) OR NVL(R.COL1, 0) = NVL(R.COL2, 0)
--        THEN 0 -- If two columns are equal, we filter it out (won't display)
--        ELSE 1 -- Otherwise, display the result
--    END = 1 
----

 
 
 

