SELECT *
FROM USER_BANCU.RENIM_NEW
WHERE IDNO IN (
    SELECT IDNO
    FROM USER_BANCU.RENIM_NEW
    GROUP BY IDNO
    HAVING COUNT(*) > 1
);