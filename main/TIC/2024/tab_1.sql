
 SELECT 
 D.CUIIO,
 D.CUATM,
 D.RIND,
 SUM(D.COL1) AS COL1
 FROM
      CIS2.VW_DATA_ALL D   
WHERE   
       D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS = :pFORM_VERS  AND  
      (:pID_MDTABLE=:pID_MDTABLE) AND
       D.FORM = 71 AND
       D.CAPITOL IN (1181) AND
       D.RIND  IN ('110','111','112','113')
       
       
       GROUP BY
        D.CUIIO,
        D.CUATM,
        D.RIND 