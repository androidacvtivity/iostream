
SELECT
 C.CODUL,
 C.FULL_CODE,
 NULL AS COL1,
COUNT (DISTINCT CASE WHEN D.RIND IN ('01') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS COL2,
COUNT (DISTINCT CASE WHEN D.RIND IN ('02') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS COL3,
COUNT (DISTINCT CASE WHEN D.RIND IN ('03') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS COL4,
COUNT (DISTINCT CASE WHEN D.RIND IN ('04') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS COL5,
COUNT (DISTINCT CASE WHEN D.RIND IN ('05') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS COL6,
COUNT (DISTINCT CASE WHEN D.RIND IN ('06') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS COL7,
COUNT (DISTINCT CASE WHEN D.RIND IN ('07') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS COL8,
COUNT (DISTINCT CASE WHEN D.RIND IN ('ER') AND NVAL(D.COL1) = 1 THEN  D.CUIIO  END ) AS COL9

FROM
 CIS2.VW_DATA_ALL D
   INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = D.CUATM
 
        

WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND 
  D.FORM IN (48)
  AND D.CAPITOL IN (100)

--AND D.CUIIO = 400053

GROUP BY
 C.CODUL,
 C.FULL_CODE