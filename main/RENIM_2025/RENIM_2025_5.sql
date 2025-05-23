
UPDATE USER_BANCU.AGRO_16
SET 
    CUIIO = REPLACE(REPLACE(TRIM(CUIIO), CHR(9), ' '), '  ', ' '),
    CUIIO_VERS = REPLACE(REPLACE(TRIM(CUIIO_VERS), CHR(9), ' '), '  ', ' '),
    DENUMIRE = REPLACE(REPLACE(TRIM(DENUMIRE), CHR(9), ' '), '  ', ' '),
    CUATM = REPLACE(REPLACE(TRIM(CUATM), CHR(9), ' '), '  ', ' '),
    CFP = REPLACE(REPLACE(TRIM(CFP), CHR(9), ' '), '  ', ' '),
    CFOJ = REPLACE(REPLACE(TRIM(CFOJ), CHR(9), ' '), '  ', ' '),
    CAEM2 = REPLACE(REPLACE(TRIM(CAEM2), CHR(9), ' '), '  ', ' '),
    IDNO = REPLACE(REPLACE(TRIM(IDNO), CHR(9), ' '), '  ', ' ')
    ;

-------------------------------------------------------------------
SELECT 
    CUIIO, 
    REPLACE(REPLACE(TRIM(CUIIO), CHR(9), ' '), '  ', ' ') AS CLEANED_CUIIO
FROM USER_BANCU.RENIM_5_CON
WHERE CUIIO LIKE '%  %' OR CUIIO LIKE '%' || CHR(9) || '%'
;

--All coluns of this table need procesed with trim or another metod - this is Oracle
 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
--        L.DENUMIRE,
        L.CUATM------------------------
--        L.CFP,
--        L.CFOJ,
--        L.CAEM2
        FROM  USER_BANCU.AGRO_16 L
        
--        ORDER BY
--        L.CUIIO
--        
        
                      LEFT JOIN CIS2.CL_CUATM C ON TRIM(C.CODUL) =  TRIM(L.CUATM)
--                        
                      -- LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  L.CAEM2
--                        
                  --      LEFT JOIN CIS.VW_CL_CFP C ON C.CODUL =  L.CFP
                
                   --     LEFT JOIN CIS2.VW_CL_CFOJ C ON C.CODUL =  L.CFOJ 
                        WHERE 
                        
                        C.CODUL IS  NULL 



                

;