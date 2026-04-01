

      SELECT   
      D.CUIIO,
      D.CAPITOL,
      D.RIND,
    NULLIF(SUM(D.COL1), 0) AS COL1,
NULLIF(SUM(D.COL2), 0) AS COL2,
NULLIF(SUM(D.COL3), 0) AS COL3,
      MAX(D.COL31) COL31
      FROM   STAT.VW_DATA_ALL D --INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
      
      WHERE 
      
       D.T_XML_FORM_ID = 16712535
 
 
 AND CUIIO = 41188607
 AND PERIOADA = 2014
 AND CAPITOL_DEN = 'CAP. A'
 
 GROUP BY 
  D.CUIIO,
      D.CAPITOL,
      D.RIND
      
      
      HAVING 
      -- Sa afiseze daca este cel putin o coloana cu date - in 31 este varchar 
      SUM(D.COL1)||SUM(D.COL2)||SUM(D.COL3)||MAX(D.COL31) IS NOT NULL 
      OR 
      SUM(D.COL1)||SUM(D.COL2)||SUM(D.COL3)||MAX(D.COL31) <> 0
      ORDER BY 
      D.RIND