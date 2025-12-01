SELECT 
        
         D.CUIIO,
         COUNT (DISTINCT D.CAPITOL) AS CMT
  
            FROM CIS2.VW_DATA_ALL D INNER JOIN CIS2.RENIM R 
            ON  R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS 
            
            WHERE 
            D.FORM in (49)
            AND D.PERIOADA = 2014 
            AND D.CAPITOL IN (1049,1050,1051,1052,1053,1054,1055,1056,1057)
    --        AND D.CUIIO = 400001
            GROUP BY
             D.CUIIO
             
             
             HAVING 
             COUNT (DISTINCT D.CAPITOL) < 9 