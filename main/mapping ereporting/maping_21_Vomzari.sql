
--I have to find it 
--Which field value has the most rows in the table

SELECT
D.CUIIO,   
COUNT (D.CUIIO) AS CNT         
    
        FROM CIS2.VW_DATA_ALL D
        
         WHERE 
         D.PERIOADA = 1056
         AND D.FORM =  26 

GROUP BY 
D.CUIIO        



ORDER BY 
CNT DESC 

--It is optimal ? 