

SELECT 
C.ITEM_CODE,
REPLACE(C.ITEM_CODE, '.', '') AS COD_SPEC,
NAME
FROM CIS2.VW_CLS_CLASS_ITEM C

WHERE 
C.CLASS_CODE = 'SPEC_2EDU'
----------------------------------
----------------------------------
------------------------------------