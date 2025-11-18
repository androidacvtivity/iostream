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
    SUM(d.col3) AS col1,
    SUM(d.col4) AS col2,
    SUM(d.col5) AS col3
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
D.CUIIO,
D.RIND    
