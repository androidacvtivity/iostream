SELECT *
FROM USER_BANCU.AGRO_16 ----------------------------------------------------
WHERE CUIIO IN (
    SELECT CUIIO
    FROM USER_BANCU.AGRO_16 --------------------
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