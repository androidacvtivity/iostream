WITH PARAMS AS (
    SELECT
        2014 AS PERIOADA,
        67   AS FORM,
        2000 AS FORM_VERS
    FROM DUAL
),

PRIMIT_SRC AS (
    SELECT *
    FROM (
        SELECT
            D.*,
            DENSE_RANK() OVER (
                PARTITION BY
                    D.PERIOADA,
                    D.FORM,
                    D.FORM_VERS,
                    D.CUIIO,
                    D.CUIIO_VERS
                ORDER BY
                    D.T_XML_FORM_ID DESC NULLS LAST,
                    D.DATA_REG DESC NULLS LAST
            ) AS RN
        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        INNER JOIN PARAMS P
            ON P.PERIOADA  = D.PERIOADA
           AND P.FORM      = D.FORM
           AND P.FORM_VERS = D.FORM_VERS
        WHERE D.ID_SCHEMA = 2
          AND D.DATA_REG < DATE '2026-06-01'
    )
    WHERE RN = 1
),

PRIMIT_BASE AS (
    SELECT
        D.CUIIO,
        D.CUIIO_VERS,
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
    FROM PRIMIT_SRC D
    GROUP BY
        D.CUIIO,
        D.CUIIO_VERS,
        D.CUATM,
        D.CAPITOL,
        D.RIND
),

CIS2_BASE AS (
    SELECT
        D.CUIIO,
        D.CUIIO_VERS,
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
    INNER JOIN PARAMS P
        ON P.PERIOADA  = D.PERIOADA
       AND P.FORM      = D.FORM
       AND P.FORM_VERS = D.FORM_VERS
    WHERE D.DATA_REG < DATE '2026-06-01'
    GROUP BY
        D.CUIIO,
        D.CUIIO_VERS,
        D.CUATM,
        D.CAPITOL,
        D.RIND
),

PRIMIT_UNPVT AS (
    SELECT
        CUIIO,
        CUIIO_VERS,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME,
        VAL
    FROM PRIMIT_BASE
    UNPIVOT INCLUDE NULLS (
        VAL FOR COL_NAME IN (
            COL1  AS 'COL1',
            COL2  AS 'COL2',
            COL3  AS 'COL3',
            COL4  AS 'COL4',
            COL5  AS 'COL5',
            COL6  AS 'COL6',
            COL7  AS 'COL7',
            COL8  AS 'COL8',
            COL9  AS 'COL9',
            COL10 AS 'COL10',
            COL11 AS 'COL11',
            COL12 AS 'COL12',
            COL13 AS 'COL13',
            COL14 AS 'COL14',
            COL15 AS 'COL15',
            COL16 AS 'COL16',
            COL17 AS 'COL17',
            COL18 AS 'COL18',
            COL19 AS 'COL19',
            COL20 AS 'COL20',
            COL21 AS 'COL21',
            COL22 AS 'COL22'
        )
    )
),

CIS2_UNPVT AS (
    SELECT
        CUIIO,
        CUIIO_VERS,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME,
        VAL
    FROM CIS2_BASE
    UNPIVOT INCLUDE NULLS (
        VAL FOR COL_NAME IN (
            COL1  AS 'COL1',
            COL2  AS 'COL2',
            COL3  AS 'COL3',
            COL4  AS 'COL4',
            COL5  AS 'COL5',
            COL6  AS 'COL6',
            COL7  AS 'COL7',
            COL8  AS 'COL8',
            COL9  AS 'COL9',
            COL10 AS 'COL10',
            COL11 AS 'COL11',
            COL12 AS 'COL12',
            COL13 AS 'COL13',
            COL14 AS 'COL14',
            COL15 AS 'COL15',
            COL16 AS 'COL16',
            COL17 AS 'COL17',
            COL18 AS 'COL18',
            COL19 AS 'COL19',
            COL20 AS 'COL20',
            COL21 AS 'COL21',
            COL22 AS 'COL22'
        )
    )
),

PRIMIT_POS AS (
    SELECT
        CUIIO,
        CUIIO_VERS,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME
    FROM PRIMIT_UNPVT
    GROUP BY
        CUIIO,
        CUIIO_VERS,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME
    HAVING SUM(NVL(VAL, 0)) > 0
),

CIS2_POS AS (
    SELECT
        CUIIO,
        CUIIO_VERS,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME
    FROM CIS2_UNPVT
    GROUP BY
        CUIIO,
        CUIIO_VERS,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME
    HAVING SUM(NVL(VAL, 0)) > 0
),

CIS2_COUNT AS (
    SELECT
        CUATM AS CODUL,
        COUNT(*) AS CEL_TOTAL_CIS2
    FROM CIS2_POS
    GROUP BY CUATM
),

EREPORTING_COUNT AS (
    SELECT
        P.CUATM AS CODUL,
        COUNT(*) AS CEL_EREPORTING
    FROM PRIMIT_POS P
    INNER JOIN CIS2_POS C
        ON C.CUIIO      = P.CUIIO
       AND C.CUIIO_VERS = P.CUIIO_VERS
       AND C.CUATM      = P.CUATM
       AND C.CAPITOL    = P.CAPITOL
       AND C.RIND       = P.RIND
     --  AND C.COL_NAME   = P.COL_NAME
    GROUP BY P.CUATM
),

L AS (
    SELECT
        C.CODUL,
        NVL(C.CEL_TOTAL_CIS2, 0) AS CEL_TOTAL_CIS2,
        NVL(E.CEL_EREPORTING, 0) AS CEL_EREPORTING
    FROM CIS2_COUNT C
    LEFT JOIN EREPORTING_COUNT E
        ON E.CODUL = C.CODUL
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
        '0000000',
        '0100000',
        '1111111',
        '0300000',
        '1400000',
        '3400000',
        '3600000',
        '4100000',
        '4300000',
        '4500000',
        '4800000',
        '6200000',
        '7100000',
        '7400000',
        '7800000',
        '2222222',
        '1000000',
        '2500000',
        '3100000',
        '3800000',
        '5300000',
        '5500000',
        '6000000',
        '6400000',
        '6700000',
        '8000000',
        '8300000',
        '8900000',
        '9200000',
        '3333333',
        '1200000',
        '1700000',
        '2100000',
        '2700000',
        '2900000',
        '5700000',
        '8500000',
        '8700000',
        '9600000',
        '9601000',
        '9602000',
        '9603000'
    )
)

SELECT
    TO_NUMBER(CR.NR_ROW) AS ORDINE,
    CR.NUME_ROW AS NR_ROW,

    SUM(
        CASE
            WHEN INSTR(C.FULL_CODE, CR.CS_CUATM) > 0
            THEN NVL(L.CEL_TOTAL_CIS2, 0)
            ELSE 0
        END
    ) AS CEL_TOTAL_CIS2,

    SUM(
        CASE
            WHEN INSTR(C.FULL_CODE, CR.CS_CUATM) > 0
            THEN NVL(L.CEL_EREPORTING, 0)
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