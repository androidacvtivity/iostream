------------------------------------------------
UPDATE USER_BANCU.RENIM_AGR ----------------------
SET CUATM = 
    CASE 
        -- Ruleaza prima verificare: înlocuie?te 'O' cu '0'
        WHEN SUBSTR(CUATM, 1, 1) = 'O' THEN 
            '0' || SUBSTR(CUATM, 2)  -- Concateneaza '0' cu restul ?irului
        -- Apoi verifica daca trebuie adaugat '0' în fa?a
        WHEN LENGTH(CUATM) = 6 AND SUBSTR(CUATM, 1, 1) IN ('1', '3') THEN 
            '0' || CUATM  -- Prepand '0'
        -- Daca nici o condi?ie nu este îndeplinita, pastreaza valoarea
        ELSE 
            CUATM
    END;
    
    --------------------------------------------------------------------------------
            UPDATE USER_BANCU.RENIM_AGR
        SET
         CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END,
         CUIIO_VERS = 2015;
        -- CFOJ = '420'
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        SELECT  *
          
        FROM USER_BANCU.RENIM_AGR;
        
        ----------------------------------------------
        
--       
--INSERT INTO CIS2.FORM_CUIIO 
--
--(
--     CUIIO,
--     CUIIO_VERS,
--     FORM,
--     FORM_VERS,
--     STATUT 
--)

 
        
    SELECT  
     CUIIO,
     2015 CUIIO_VERS,
     43 FORM,
     2000  FORM_VERS,
     '1'  STATUT 
          
        FROM USER_BANCU.RENIM_AGR
        
        WHERE 
        CUIIO  NOT IN (
        40713112,
40803890,
40926761,
40983320,
41002554,
41003631,
41003648,
41070969,
41095691,
41096517,
41124085,
41125894,
41190863,
41236364,
41268989,
41313372,
41390616,
41451507,
41452004,
41501211

        
        )