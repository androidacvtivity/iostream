--This is table in Oracle
CREATE TABLE CIS2.RENIM
(
  CUIIO           NUMBER                        NOT NULL,
  CUIIO_VERS      NUMBER                        NOT NULL,
  DENUMIRE        VARCHAR2(255 BYTE),
  EDIT_USER       NUMBER                        NOT NULL,
  STATUT          VARCHAR2(1 BYTE)              NOT NULL,
  CUATM           VARCHAR2(7 BYTE)              NOT NULL,
  CFP             VARCHAR2(2 BYTE),
  CFOJ            VARCHAR2(3 BYTE),
  COCM            VARCHAR2(4 BYTE),
  CAEM            VARCHAR2(6 BYTE),
  BUGET           VARCHAR2(1 BYTE)              DEFAULT 0                     NOT NULL,
  TIP             VARCHAR2(2 BYTE)              DEFAULT 0                     NOT NULL,
  PROD            VARCHAR2(2 BYTE),
  FOR_CUB         VARCHAR2(2 BYTE),
  GENMUZEE        VARCHAR2(2 BYTE),
  TIPMUZEE        VARCHAR2(2 BYTE),
  TIP_LOCAL       VARCHAR2(2 BYTE),
  TIP_INST        NUMBER,
  CAEM2           VARCHAR2(6 BYTE),
  N85_NTL         VARCHAR2(2 BYTE),
  N85_NTIIP       VARCHAR2(2 BYTE),
  N85_NDIIP       VARCHAR2(2 BYTE),
  N85_NPDS        VARCHAR2(2 BYTE),
  N85_NRIIP       VARCHAR2(2 BYTE),
  N85_NSIIP       VARCHAR2(2 BYTE),
  GENMUZEE2       VARCHAR2(2 BYTE),
  NFI             NUMBER,
  NTII            NUMBER,
  NPDS            NUMBER,
  ORGANE          VARCHAR2(5 BYTE),
  TIP_INV         VARCHAR2(2 BYTE),
  RENIM_PERS      NUMBER,
  ORGANE_COND     VARCHAR2(8 BYTE),
  GEN_INSTITUTIE  VARCHAR2(1 BYTE),
  IDNO            VARCHAR2(13 BYTE),
  ADDRESS1        VARCHAR2(500 BYTE)
)
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


CREATE UNIQUE INDEX CIS2.PK_RENIM ON CIS2.RENIM
(CUIIO, CUIIO_VERS)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );
           
 

--This is update           
DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
 
        SELECT 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.IDNO
        
        FROM USER_BANCU.FR L
        
        
--        WHERE 
--        
--            L.CUIIO = 4130138667
          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
        CAEM2 = CR.CAEM2,
        DENUMIRE = CR.DENUMIRE,
        CUATM = CR.CUATM,
        CFP = CR.CFP,
        CFOJ = CR.CFOJ,
        IDNO = CR.IDNO
 --     
  --  ETAPA_PROD = CR.ETAPA_PROD
    
    
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


--It is good update ?