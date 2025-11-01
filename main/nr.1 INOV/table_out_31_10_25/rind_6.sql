SELECT
     
        COUNT (DISTINCT D.CUIIO) AS CNT 
       
      FROM 
        CIS2.VW_DATA_ALL D
      WHERE
        D.PERIOADA IN (:pPERIOADA) AND
        D.FORM IN (:pFORM) AND 
        D.CAPITOL = 1040 AND CAPITOL_VERS = 2013 AND 
        D.RIND LIKE '1.6%' AND
        D.CAEM2 NOT LIKE 'A%'
         AND NVAL(D.COL1) = 1