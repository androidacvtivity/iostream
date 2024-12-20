SELECT
DISTINCT 
 'Rind.'||L.RIND  
||':  '|| SUM(NVAL(L.COL1)) ||' <>  '||SUM(NVAL(R.COL5))    AS REZULTAT


FROM 


(
SELECT 
D.CUIIO,
D.RIND,
SUM(NVAL(D.COL1)+ NVAL(D.COL2)) AS COL1 
FROM

     USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE D 
      
WHERE

  (D.PERIOADA        =:PERIOADA          ) AND
  (D.CUIIO           =:CUIIO              ) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             )        AND 
  (D.FORM_VERS       = :FORM_VERS        )   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM = 67 
  AND D.CAPITOL IN (1142)
  AND D.RIND IN ('700','760')    

  AND D.ID_SCHEMA = 2
  
  GROUP BY
  D.CUIIO,
  D.RIND
  
   ) L  LEFT JOIN (
   
   
   SELECT 
D.CUIIO,
D.RIND,
SUM(NVAL(D.COL7)+NVAL(D.COL8)) AS COL5 
FROM

     CIS2.VW_DATA_ALL D 
      
WHERE
  (D.PERIOADA        = :PERIOADA -1         ) AND
  (D.CUIIO=:CUIIO                ) AND
  (:CUIIO_VERS<>:CUIIO_VERS      OR :CUIIO_VERS=:CUIIO_VERS) AND
  (:FORM <> :FORM                OR :FORM =:FORM) AND
  (:FORM_VERS<>:FORM_VERS        OR :FORM_VERS=:FORM_VERS) AND
  (:CAPITOL <> :CAPITOL          OR :CAPITOL=:CAPITOL) AND
  (:CAPITOL_VERS<>:CAPITOL_VERS OR :CAPITOL_VERS=:CAPITOL_VERS) AND
  (:ID_MD=:ID_MD               OR :ID_MD = -1)
  AND D.FORM = 67 
  AND D.CAPITOL IN (1142)
  AND D.RIND IN ('700','760')    
 

  
  GROUP BY
  D.CUIIO, 
  D.RIND
   )  R ON (
   
--   R.CUIIO = L.CUIIO AND 
   R.RIND = L.RIND)
   
   
   GROUP BY 
   L.RIND 
   
   HAVING 
   
   SUM(NVAL(L.COL1)) <> SUM(NVAL(R.COL5))
    
   AND
   
   
   
   
  (
 SELECT
  DISTINCT
  D.CUIIO
FROM
  CIS2.VW_DATA_ALL D
WHERE
  (D.PERIOADA IN (:PERIOADA-1)) AND
  (D.CUIIO=:CUIIO  ) AND
   D.FORM  IN(67)) IS NOT NULL
   
   AND
  (
 SELECT
  DISTINCT
  D.CUIIO
FROM
  USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE  D
WHERE
  (D.PERIOADA IN (:PERIOADA)) AND
  (D.CUIIO=:CUIIO  ) AND
   D.FORM  IN(67)) IS NOT NULL






-------------------------------------------------------------------------------  
  
UNION 



  SELECT
DISTINCT 
 'Rind.'||R.RIND  
||':  '|| SUM(NVAL(L.COL1)) ||' <>  '||SUM(NVAL(R.COL5))    AS REZULTAT


FROM 


(
SELECT 
D.CUIIO,
D.RIND,
SUM(NVAL(D.COL1)+NVAL(D.COL2)) AS COL1 
FROM

     USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE D 
      
WHERE

  (D.PERIOADA        =:PERIOADA          ) AND
  (D.CUIIO           =:CUIIO              ) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             )        AND 
  (D.FORM_VERS       = :FORM_VERS        )   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM = 67 
  AND D.CAPITOL IN (1142)
  AND D.RIND IN ('700','760')    

  AND D.ID_SCHEMA = 2
  
  GROUP BY
  D.CUIIO,
  D.RIND
  
   ) L  RIGHT JOIN (
   
   
   SELECT 
D.CUIIO,
D.RIND,
SUM(NVAL(D.COL7)+NVAL(D.COL8)) AS COL5 
FROM

     CIS2.VW_DATA_ALL D 
      
WHERE
  (D.PERIOADA        = :PERIOADA - 1          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (:CUIIO_VERS<>:CUIIO_VERS      OR :CUIIO_VERS=:CUIIO_VERS) AND
  (:FORM <> :FORM                OR :FORM =:FORM) AND
  (:FORM_VERS<>:FORM_VERS        OR :FORM_VERS=:FORM_VERS) AND
  (:CAPITOL <> :CAPITOL          OR :CAPITOL=:CAPITOL) AND
  (:CAPITOL_VERS<>:CAPITOL_VERS OR :CAPITOL_VERS=:CAPITOL_VERS) AND
  (:ID_MD=:ID_MD               OR :ID_MD = -1)
  AND D.FORM = 67 
  AND D.CAPITOL IN (1142)
  AND D.RIND IN ('700','760')    
 

  
  GROUP BY
  D.CUIIO, 
  D.RIND
   )  R ON (
  -- R.CUIIO = L.CUIIO AND 
   R.RIND = L.RIND)
   
   
   GROUP BY 
   R.RIND 
   
   HAVING 
   
   SUM(NVAL(L.COL1)) <> SUM(NVAL(R.COL5))
   
   AND
   
   
   
   
   
  (
 SELECT
  DISTINCT
  D.CUIIO
FROM
  CIS2.VW_DATA_ALL D
WHERE
  (D.PERIOADA IN (:PERIOADA-1)) AND
  (D.CUIIO=:CUIIO  ) AND
   D.FORM  IN(67)) IS NOT NULL
   
   AND
  (
 SELECT
  DISTINCT
  D.CUIIO
FROM
  USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE  D
WHERE
  (D.PERIOADA IN (:PERIOADA)) AND
  (D.CUIIO=:CUIIO  ) AND
   D.FORM  IN(67)) IS NOT NULL
     
   
  
  
  


 
 
 

  


 
 
 

