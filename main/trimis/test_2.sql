SELECT 
    D.CUIIO,
    SUM(CASE WHEN D.PERIOADA = 1056 THEN D.COL1 ELSE 0 END) + SUM(CASE WHEN D.PERIOADA = 1057 THEN D.COL1 ELSE 0 END) AS COL1,
    SUM(CASE WHEN D.PERIOADA = 1056 THEN D.COL2 ELSE 0 END) + SUM(CASE WHEN D.PERIOADA = 1057 THEN D.COL2 ELSE 0 END) AS COL2
FROM
(

--Round the COL2 result
    SELECT 
        D.CUIIO,
        D.PERIOADA,
        SUM(D.COL4) AS COL1,
        SUM(D.COL4) / CR.COL1 AS COL2 -- here Round the COL2 result
    FROM CIS2.DATA_ALL D
    CROSS JOIN (
        SELECT
            D.PERIOADA,
            SUM(D.COL1) AS COL1
        FROM DATA_ALL D
        WHERE D.PERIOADA IN (1056, 1057) AND D.ID_MD = 44519
        GROUP BY D.PERIOADA
    ) CR
    WHERE 
        (D.PERIOADA = :pPERIOADA OR D.PERIOADA = :pPERIOADA-1) AND
        D.FORM = 44 AND
        D.CUIIO = 19206
    GROUP BY D.CUIIO, D.PERIOADA, CR.COL1
) D
GROUP BY D.CUIIO;
