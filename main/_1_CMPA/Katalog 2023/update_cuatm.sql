SELECT *
FROM CIS2.REG_UNIT_GC

WHERE 
UNIT_CODE_VERS = 1056

AND LENGTH(CUATM) = 6;






 UPDATE CIS2.REG_UNIT_GC
        SET CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END
         
        
        WHERE 
        
        UNIT_CODE_VERS = 1056
        
        
AND LENGTH(CUATM) = 6;