------------------------------------------------
UPDATE USER_BANCU.RENIM_2014 ----------------------
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
            UPDATE USER_BANCU.RENIM_2014
        SET
         CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END,
         CUIIO_VERS =  2014;
        -- CFOJ = '420'
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        SELECT  *
          
        FROM USER_BANCU.RENIM_2014;
        
        ----------------------------------------------
        
       
INSERT INTO CIS2.FORM_CUIIO 

(
     CUIIO,
     CUIIO_VERS,
     FORM,
     FORM_VERS,
     STATUT 
)

 
        
    SELECT  
     CUIIO,
     1068 CUIIO_VERS,
     13 FORM,
     1004  FORM_VERS,
     '1'  STATUT 
          
        FROM USER_BANCU.R_67;