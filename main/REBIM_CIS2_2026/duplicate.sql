--Create SQL code to delete duplicates in Oracle by column CUIIO - which is number
SELECT *
FROM USER_BANCU.MEICO ----------------------------------------------------
WHERE CUIIO IN (
    SELECT CUIIO
    FROM USER_BANCU.MEICO --------------------
    GROUP BY CUIIO
    HAVING COUNT(*) > 1
)

ORDER BY 
CUIIO;


DELETE FROM USER_BANCU.MEICO
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM USER_BANCU.MEICO
    GROUP BY CUIIO
);

-----------------------------------------------------------