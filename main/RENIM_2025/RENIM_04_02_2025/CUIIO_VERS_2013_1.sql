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




SELECT 
 CUIIO,
 1069 CUIIO_VERS,
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

   
                    FROM  --USER_BANCU.VW_MAX_RENIM_CIS2_1067  
                            USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                        --  USER_BANCU.VW_MAX_RENIM_CIS2
                      --  USER_BANCU.VW_MAX_RENIM_CIS2_2014
                   --  USER_BANCU.VW_MAX_RENIM_299_CIS2
                ----------------------------------------------------------------    
                    WHERE 
                    1=1 
        

and CUIIO IN (

    SELECT DISTINCT  CUIIO 
        FROM USER_BANCU.RENIM_AGR

)

AND CUIIO_VERS <>  1069 

AND CUIIO NOT IN (
40079939,
40580326,
40789316,
40833916,
41547472

)


