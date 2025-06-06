---------------------------------------------------------------------------------
SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL1) AS COL1,
SUM(D.COL2) AS COL2
  FROM CIS2.VW_DATA_ALL D 
   WHERE  
      D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS = :pFORM_VERS  AND          
       D.FORM = 71 AND
       D.CAPITOL IN (1185) AND
       D.RIND IN ('560','570')
       
       AND D.CUIIO = 40460355
GROUP BY
D.CUIIO,
D.RIND

ORDER BY
D.CUIIO,
D.RIND
       