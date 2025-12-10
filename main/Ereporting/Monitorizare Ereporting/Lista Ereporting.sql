 
 
 SELECT     
 
    FROM CIS2.VW_DATA_ALL D
    WHERE 
    1=1
    AND D.FORM IN (45)
    AND D.PERIOADA  IN (1067)
    AND USER_NAME IN ('e-Reporting')
 -- R.CUIIO LIKE   40583135||'%'