WITH PARAMS AS (
    SELECT
        2014 AS PERIOADA,
        67   AS FORM,
        2000 AS FORM_VERS
    FROM DUAL
),

/* 
   Alegem ultima versiune din VW_DATA_ALL_PRIMIT.
   Acolo nu se sterge nimic, de aceea trebuie sa luam ultimul T_XML_FORM_ID.
*/
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
                    D.CUIIO
                ORDER BY
                    D.T_XML_FORM_ID DESC NULLS LAST
            ) AS RN
        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        INNER JOIN PARAMS P
            ON P.PERIOADA  = D.PERIOADA
           AND P.FORM      = D.FORM
           AND P.FORM_VERS = D.FORM_VERS
        WHERE D.ID_SCHEMA = 2
          AND D.DATA_REG < DATE '2026-06-01'
          AND EXISTS (
              SELECT 1
              FROM CIS2.VW_DATA_ALL X
              WHERE X.PERIOADA  = D.PERIOADA
                AND X.FORM      = D.FORM
                AND X.FORM_VERS = D.FORM_VERS
                AND X.CUIIO     = D.CUIIO
          )
    )
    WHERE RN = 1
),

/* 
   Grupam mai intai pe raport + capitol + rand.
   Aici eliminam dublarea la nivel de rand.
*/
PRIMIT_BASE AS (
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
    FROM PRIMIT_SRC D
    GROUP BY
        D.CUIIO,
        D.CUATM,
        D.CAPITOL,
        D.RIND
),

CIS2_BASE AS (
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
    INNER JOIN PARAMS P
        ON P.PERIOADA  = D.PERIOADA
       AND P.FORM      = D.FORM
       AND P.FORM_VERS = D.FORM_VERS
    WHERE D.DATA_REG < DATE '2026-06-01'
    GROUP BY
        D.CUIIO,
        D.CUATM,
        D.CAPITOL,
        D.RIND
),

BASE_DATA AS (
    SELECT
        'P' AS SRC,
        CUIIO,
        CUATM,
        CAPITOL,
        RIND,
        COL1,
        COL2,
        COL3,
        COL4,
        COL5,
        COL6,
        COL7,
        COL8,
        COL9,
        COL10,
        COL11,
        COL12,
        COL13,
        COL14,
        COL15,
        COL16,
        COL17,
        COL18,
        COL19,
        COL20,
        COL21,
        COL22
    FROM PRIMIT_BASE

    UNION ALL

    SELECT
        'C' AS SRC,
        CUIIO,
        CUATM,
        CAPITOL,
        RIND,
        COL1,
        COL2,
        COL3,
        COL4,
        COL5,
        COL6,
        COL7,
        COL8,
        COL9,
        COL10,
        COL11,
        COL12,
        COL13,
        COL14,
        COL15,
        COL16,
        COL17,
        COL18,
        COL19,
        COL20,
        COL21,
        COL22
    FROM CIS2_BASE
),

UNPVT AS (
    SELECT
        SRC,
        CUIIO,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME,
        VAL
    FROM BASE_DATA
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

/*
   Dupa UNPIVOT, fiecare coloana devine rand.
   Daca suma pe CUIIO + CAPITOL + RIND + COL este > 0, inseamna celula completata.
*/
GROUPED_COLS AS (
    SELECT
        SRC,
        CUIIO,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME,
        SUM(NVL(VAL, 0)) AS VAL_SUM
    FROM UNPVT
    GROUP BY
        SRC,
        CUIIO,
        CUATM,
        CAPITOL,
        RIND,
        COL_NAME
),

COUNT_BY_CUATM AS (
    SELECT
        SRC,
        CUATM AS CODUL,
        COUNT(*) AS CNT_COLS
    FROM GROUPED_COLS
    WHERE VAL_SUM > 0
    GROUP BY
        SRC,
        CUATM
),

L AS (
    SELECT
        CODUL,
        SUM(CASE WHEN SRC = 'C' THEN CNT_COLS ELSE 0 END) AS CEL_TOTAL_CIS2,
        SUM(CASE WHEN SRC = 'P' THEN CNT_COLS ELSE 0 END) AS CEL_EREPORTING
    FROM COUNT_BY_CUATM
    GROUP BY CODUL
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