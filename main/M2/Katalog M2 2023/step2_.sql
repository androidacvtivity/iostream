 SELECT *
        FROM USER_BANCU.ADD_NEW_SU_AM
        
        
        ORDER BY 
        CUATM DESC  -- 41042980 -   44-0022
        ;
       
        UPDATE USER_BANCU.ADD_NEW_SU_AM
        SET CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END,
         CUIIO_VERS = 2011
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        
             SELECT CUIIO
        FROM USER_BANCU.ADD_NEW_SU;
        
        
        
      SELECT 
      CUIIO,
      '0'||REPLACE(CUATM,'O','0') CUATM_REPLACE,
      CUATM              
        FROM USER_BANCU.ADD_NEW_SU;
        