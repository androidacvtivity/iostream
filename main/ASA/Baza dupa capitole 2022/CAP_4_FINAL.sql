SELECT
    D.ANUL,
    D.CUIIO,
    R.IDNO,
    R.DENUMIRE,
    R.CUATM,
    R.CFP,
    R.CFOJ,
    R.CAEM2,
    MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END) AS CAEM_ACT,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN D.COL3 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN D.COL3 ELSE NULL END)
    END AS RIND_400_COL1,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN D.COL4 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN D.COL4 ELSE NULL END)
    END AS RIND_400_COL2,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN D.COL5 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN D.COL5 ELSE NULL END)
    END AS RIND_400_COL3,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('410') THEN D.COL3 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('410') THEN D.COL3 ELSE NULL END)
    END AS RIND_410_COL1,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('410') THEN D.COL4 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('410') THEN D.COL4 ELSE NULL END)
    END AS RIND_410_COL2,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('410') THEN D.COL5 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('410') THEN D.COL5 ELSE NULL END)
    END AS RIND_410_COL3,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('411') THEN D.COL3 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('411') THEN D.COL3 ELSE NULL END)
    END AS RIND_411_COL1,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('411') THEN D.COL4 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('411') THEN D.COL4 ELSE NULL END)
    END AS RIND_411_COL2,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('411') THEN D.COL5 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('411') THEN D.COL5 ELSE NULL END)
    END AS RIND_411_COL3,
    -- Repeat the same CASE logic for the remaining columns
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('471') THEN D.COL3 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('471') THEN D.COL3 ELSE NULL END)
    END AS RIND_471_COL1,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('471') THEN D.COL4 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('471') THEN D.COL4 ELSE NULL END)
    END AS RIND_471_COL2,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('471') THEN D.COL5 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('471') THEN D.COL5 ELSE NULL END)
    END AS RIND_471_COL3
FROM
    CIS2.VW_DATA_ALL D
    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
WHERE
    D.FORM IN (64)
    AND D.PERIOADA = :pPERIOADA
    AND D.CUATM_FULL LIKE '%' || :pCOD_CUATM || ';%'
    AND D.CAPITOL IN (1127, 1129)
    
    

GROUP BY
    D.ANUL,
    D.CUIIO,
    R.IDNO,
    R.DENUMIRE,
    R.CUATM,
    R.CFP,
    R.CFOJ,
    R.CAEM2
ORDER BY
    D.CUIIO