

SELECT 

D.CUIIO,
D.RIND,
SUM(D.COL1) AS COL1,
SUM(D.COL2) AS COL2,
SUM(D.COL3) AS COL3,
SUM(D.COL4) AS COL4,
SUM(D.COL5) AS COL5,
SUM(D.COL6) AS COL6,
SUM(D.COL7) AS COL7 
FROM VW_DATA_ALL D 


WHERE 

D.T_XML_FORM_ID =16710324


GROUP BY 
D.CUIIO,
D.RIND

ORDER BY 
D.CUIIO,
D.RIND