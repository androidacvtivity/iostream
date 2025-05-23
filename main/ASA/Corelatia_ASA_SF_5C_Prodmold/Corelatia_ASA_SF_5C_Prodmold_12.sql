--CREATE OR REPLACE FORCE VIEW  VW_SQL_ASA_2023
--(
--
--CUIIO,
--    CUATM,
--    FULL_CODE,
--    CAEM2,
--    CAEM_CALC,
--    CAEM2_SF,
--    CAEM2_5C,
--    CAEM2_M3,
--    CAEM2_PRODMOLD,
--    CAP_SR_1,
--    CAP_SR_2,
--    CAP_SR_3,
--    CAP_SR_4,
--    CAP_SR_5,
--    CAP_SR_6,
--    CAP_SR_7,
--    RIND_400_COL2,
--    NMP,
--    M3_00_T_COL2,
--    RIND_150_COL1,
--    VZ,
--    PRDOMOLD_R10,
--    RIND_0100,
--    RIND_160,
--    RIND_0180,
--    RIND_200,
--    RIND_0190,
--    RIND_210,
--    RIND_2000,
--    RIND_220,
--    RIND_3000,
--    RIND_240,
--    RIND_5000,
--    RIND_260,
--    RIND_7000,
--    RIND_270,
--    RIND_8000,
--    RIND_280,
--    RIND_9000,
--    RIND_290,
--    RIND_1000,
--    RIND_296,
--    RIND_1010,
--    RIND_320_COL1,
--    RIND_320_COL2,
--    CAP_1_R_2000_1
-- 
-- )
--AS 


SELECT
    DISTINCT L.CUIIO,
    L.CUATM,
    L.FULL_CODE,
    L.CAEM2,
    L.caem_calc,
    RR.CAEM2 CAEM2_SF,
    R.CAEM2 CAEM2_5C, 
    M.caem2 CAEM2_m3,
    p.caem2 CAEM2_PRODMOLD,
    L.CAP_SR_1,
    L.CAP_SR_2,
    L.CAP_SR_3,
    L.CAP_SR_4,
    L.CAP_SR_5,
    L.CAP_SR_6,
    L.CAP_SR_7,
    L.RIND_400_COL2,
    RR.NMP,
    M.M3_00_T_COL2,
    L.RIND_150_COL1,
    RR.vz,
    P.PRDOMOLD_R10,
    R.RIND_0100,
    L.RIND_160,
    R.RIND_0180,
    L.RIND_200,
    R.RIND_0190,
    L.RIND_210,
    R.RIND_2000,
    L.RIND_220,
    R.RIND_3000,
    L.RIND_240,
    R.RIND_5000,
    L.RIND_260,
    R.RIND_7000,
    L.RIND_270,
    R.RIND_8000,
    L.RIND_280,
    R.RIND_9000,
    L.RIND_290,
    R.RIND_1000,
    L.RIND_296,
    R.RIND_1010,
    L.RIND_320_COL1,
    L.RIND_320_COL2,
    R.CAP_1_R_2000_1
            FROM ASA_2023  L 
            LEFT jOIN VVW_KATALOG_5_C_2023 R on R.CUIIO = L.CUIIO  --15539 
                                                                   --15481    
                                                                   --15521
            LEFT jOIN VVW_KATALOG_M3_2023 M on M.CUIIO = L.CUIIO
            LEFT jOIN VVW_KATALOG_PRODMOLD_2023 p on P.CUIIO = L.CUIIO
            
            LEFT jOIN  VVW_KATALOG_RSF_23 rr oN RR.CUIIO = L.CUIIO
            
            order BY
            L.FULL_CODE,
            L.cuiio