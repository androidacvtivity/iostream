SELECT 
        
         D.CUIIO,
         COUNT (DISTINCT D.CAPITOL) AS CMT
  
            FROM CIS2.VW_DATA_ALL D INNER JOIN CIS2.RENIM R 
            ON  R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS 
            
            WHERE 
            D.FORM in (50)
            AND D.PERIOADA = 2014 
            AND D.CAPITOL IN (1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069)
    --        AND D.CUIIO = 400001
            GROUP BY
             D.CUIIO
             
             
             HAVING 
             COUNT (DISTINCT D.CAPITOL) < 12 