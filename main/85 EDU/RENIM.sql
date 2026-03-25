CREATE TABLE USER_BANCU.RENIM_85
(
  CUIIO           NUMBER                        ,
  CUIIO_VERS      NUMBER                        ,
  DENUMIRE        VARCHAR2(255 BYTE),
  CUATM           VARCHAR2(7 BYTE),
  CFP             VARCHAR2(2 BYTE),
 
  COCM            VARCHAR2(4 BYTE),

  N85_NTL         VARCHAR2(2 BYTE),
  N85_NTIIP       VARCHAR2(2 BYTE),
  N85_NDIIP       VARCHAR2(2 BYTE),
  N85_NPDS        VARCHAR2(2 BYTE),
  N85_NRIIP       VARCHAR2(2 BYTE),
  N85_NSIIP       VARCHAR2(2 BYTE)
)
TABLESPACE TBS_DTI_USERS
PCTUSED    0
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
NOCACHE
MONITORING;
