SELECT *
FROM USER_BANCU.CUATM_CIS_491 ----------------------------------------------------
WHERE CUIIO IN (
    SELECT CUIIO
    FROM USER_BANCU.CUATM_CIS_491 --------------------
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