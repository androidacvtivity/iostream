SELECT 
    D.CUIIO,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2
FROM
(
    SELECT 
        D.CUIIO,
        D.PERIOADA,
        SUM(D.COL4) - 
        CASE 
            WHEN D.PERIOADA = 1056 THEN 1688 
            WHEN D.PERIOADA = 1057 THEN 9806 
            ELSE 0 
        END AS COL1,
        CASE 
            WHEN D.PERIOADA = 1056 THEN SUM(D.COL4) / (
                SELECT SUM(COL1)
                FROM (
                    SELECT 44519 AS ID_MD, 1057 AS PERIOADA, 19.456 AS COL1 FROM DUAL
                    UNION ALL
                    SELECT 44519 AS ID_MD, 1056 AS PERIOADA, 18.8453 AS COL1 FROM DUAL
                ) WHERE PERIOADA = 1056 OR PERIOADA = 1057
            )
            WHEN D.PERIOADA = 1057 THEN SUM(D.COL4) / (
                SELECT SUM(COL1)
                FROM (
                    SELECT 44519 AS ID_MD, 1057 AS PERIOADA, 19.456 AS COL1 FROM DUAL
                    UNION ALL
                    SELECT 44519 AS ID_MD, 1056 AS PERIOADA, 18.8453 AS COL1 FROM DUAL
                ) WHERE PERIOADA = 1056 OR PERIOADA = 1057
            )
            ELSE 0
        END AS COL2
    FROM (
        SELECT 19206 AS CUIIO, 1057 AS PERIOADA, 9806 AS COL4 FROM DUAL
        UNION ALL 
        SELECT 19206 AS CUIIO, 1056 AS PERIOADA, 1688 AS COL4 FROM DUAL
    ) D
    WHERE D.PERIOADA IN (1056, 1057)
    GROUP BY D.CUIIO, D.PERIOADA, D.COL4
) D
GROUP BY D.CUIIO;
