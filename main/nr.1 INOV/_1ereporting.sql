
SELECT 
    DISTINCT D.CUIIO 
    
    USER_NAME,
    DATA_REG


 FROM CIS2.VW_DATA_ALL D

WHERE 
--CUIIO IN (
--2741962 
--)
----
--AND 


PERIOADA >= 2013

AND FORM = 48


ORDER BY
DATA_REG DESC