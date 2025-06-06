DECLARE -- ====================================================================
------------------------------------------------------------------------------------
CURSOR C IS

-----------------------------------------
------------------
 SELECT 
      L.CONTROL,
      L.CONTROL_VERS,
      L.FORMULA,
      L.SQL_TEXT,
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
        FROM CIS.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        FROM CIS.MD_CONTROL A
         WHERE
         1=1
         AND A.FORM  = 2
        GROUP BY 
          A.CONTROL
          ORDER BY 
          A.CONTROL
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
          WHERE
         1=1
         AND B.FORM  = 2
         AND B.STATUT <> '3'
        ORDER BY 
          B.CONTROL ) L
          WHERE 
          1=1 AND 
    
(DBMS_LOB.INSTR(L.SQL_TEXT, '%OR :PERIOADA = -1%') = 0 )

    

 
          ;
---------------------------
BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS.MD_CONTROL SET

SQL_TEXT = REPLACE(CR.SQL_TEXT, 'OR :PERIOADA = -1', ' ')

WHERE
CONTROL = CR.CONTROL 
AND 
CONTROL_VERS = CR.CONTROL_VERS 

AND FORM = 2 AND  


(DBMS_LOB.INSTR(SQL_TEXT, '%OR :PERIOADA = -1%') = 0 )
;
END LOOP;
END;














