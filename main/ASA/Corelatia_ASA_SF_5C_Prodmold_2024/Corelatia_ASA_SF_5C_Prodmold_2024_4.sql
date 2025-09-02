
SELECT *
 FROM USER_BANCU.ASA_2024;

INSERT INTO  USER_BANCU.ASA_2024
(

   CUIIO,
    CUIIO_VERS,
    CUATM,
    FULL_CODE,
    CAEM2,
    CAEM_CALC,
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
    RIND_320_COL2,
    RIND_330_COL1,
    RIND_330_COL2,
    RIND_340_COL1,
    RIND_340_COL2,
    RIND_350_COL1,
    RIND_350_COL2
 
 )

  SELECT 
    CUIIO,
    CUIIO_VERS,
    CUATM,
    FULL_CODE,
    CAEM2,
    CAEM_CALC,
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
    RIND_320_COL2,
    RIND_330_COL1,
    RIND_330_COL2,
    RIND_340_COL1,
    RIND_340_COL2,
    RIND_350_COL1,
    RIND_350_COL2

          
           
  FROM  VW_DATA_ALL_ASA_2024 
   --VW_KATALOG_ASA_2023  
  --  L LEFT JOIN VVW_KATALOG_ASA_2024 R ON R.CUIIO = L.CUIIO
    --                AND R.CUIIO_VERS  = L.CUIIO_VERS  
                    
--                    WHERE
--                    R.CUIIO IS NULL
--                    


order by 
FULL_CODE;



select *
FROM  USER_BANCU.ASA_2023;