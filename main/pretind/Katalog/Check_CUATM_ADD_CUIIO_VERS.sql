      UPDATE  USER_BANCU.KAT_110
        SET
         CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END,
         CUIIO_VERS = 480
         
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        
        
        SELECT *    
        FROM USER_BANCU.KAT_110;