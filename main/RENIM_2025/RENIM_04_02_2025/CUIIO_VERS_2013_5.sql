--Create SQL code to delete duplicates in Oracle by column CUIIO - which is number
SELECT *
FROM USER_BANCU.CUATM_CIS ----------------------------------------------------
WHERE CUIIO IN (
    SELECT CUIIO
    FROM USER_BANCU.CUATM_CIS --------------------
    GROUP BY CUIIO
    HAVING COUNT(*) > 1
)

ORDER BY 
CUIIO;


DELETE FROM USER_BANCU.AUTO_65_1068
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM USER_BANCU.AUTO_65_1068
    GROUP BY CUIIO
);

-----------------------------------------------------------