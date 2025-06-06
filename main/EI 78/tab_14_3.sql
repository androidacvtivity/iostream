
SELECT 
L.CUIIO,
L.DENUMIRE,
L.PACHET,
L.ITEM_CODE,
L.NAME,
L.COL1,
R.COL1 AS COL2,
L.COL1 - R.COL1 AS COL3 

FROM
(
SELECT
   D.CUIIO,
   MAX(R.DENUMIRE) DENUMIRE,
   MAX(D.PACHET)  PACHET,
   CI.ITEM_CODE, 
   CI.NAME,
  SUM(CASE WHEN D.CAPITOL IN (405) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL1



FROM
  CIS2.VW_DATA_ALL D 
  INNER JOIN CIS2.RENIM R ON R.CUIIO =  D.CUIIO AND R.CUIIO_VERS =  D.CUIIO_VERS 
  INNER JOIN  CIS2.VW_CLS_CLASS_ITEM CI  ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))

WHERE 
   (D.PERIOADA IN(1063,1062,1061,1060))    

      
    
    AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 
   D.FORM IN (44)
   AND  D.CAPITOL IN (405) 
  AND D.CUIIO = 41180391
   
GROUP BY
  D.CUIIO,
  CI.ITEM_CODE,
  CI.NAME
   ) L  LEFT JOIN (
   SELECT
   D.CUIIO,
   MAX(R.DENUMIRE) DENUMIRE,
   MAX(D.PACHET)  PACHET,
   CI.ITEM_CODE, 
   CI.NAME,
  SUM(CASE WHEN D.CAPITOL IN (405) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL1



FROM
  CIS2.VW_DATA_ALL D 
  INNER JOIN CIS2.RENIM R ON R.CUIIO =  D.CUIIO AND R.CUIIO_VERS =  D.CUIIO_VERS 
  INNER JOIN  CIS2.VW_CLS_CLASS_ITEM CI  ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))

WHERE 
   (D.PERIOADA IN(1056,1057,1058,1059))    

      
    
    AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 
   D.FORM IN (44)
   AND  D.CAPITOL IN (405) 
  AND D.CUIIO = 41180391
   
GROUP BY
  D.CUIIO,
  CI.ITEM_CODE,
  CI.NAME
   ) R ON R.CUIIO = L.CUIIO  AND L.ITEM_CODE = R.ITEM_CODE