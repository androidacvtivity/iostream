
--INSERT INTO CIS2.X_BAZA_SONDAJ
--
--(
--  CUIIO,     
--  PERS_IT,
--  CIF_IT,
--  DATALIK,
--  ANUL 
--)


SELECT 
  R.CUIIO,     
  0 PERS_IT,
  0 CIF_IT,
  NULL  DATALIK,
  2025 ANUL        

       FROM CIS2.X_BAZA_SONDAJ L RIGHT JOIN  (
       
           SELECT 
                
                    DISTINCT D.CUIIO
                    
                        FROM CIS2.VW_DATA_ALL D
                        
                            WHERE 
                            D.FORM = 48
                            and d.perioada = 2013
       ) r ON  L.ANUL = 2025 AND R.CUIIO = L.CUIIO 
       
       WHERE 
       
      L.CUIIO IS NULL  