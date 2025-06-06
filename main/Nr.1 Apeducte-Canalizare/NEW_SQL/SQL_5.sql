

SELECT 
    L.RIND,
    L.DENUMIRE,
    L.COL9 
FROM USER_BANCU.VW_47_2013 L;

SELECT 
    L.RIND AN_2023,
    L.DENUMIRE DEN_AN_2023,
    R.RIND AN_2022,
    R.DENUMIRE DEN_AN_2022,
    L.COL9   COL9_2023,
    R.COL9   COL9_2022
     
FROM USER_BANCU.VW_47_2013  L LEFT JOIN USER_BANCU.VW_47_2012 R ON R.RIND = L.RIND

WHERE 
R.RIND IS NULL

ORDER BY
L.RIND
;