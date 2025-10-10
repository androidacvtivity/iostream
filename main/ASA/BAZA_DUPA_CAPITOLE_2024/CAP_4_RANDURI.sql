SELECT
    t.CUIIO,
    t.DENUMIRE,
    t.CUATM,
    t.RIND,
    NULLIF(TRIM(t.CAEM2_CAP4), '0') AS CAEM2_CAP4, -- CAEM2_CAP4 e text: comparam cu '0'
    NULLIF(t.COL1, 0)                AS COL1,      -- sumele sunt numerice
    NULLIF(t.COL2, 0)                AS COL2,
    NULLIF(t.COL3, 0)                AS COL3
FROM (
    SELECT
        D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        C.FULL_CODE,
        D.RIND,
        D.COL31 AS CAEM2_CAP4,
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    INNER JOIN CIS2.RENIM R
        ON R.CUIIO = D.CUIIO
       AND R.CUIIO_VERS = D.CUIIO_VERS
    INNER JOIN CIS2.VW_CL_CUATM C
        ON C.CODUL = D.CUATM
    WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
--        AND D.CUIIO = 34275
    GROUP BY
        D.CUIIO, R.DENUMIRE, R.CUATM, C.FULL_CODE, D.COL31, D.RIND
) t
ORDER BY
    t.FULL_CODE, t.CUIIO, t.RIND;
