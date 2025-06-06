--This is table CIS.MD_CONTROL 

CREATE TABLE CIS.MD_CONTROL
(
  CONTROL       VARCHAR2(20 BYTE)               NOT NULL,
  CONTROL_VERS  NUMBER                          NOT NULL,
  FORM          NUMBER,
  FORM_VERS     NUMBER,
  CAPITOL       NUMBER,
  CAPITOL_VERS  NUMBER,
  ID_MD         NUMBER,
  FORMULA       VARCHAR2(1000 BYTE)             NOT NULL,
  SQL_TEXT      CLOB                            NOT NULL,
  PRIORITATEA   VARCHAR2(1 BYTE)                NOT NULL,
  DATA_REG      DATE                            NOT NULL,
  STATUT        VARCHAR2(1 BYTE)
)
LOB (SQL_TEXT) STORE AS BASICFILE (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
TABLESPACE USERS
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



