--INSERT INTO CIS2.RENIM (
--    CUIIO,
--    CUIIO_VERS,
--    DENUMIRE,
--    EDIT_USER,
--    STATUT,
--    CUATM,
--    CFP,
--    CFOJ,
--    COCM,
--    CAEM,
--    BUGET,
--    TIP,
--    PROD,
--    FOR_CUB,
--    GENMUZEE,
--    TIPMUZEE,
--    TIP_LOCAL,
--    TIP_INST,
--    CAEM2,
--    N85_NTL,
--    N85_NTIIP,
--    N85_NDIIP,
--    N85_NPDS,
--    N85_NRIIP,
--    N85_NSIIP,
--    GENMUZEE2,
--    NFI,
--    NTII,
--    NPDS,
--    ORGANE,
--    TIP_INV,
--    RENIM_PERS,
--    ORGANE_COND,
--    GEN_INSTITUTIE,
--    IDNO
--)
-- 



SELECT 
 CUIIO,
 491 CUIIO_VERS,
 DENUMIRE,
 EDIT_USER,
 STATUT,
 CUATM,
 CFP,
 CFOJ,
 COCM,
 CAEM,
 BUGET,
 TIP,
 PROD,
 FOR_CUB,
 GENMUZEE,
 TIPMUZEE,
 TIP_LOCAL,
 TIP_INST,-------------------------------------------------------------
 CAEM2,
 N85_NTL,
 N85_NTIIP,
 N85_NDIIP,
 N85_NPDS,
 N85_NRIIP,
 N85_NSIIP,
 GENMUZEE2,
 NFI,
 NTII,
 NPDS,
 ORGANE,
 TIP_INV,
 RENIM_PERS,
 ORGANE_COND,
 GEN_INSTITUTIE,
 IDNO

   
                    FROM  -- USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                        -- USER_BANCU.VW_MAX_RENIM_CIS2
                    --USER_BANCU.VW_MAX_RENIM_CIS2_2014
                  --  USER_BANCU.VW_MAX_RENIM_299_CIS2
                ----------------------------------------------------------------    
                    WHERE 
         CUIIO IN (
                
         
            SELECT CUIIO 
                FROM USER_BANCU.CUATM_CIS2
 
)                


AND CUIIO_VERS <> 491





AND CUIIO  IN (

SELECT 
 
        TRIM(L.CUIIO) CUIIO
       

        FROM   USER_BANCU.CUATM_CIS2 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =     TRIM(L.CUIIO_VERS) 
                        
                        WHERE
                        
                        C.CUIIO IS  NULL

);










