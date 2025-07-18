﻿--Modify this SQL - add in - having condition - to display the row that has at least one column of data

SELECT 
    CASE 
--        WHEN TO_CHAR(D.PERIOADA) = '1062'  THEN 'TRM III 2024'
        WHEN TO_CHAR(D.PERIOADA) = '1065'  THEN 'TRM II 2025'
--        WHEN TO_CHAR(D.PERIOADA) = '1060'  THEN 'TRM I 2024'
--        WHEN TO_CHAR(D.PERIOADA) = '1057'  THEN 'TRM II 2023' 
--        WHEN TO_CHAR(D.PERIOADA) = '1058'  THEN 'TRM III 2023'
--        WHEN TO_CHAR(D.PERIOADA) = '1059'  THEN 'TRM IV 2023'
--        WHEN TO_CHAR(D.PERIOADA) = '1056'  THEN 'TRM I  2023'  
    ELSE TO_CHAR(D.PERIOADA) 
    END AS TRIMESTRU,
    D.UNIT_CODE,
    D.CUATM,
    CASE 
        WHEN D.CAPITOL = 416 THEN 'Cap I'
        WHEN D.CAPITOL = 417 THEN 'Cap II'
        WHEN D.CAPITOL = 418 THEN 'Informativ'
        WHEN D.CAPITOL = 419 THEN 'Cap SR'
    END AS CAPITOL,
    D.RIND,   
    CASE 
        WHEN COALESCE(SUM(D.COL1), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL1), 0)
    END AS COL1,
    CASE 
        WHEN COALESCE(SUM(D.COL2), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL2), 0)
    END AS COL2,
    CASE 
        WHEN COALESCE(SUM(D.COL3), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL3), 0)
    END AS COL3,
    CASE 
        WHEN COALESCE(SUM(D.COL4), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL4), 0)
    END AS COL4,
    CASE 
        WHEN COALESCE(SUM(D.COL5), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL5), 0)
    END AS COL5,
    CASE 
        WHEN COALESCE(SUM(D.COL6), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL6), 0)
    END AS COL6,
    CASE 
        WHEN COALESCE(SUM(D.COL7), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL7), 0)
    END AS COL7,
    CASE 
        WHEN COALESCE(SUM(D.COL8), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL8), 0)
    END AS COL8,
    CASE 
        WHEN COALESCE(SUM(D.COL9), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL9), 0)
    END AS COL9,
    CASE 
        WHEN COALESCE(SUM(D.COL10), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL10), 0)
    END AS COL10,
    CASE 
        WHEN COALESCE(SUM(D.COL11), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL11), 0)
    END AS COL11,
    CASE 
        WHEN COALESCE(SUM(D.COL12), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL12), 0)
    END AS COL12,
    CASE 
        WHEN COALESCE(SUM(D.COL13), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL13), 0)
    END AS COL13,
    CASE 
        WHEN COALESCE(SUM(D.COL14), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL14), 0)
    END AS COL14,
    CASE 
        WHEN COALESCE(SUM(D.COL15), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL15), 0)
    END AS COL15,
    CASE 
        WHEN COALESCE(SUM(D.COL16), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL16), 0)
    END AS COL16,
    CASE 
        WHEN COALESCE(SUM(D.COL17), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL17), 0)
    END AS COL17,
    CASE 
        WHEN COALESCE(SUM(D.COL18), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL18), 0)
    END AS COL18,
    CASE 
        WHEN COALESCE(SUM(D.COL19), 0) = 0 THEN NULL
        ELSE COALESCE(SUM(D.COL19), 0)
    END AS COL19
FROM
    CIS2.VW_DATA_ALL_GC D
WHERE
    D.PERIOADA IN (1065)  
    --AND D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' 
    AND D.FORM IN (58) 
    AND D.CAPITOL IN (416,419,417,418)
GROUP BY 
    D.PERIOADA,
    D.UNIT_CODE,
    D.CUATM,
    D.CAPITOL,
    D.RIND  
ORDER BY 
    D.CUATM,
    D.UNIT_CODE,
    D.CAPITOL,
    D.RIND;
