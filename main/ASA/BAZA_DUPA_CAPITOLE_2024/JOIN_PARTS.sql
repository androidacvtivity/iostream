
SELECT 
L.CUIIO,
L.DENUMIRE,
   L.CUATM,
        L.IDNO,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        NULL RIND,
L.CAEM2_CAP4,
ROUND(L.COL1 / 2,1) AS COL1,
ROUND(L.COL2 / 2,1) AS COL2,
ROUND(L.COL3 / 2,1) AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6
 


FROM
(
SELECT
        D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        R.IDNO,
        R.CFP,
        R.CFOJ,
        R.CAEM2,
        
      
        MAX(D.COL31) AS CAEM2_CAP4,
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    
       WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
        AND D.RIND IN ('410','400')
 

        HAVING 
        SUM (CASE WHEN D.RIND  IN ('400','410') THEN NVAL(D.COL4) + NVAL(D.COL5) + NVAL(D.COL6) ELSE 0 END ) > 0
        
        GROUP BY
       D.CUIIO,
        R.CUATM,
        R.IDNO,
        R.CFP,
        R.CFOJ,
        R.CAEM2,
        R.DENUMIRE
        
        ) L LEFT JOIN (
        
        
        SELECT
        D.CUIIO,
      
        MAX(D.COL31) AS CAEM2_CAP4,
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    
       WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
        AND D.RIND NOT IN ('410','400')
 

        HAVING 
        SUM (CASE WHEN D.RIND  NOT IN ('400','410') THEN NVAL(D.COL4) + NVAL(D.COL5) + NVAL(D.COL6) ELSE 0 END ) > 0
        
        GROUP BY
        D.CUIIO
        
        ) R ON R.CUIIO = L.CUIIO 
         
        
        WHERE 
        R.CUIIO IS NULL 
        
        AND L.CAEM2_CAP4 LIKE '56%'
        
        
        
        UNION 
        
        
        SELECT
D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        R.IDNO,
        R.CFP,
        R.CFOJ,
        R.CAEM2,
    d.rind,
    
    d.col31 AS caem2_cap4,
    NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
    SUM(d.col3) AS col4,
    SUM(d.col4) AS col5,
    SUM(d.col5) AS col6
FROM cis2.vw_data_all d
            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
WHERE d.form     = 64
  AND d.capitol  = 1127
  AND d.perioada = 2013
  AND d.rind    <> '400'
 -- AND d.cuiio    = 458963
  AND d.col31 LIKE '56%'
  AND EXISTS (   -- same CUIIO has at least one non-'56%' COL31
        SELECT 1
        FROM cis2.vw_data_all x
        WHERE x.form = d.form
          AND x.capitol  = d.capitol
          AND x.perioada = d.perioada
          AND x.rind    <> '400'
          AND x.cuiio    = d.cuiio
          AND (x.col31 NOT LIKE '56%' OR x.col31 IS NULL)
      )
GROUP BY 
D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        R.IDNO,
        R.CFP,
        R.CFOJ,
        R.CAEM2,
    d.rind,
    d.col31
HAVING
    -- keep this only if you need positive contribution on the '56%' rows
    SUM(NVL(d.col4,0) + NVL(d.col5,0) + NVL(d.col6,0)) > 0
    
    
    ORDER BY
 CUIIO
   
