WITH PRIMIT_MAX AS (
    SELECT
        D.PERIOADA,
        D.FORM,
        D.FORM_VERS,
        D.CUIIO,
        D.CUIIO_VERS,
        MAX(D.PACHET) AS MAX_PACHET
    FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
    WHERE D.PERIOADA = 2014
      AND D.FORM IN (67)
      AND D.FORM_VERS IN (2000)
      AND D.ID_SCHEMA = 2
      AND D.DATA_REG < TO_DATE('06/01/2026 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
      AND EXISTS (
          SELECT 1
          FROM CIS2.DATA_ALL X
          WHERE X.PERIOADA = D.PERIOADA
            AND X.FORM = D.FORM
            AND X.CUIIO = D.CUIIO
      )
    GROUP BY
        D.PERIOADA,
        D.FORM,
        D.FORM_VERS,
        D.CUIIO,
        D.CUIIO_VERS
),

PRIMIT_DATA AS (
    SELECT
        D.CUIIO,
        D.CUATM,
        D.CAPITOL,
        D.RIND,

        SUM(D.COL1)  AS COL1,
        SUM(D.COL2)  AS COL2,
        SUM(D.COL3)  AS COL3,
        SUM(D.COL4)  AS COL4,
        SUM(D.COL5)  AS COL5,
        SUM(D.COL6)  AS COL6,
        SUM(D.COL7)  AS COL7,
        SUM(D.COL8)  AS COL8,
        SUM(D.COL9)  AS COL9,
        SUM(D.COL10) AS COL10,
        SUM(D.COL11) AS COL11,
        SUM(D.COL12) AS COL12,
        SUM(D.COL13) AS COL13,
        SUM(D.COL14) AS COL14,
        SUM(D.COL15) AS COL15,
        SUM(D.COL16) AS COL16,
        SUM(D.COL17) AS COL17,
        SUM(D.COL18) AS COL18,
        SUM(D.COL19) AS COL19,
        SUM(D.COL20) AS COL20,
        SUM(D.COL21) AS COL21,
        SUM(D.COL22) AS COL22
    FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
    INNER JOIN PRIMIT_MAX M
        ON M.PERIOADA   = D.PERIOADA
       AND M.FORM       = D.FORM
       AND M.FORM_VERS  = D.FORM_VERS
       AND M.CUIIO      = D.CUIIO
       AND M.CUIIO_VERS = D.CUIIO_VERS
       AND M.MAX_PACHET = D.PACHET
    WHERE D.PERIOADA = 2014
      AND D.FORM IN (67)
      AND D.FORM_VERS IN (2000)
      AND D.ID_SCHEMA = 2
    GROUP BY
        D.CUIIO,
        D.CUATM,
        D.CAPITOL,
        D.RIND
),

CIS2_DATA AS (
    SELECT
        D.CUIIO,
        D.CUATM,
        D.CAPITOL,
        D.RIND,

        SUM(D.COL1)  AS COL1,
        SUM(D.COL2)  AS COL2,
        SUM(D.COL3)  AS COL3,
        SUM(D.COL4)  AS COL4,
        SUM(D.COL5)  AS COL5,
        SUM(D.COL6)  AS COL6,
        SUM(D.COL7)  AS COL7,
        SUM(D.COL8)  AS COL8,
        SUM(D.COL9)  AS COL9,
        SUM(D.COL10) AS COL10,
        SUM(D.COL11) AS COL11,
        SUM(D.COL12) AS COL12,
        SUM(D.COL13) AS COL13,
        SUM(D.COL14) AS COL14,
        SUM(D.COL15) AS COL15,
        SUM(D.COL16) AS COL16,
        SUM(D.COL17) AS COL17,
        SUM(D.COL18) AS COL18,
        SUM(D.COL19) AS COL19,
        SUM(D.COL20) AS COL20,
        SUM(D.COL21) AS COL21,
        SUM(D.COL22) AS COL22
    FROM CIS2.VW_DATA_ALL D
    WHERE D.PERIOADA = 2014
      AND D.FORM IN (67)
      AND D.FORM_VERS IN (2000)
      AND D.DATA_REG < TO_DATE('06/01/2026 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
    GROUP BY
        D.CUIIO,
        D.CUATM,
        D.CAPITOL,
        D.RIND
),

PRIMIT_COUNT AS (
    SELECT
        CUATM AS CODUL,
        SUM(
            CASE WHEN NVL(COL1, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL2, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL3, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL4, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL5, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL6, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL7, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL8, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL9, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL10, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL11, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL12, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL13, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL14, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL15, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL16, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL17, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL18, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL19, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL20, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL21, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL22, 0) > 0 THEN 1 ELSE 0 END
        ) AS CEL_EREPORTING
    FROM PRIMIT_DATA
    GROUP BY CUATM
),

CIS2_COUNT AS (
    SELECT
        CUATM AS CODUL,
        SUM(
            CASE WHEN NVL(COL1, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL2, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL3, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL4, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL5, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL6, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL7, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL8, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL9, 0)  > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL10, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL11, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL12, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL13, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL14, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL15, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL16, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL17, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL18, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL19, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL20, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL21, 0) > 0 THEN 1 ELSE 0 END +
            CASE WHEN NVL(COL22, 0) > 0 THEN 1 ELSE 0 END
        ) AS CEL_TOTAL_CIS2
    FROM CIS2_DATA
    GROUP BY CUATM
),

L AS (
    SELECT
        NVL(C.CODUL, P.CODUL) AS CODUL,
        NVL(C.CEL_TOTAL_CIS2, 0) AS CEL_TOTAL_CIS2,
        NVL(P.CEL_EREPORTING, 0) AS CEL_EREPORTING
    FROM CIS2_COUNT C
    FULL OUTER JOIN PRIMIT_COUNT P
        ON P.CODUL = C.CODUL
),

CR AS (
    SELECT
        DECODE(
            CS.CODUL,
            '0000000','01',
            '0100000','02',
            '1111111','03',
            '0300000','04',
            '1400000','05',
            '3400000','06',
            '3600000','07',
            '4100000','08',
            '4300000','09',
            '4500000','10',
            '4800000','11',
            '6200000','12',
            '7100000','13',
            '7400000','14',
            '7800000','15',
            '2222222','16',
            '1000000','17',
            '2500000','18',
            '3100000','19',
            '3800000','20',
            '5300000','21',
            '5500000','22',
            '6000000','23',
            '6400000','24',
            '6700000','25',
            '8000000','26',
            '8300000','27',
            '8900000','28',
            '9200000','29',
            '3333333','30',
            '1200000','31',
            '1700000','32',
            '2100000','33',
            '2700000','34',
            '2900000','35',
            '5700000','36',
            '8500000','37',
            '8700000','38',
            '9600000','39',
            '9601000','40',
            '9602000','41',
            '9603000','42'
        ) AS NR_ROW,
        CS.DENUMIRE AS NUME_ROW,
        CS.CODUL AS CS_CUATM
    FROM CIS2.VW_CL_CUATM CS
    WHERE CS.CODUL IN (
        '0000000','0100000','1111111','0300000','1400000',
        '3400000','3600000','4100000','4300000','4500000',
        '4800000','6200000','7100000','7400000','7800000',
        '2222222','1000000','2500000','3100000','3800000',
        '5300000','5500000','6000000','6400000','6700000',
        '8000000','8300000','8900000','9200000','3333333',
        '1200000','1700000','2100000','2700000','2900000',
        '5700000','8500000','8700000','9600000',
        '9601000','9602000','9603000'
    )
)

SELECT
    TO_NUMBER(CR.NR_ROW) AS ORDINE,
    CR.NUME_ROW AS NR_ROW,

    SUM(
        CASE 
            WHEN INSTR(C.FULL_CODE, CR.CS_CUATM) > 0 
            THEN L.CEL_TOTAL_CIS2 
            ELSE 0 
        END
    ) AS CEL_TOTAL_CIS2,

    SUM(
        CASE 
            WHEN INSTR(C.FULL_CODE, CR.CS_CUATM) > 0 
            THEN L.CEL_EREPORTING 
            ELSE 0 
        END
    ) AS CEL_EREPORTING

FROM L
INNER JOIN CIS2.VW_CL_CUATM C
    ON C.CODUL = L.CODUL
CROSS JOIN CR
GROUP BY
    CR.NUME_ROW,
    TO_NUMBER(CR.NR_ROW),
    CR.CS_CUATM
ORDER BY
    TO_NUMBER(CR.NR_ROW);