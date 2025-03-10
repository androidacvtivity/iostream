CREATE OR REPLACE FORCE VIEW  VVW_KATALOG_ASA_2023
(

    CUIIO, -- 15481 - 15481 
    CUIIO_VERS,
    IDNO,
    CUATM,
    FULL_CODE, 
    CAEM2,
    caem_calc,
    CAP_SR_1,
    CAP_SR_2,
    CAP_SR_3,
    CAP_SR_4,
    CAP_SR_5,
    CAP_SR_6,
    CAP_SR_7,
    RIND_400_COL2,
    RIND_150_COL1,
    RIND_160,
    RIND_200,
    RIND_210,
    RIND_220,
    RIND_240,
    RIND_260,
    RIND_270,
    RIND_280,
    RIND_290,
    RIND_296,
    RIND_320_COL1,
    RIND_320_COL2
 
 )
AS 



  SELECT 
    L.CUIIO, -- 15481 - 15481 
    L.CUIIO_VERS,
    L.IDNO,
    L.CUATM,
    L.FULL_CODE, 
    L.CAEM2,
    R.caem_calc,
    R.CAP_SR_1,
    R.CAP_SR_2,
    R.CAP_SR_3,
    R.CAP_SR_4,
    R.CAP_SR_5,
    R.CAP_SR_6,
    R.CAP_SR_7,
    R.RIND_400_COL2,
    R.RIND_150_COL1,
    R.RIND_160,
    R.RIND_200,
    R.RIND_210,
    R.RIND_220,
    R.RIND_240,
    R.RIND_260,
    R.RIND_270,
    R.RIND_280,
    R.RIND_290,
    R.RIND_296,
    R.RIND_320_COL1,
    R.RIND_320_COL2

          
           
  FROM VW_KATALOG_ASA_2023 L LEFT JOIN VVW_KATALOG_ASA_2023 R ON R.CUIIO = L.CUIIO
                    AND R.CUIIO_VERS  = L.CUIIO_VERS  
                    
--                    WHERE
--                    R.CUIIO IS NULL
--                    


order by 
L.FULL_CODE