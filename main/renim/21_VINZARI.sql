SELECT 
 
CUIIO, 
 
 MAX(DATA_REG) AS DATA_REG 
 

FROM USER_EREPORTING.VW_DATA_ALL
WHERE
FORM IN  26

AND PERIOADA = 1061

AND CUIIO IN (


40739368,
41610236,
41340682,
38594249,
40195775,
41043091,
41322655,
41165144,
41558079

)


--AND   DATA_REG >= TO_DATE('06/28/2024 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
GROUP BY
CUIIO
ORDER BY
DATA_REG  DESC 