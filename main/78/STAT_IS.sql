

      SELECT   
      D.CUIIO,
      D.CAPITOL,
      D.RIND,
      SUM(D.COL1) COL1,
      SUM(D.COL2) COL2,
      SUM(D.COL3) COL3,
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
      
      SUM(D.COL1)||SUM(D.COL2)||SUM(D.COL3)||MAX(D.COL31) IS NOT NULL 
      OR 
      SUM(D.COL1)||SUM(D.COL2)||SUM(D.COL3)||MAX(D.COL31) <> 0
      ORDER BY 
      D.RIND