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
 2015 CUIIO_VERS,
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
            --              USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                          USER_BANCU.VW_MAX_RENIM_CIS2
                      --  USER_BANCU.VW_MAX_RENIM_CIS2_2014
                   --  USER_BANCU.VW_MAX_RENIM_299_CIS2
                ----------------------------------------------------------------    
                    WHERE 
                    1=1 
        

and CUIIO IN (

41996075,
41154235,
37910375,
40749653,
41943713,
41636046,
41996017,
41505887




)

AND CUIIO_VERS <>  2015 

;

