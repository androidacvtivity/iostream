----------------------------
SELECT 
CUIIO
FROM USER_BANCU.IDNO

UNION ALL 

SELECT 
TO_NUMBER(SUBSTR(CUIIO, 1, LENGTH(CUIIO) - 2)) AS CUIIO
FROM USER_BANCU.IDNO


ORDER BY
CUIIO