SELECT
  '%='|| ROUND((SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('76.28.160') AND D.PERIOADA IN (:PERIOADA) THEN D.COL1 ELSE 0 END)*100)/  
          SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('76.28.10') AND D.PERIOADA IN (:PERIOADA)  THEN D.COL1 ELSE 0 END)/
         
         MAX(DD.COL1))

    ||' (p/u info: Anul='||
   
  ROUND((SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('76.28.160') AND D.PERIOADA IN (:PERIOADA) THEN D.COL1 ELSE 0 END)*1000)/  
         SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('76.28.10') AND D.PERIOADA IN (:PERIOADA)  THEN D.COL1 ELSE 0 END))
  
    ||',  Anul-1='|| MAX(DD.COL1)*1000||')'
    
--   CAP. 2 R.160 Col.1*100/R.10 Col.1 Anul/ (R.160 Col.1/R.10 Col.1)Anul-1= [100-120]% 

  AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D
  LEFT JOIN 
  (
  
  
  SELECT D.CUIIO, 
    ROUND ((CIS2.NVAL(SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('7.40.160')  THEN D.COL1 ELSE 0 END)))/  
    CIS2.NOZERO( SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('7.40.10')  THEN D.COL1 ELSE 0 END)),3) AS COL1
  
 FROM
  CIS.VW_DATA_ALL D  
WHERE   
      (
      
      D.PERIOADA IN (
                    
                    SELECT
                      P.PERIOADA
                    FROM
                      CIS.VW_MD_PERIOADA P                     
                    WHERE
                      P.TRIMESTR + 4 IN (:PERIOADA) 
                      AND P.TIP_PERIOADA IN (4)
                      
                      
      )) AND                  
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND  
   FORM IN (7) AND
   CAPITOL IN (40)
  
 GROUP BY D.CUIIO
 
 
 ) DD ON D.CUIIO=DD.CUIIO
  
WHERE
  (D.PERIOADA IN (:PERIOADA)         ) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  ( :CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  ( :FORM = :FORM               OR :FORM = -1) AND
  ( :FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  ( :CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  ( :CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  ( :ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
   FORM IN (76) AND
   CAPITOL IN (28) AND D.NUM IN (3)
  
  
HAVING

    ROUND(((SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('76.28.160') AND D.PERIOADA IN (:PERIOADA) THEN D.COL1 ELSE 0 END)*100)/
   
CIS2.NOZERO(SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('76.28.10') AND D.PERIOADA IN (:PERIOADA)  THEN D.COL1 ELSE 0 END)))/
   
     CIS2.NOZERO(MAX(DD.COL1)),1)  <100
   
   OR
   
    ROUND(((SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('76.28.160') AND D.PERIOADA IN (:PERIOADA) THEN D.COL1 ELSE 0 END)*100)/
   
CIS2.NOZERO(SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('76.28.10') AND D.PERIOADA IN (:PERIOADA)  THEN D.COL1 ELSE 0 END)))/
   
     CIS2.NOZERO(MAX(DD.COL1)),1)>120
--   
--   