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
 1068 CUIIO_VERS,
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

   
                    FROM   -- USER_BANCU.VW_MAX_RENIM_CIS2_1067  
                        USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                         --USER_BANCU.VW_MAX_RENIM_CIS2
                    --  USER_BANCU.VW_MAX_RENIM_CIS2
                  --  USER_BANCU.VW_MAX_RENIM_299_CIS2
                ----------------------------------------------------------------    
                    WHERE 
         CUIIO IN (
        
   41647021,
40933552,
40991696,
41170903,
40933167,
38926473,
41019849,
40080188,
40414562,
41753757,
40882799,
2925707,
3135692,
38290456,
40109095,
2049007,
41581061,
41068027,
40197923,
37561667,
41576108,
41353957,
40736165,
40075054,
38284158,
5916034,
40995978,
1846756,
41264969,
41070225,
41382396,
1845544,
40975384,
1843835,
41210525,
40797824,
40218186
--
         )
         
         
     --    AND CUIIO_VERS <>  1068