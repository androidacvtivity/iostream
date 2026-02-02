SELECT *
FROM USER_BANCU.INV_2_2025
WHERE IDNO IN (
    SELECT IDNO
    FROM USER_BANCU.INV_2_2025
    GROUP BY IDNO
    HAVING COUNT(*) > 1
)

ORDER BY 
IDNO
------------------------------------------------------------------------------------