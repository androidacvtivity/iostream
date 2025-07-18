SELECT
    D.RIND,
    NULLIF(SUM(D.COL1), 0) AS COL1,
    NULLIF(SUM(D.COL2), 0) AS COL2,
    NULLIF(SUM(D.COL3), 0) AS COL3,
    NULLIF(SUM(D.COL4), 0) AS COL4,
    NULLIF(SUM(D.COL5), 0) AS COL5
   
FROM CIS2.VW_DATA_ALL D
INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
INNER JOIN CIS2.MD_CAPITOL MR ON MR.CAPITOL = D.CAPITOL AND MR.CAPITOL_VERS = D.CAPITOL_VERS  
WHERE 
    D.PERIOADA IN (1060)
    AND D.FORM IN (45)
   AND MR.DEN_SHORT IN ('Cap.I')
   AND D.RIND IN ('1104','1110','1117','1218','1631')
GROUP BY
   
    D.RIND
   
ORDER BY
   
    D.RIND;
