
SELECT
COUNT (DISTINCT CASE WHEN D.RIND IN ('01') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS RIND_01,
COUNT (DISTINCT CASE WHEN D.RIND IN ('02') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS RIND_02,
COUNT (DISTINCT CASE WHEN D.RIND IN ('03') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS RIND_03,
COUNT (DISTINCT CASE WHEN D.RIND IN ('04') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS RIND_04,
COUNT (DISTINCT CASE WHEN D.RIND IN ('05') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS RIND_05,
COUNT (DISTINCT CASE WHEN D.RIND IN ('06') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS RIND_06,
COUNT (DISTINCT CASE WHEN D.RIND IN ('07') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS RIND_07,
COUNT (DISTINCT CASE WHEN D.RIND IN ('ER') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS RIND_ER

FROM
 CIS2.VW_DATA_ALL D

WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
 -- D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND 
  D.FORM IN (48)
  AND D.CAPITOL IN (100)

--AND D.CUIIO = 400053