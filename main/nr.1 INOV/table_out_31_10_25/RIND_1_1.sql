SELECT DISTINCT
             D.CUIIO
                      
                       
        FROM CIS2.VW_DATA_ALL D
       WHERE     D.PERIOADA IN (2013)
             AND D.FORM IN (48)
             AND D.CAPITOL = 1040
             AND CAPITOL_VERS = 2013
             AND D.CAEM2 NOT LIKE 'A%'
    
    GROUP BY D.CUIIO
    


   HAVING 
    
    CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1040) AND D.RIND LIKE ('1.1.%') THEN CIS2.NVAL(D.COL1) ELSE 0 END)) = 0 
    AND  
    CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1040) AND D.RIND LIKE ('1.5.%') THEN CIS2.NVAL(D.COL1) ELSE 0 END)) >= 1 
    