
SELECT 
CUIIO,
RIND,
MAX(RIND_VERS) RIND_VERS,
COL1 AS COL1,
COL2 AS COL2
 


FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT
WHERE 



FORM = 71
AND PERIOADA  =  2011
AND CUIIO = 40804917
AND CAPITOL_DEN = 'CAPITOL.7'

--AND RIND IN ('721')

GROUP BY
RIND, 
CUIIO,
COL1, 
COL2