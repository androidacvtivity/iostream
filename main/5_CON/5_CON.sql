

SELECT D.CUIIO,
       D.RIND,
       SUM(D.COL1) AS COL1
       
       FROM CIS2.VW_DATA_ALL D 
       
       WHERE 
       D.FORM IN (:pFORM)
       AND D.PERIOADA IN (:pPERIOADA)
       
       GROUP BY
       D.CUIIO,
       D.RIND
       
       ORDER BY
        D.CUIIO,
       D.RIND
            