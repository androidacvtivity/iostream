﻿SELECT 
      L.CONTROL,
    --  L.CONTROL_VERS, ---------------------------
      L.FORMULA,
--      L.SQL_TEXT,
      L.PRIORITATEA,
      L.STATUT
 FROM( 
SELECT 
      B.CONTROL,
      B.CONTROL_VERS,
      B.FORMULA,
      B.SQL_TEXT,
      B.PRIORITATEA,
      B.STATUT
        FROM CIS2.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        FROM CIS2.MD_CONTROL A
         WHERE
         1=1
         AND A.FORM  = 48
        GROUP BY 
          A.CONTROL
          ORDER BY 
          A.CONTROL
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
          WHERE
         1=1
         AND B.FORM  = 48
         AND B.STATUT <> '3'
        ORDER BY 
          B.CONTROL ) L
          WHERE 
          1=1 
     -- AND     
----       
--       (DBMS_LOB.INSTR(L.SQL_TEXT, 'VW_DATA_ALL_TEMP') > 0
--                   AND DBMS_LOB.INSTR(L.SQL_TEXT, 'VW_DATA_ALL') >  0)

