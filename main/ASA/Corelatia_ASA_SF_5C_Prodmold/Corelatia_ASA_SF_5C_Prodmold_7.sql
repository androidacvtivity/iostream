CREATE TABLE USER_BANCU.ASA_2023
(
  CUIIO       NUMBER,
  CUIIO_VERS  NUMBER,
  IDNO        VARCHAR2(1024 BYTE),
  PERS        VARCHAR2(1024 BYTE),
  TIP         VARCHAR2(1024 BYTE),
  BUGET       VARCHAR2(1024 BYTE),
  CUATM       VARCHAR2(1024 BYTE),
  FULL_CODE   VARCHAR2(1024 BYTE), 
  CAEM2       VARCHAR2(1024 BYTE),
  caem_calc   VARCHAR2(1024 BYTE),
  CAP_SR_1    NUMBER,
    CAP_SR_2 NUMBER,
    CAP_SR_3 NUMBER,
    CAP_SR_4 NUMBER,
    CAP_SR_5 NUMBER,
    CAP_SR_6 NUMBER,
    CAP_SR_7 NUMBER,
    RIND_400_COL2 NUMBER,
    RIND_150_COL1 NUMBER,
    RIND_160 NUMBER,
    RIND_200 NUMBER,
    RIND_210 NUMBER,
    RIND_220 NUMBER,
    RIND_240 NUMBER,
    RIND_260 NUMBER,
    RIND_270 NUMBER,
    RIND_280 NUMBER,
    RIND_290 NUMBER,
    RIND_296 NUMBER,
    RIND_320_COL1 NUMBER,
    RIND_320_COL2 NUMBER
  
  )
TABLESPACE TBS_DTI_USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE;