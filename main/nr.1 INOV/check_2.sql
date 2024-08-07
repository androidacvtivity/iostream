SELECT
  SUM(COL9) AS COL1,
  SUM(COL1) AS COL2,
  SUM(COL2) AS COL3, 
  SUM(COL3) AS COL4, 
  SUM(COL4) AS COL5, 
  SUM(COL5) AS COL6, 
  SUM(COL6) AS COL7,
  SUM(COL7) AS COL8,
  SUM(COL8) AS COL9,
  SUM(COL10) AS COL10  


   
FROM
(
SELECT
--Check on the code - 0000000
  D.CUIIO,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN D.CAPITOL||'.'||D.RIND IN ('100.02')THEN D.CUIIO END )) AS COL1,   
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN D.CAPITOL||'.'||D.RIND IN ('100.03')THEN D.CUIIO END )) AS COL2,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN D.CAPITOL||'.'||D.RIND IN ('100.04')THEN D.CUIIO END )) AS COL3,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN D.CAPITOL||'.'||D.RIND IN ('100.05')THEN D.CUIIO END )) AS COL4,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN D.CAPITOL||'.'||D.RIND IN ('100.06')THEN D.CUIIO END )) AS COL5,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN D.CAPITOL||'.'||D.RIND IN ('100.07')THEN D.CUIIO END )) AS COL6,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN (D.CAPITOL IN (100)  AND D.RIND  IN ('02','03','04','05','06','07')) THEN D.CUIIO END )) AS COL7,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN (D.CAPITOL IN (100)  AND D.RIND  IN ('01','02','03','04','05','06''07')) THEN D.CUIIO END )) AS COL8,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN (D.CAPITOL IN (100)  AND D.RIND  IN ('01'))  THEN D.CUIIO END )) AS COL9,
  CIS2.NVAL(COUNT( DISTINCT CASE WHEN 1=1 THEN D.CUIIO END )) AS COL10    
   
  FROM 
  CIS2.VW_DATA_ALL D  
   
  INNER JOIN CIS2.VW_CL_CUATM CC ON (D.CUATM=CC.CODUL)
    
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND  

  D.FORM IN (48)  


GROUP BY 

    D.CUIIO
    )
  

  
