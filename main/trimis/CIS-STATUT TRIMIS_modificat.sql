DECLARE
    TYPE t_forme IS TABLE OF PLS_INTEGER;
    v_forme t_forme := t_forme(
        5, 6, 11, 13, 15, 18, 19, 26, 29, 33,
        44, 45, 58, 61, 62, 74, 76, 77, 101
    );
BEGIN
    FOR i IN 1 .. v_forme.COUNT LOOP
        CIS2.PRC_STATUT_TRIMIS(
            pPERIOADA => 1071,
            pFORM     => v_forme(i)
        );
    END LOOP;
END;
/