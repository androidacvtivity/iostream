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
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('100') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('100') THEN D.COL1 ELSE NULL END)
    END AS RIND_100,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('110') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('110') THEN D.COL1 ELSE NULL END)
    END AS RIND_110,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('111') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('111') THEN D.COL1 ELSE NULL END)
    END AS RIND_111,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('112') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('112') THEN D.COL1 ELSE NULL END)
    END AS RIND_112,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('120') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('120') THEN D.COL1 ELSE NULL END)
    END AS RIND_120,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('121') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('121') THEN D.COL1 ELSE NULL END)
    END AS RIND_121,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('122') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('122') THEN D.COL1 ELSE NULL END)
    END AS RIND_122,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('130') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('130') THEN D.COL1 ELSE NULL END)
    END AS RIND_130,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('140') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('140') THEN D.COL1 ELSE NULL END)
    END AS RIND_140,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150') THEN D.COL1 ELSE NULL END)
    END AS RIND_150,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('151') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('151') THEN D.COL1 ELSE NULL END)
    END AS RIND_151,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('160') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('160') THEN D.COL1 ELSE NULL END)
    END AS RIND_160,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('170') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('170') THEN D.COL1 ELSE NULL END)
    END AS RIND_170,
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('180') THEN D.COL1 ELSE NULL END) = 0 THEN NULL
         ELSE SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('180') THEN D.COL1 ELSE NULL END)
    END AS RIND_180
FROM
    CIS2.VW_DATA_ALL_COEF D 
    -- CIS2.VW_DATA_ALL D
  --Roma2024~!@#
INNER JOIN
    CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
WHERE
    D.FORM IN (64)
    AND D.PERIOADA = :pPERIOADA
    AND D.CUATM_FULL LIKE '%' || :pCOD_CUATM || ';%'
    AND D.CAPITOL IN (1124, 1129)
--    AND D.CUIIO = 819906
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