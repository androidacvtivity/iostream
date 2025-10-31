SELECT
     
        COUNT (DISTINCT D.CUIIO) AS CNT 
       
      FROM 
        CIS2.VW_DATA_ALL D
      WHERE
        D.PERIOADA IN (:pPERIOADA) AND
        D.FORM IN (:pFORM) AND 
        D.CAPITOL = 1040 AND CAPITOL_VERS = 2013 AND 
        D.RIND IN ('1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7') AND
        D.CAEM2 NOT LIKE 'A%'
         AND NVAL(D.COL1) = 1