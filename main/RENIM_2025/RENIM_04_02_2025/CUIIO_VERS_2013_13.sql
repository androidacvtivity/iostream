DECLARE -- ====================================================================

CURSOR C IS

 SELECT 
         CUIIO,
         CUIIO_VERS,
         DENUMIRE,
         CUATM,
         CFP,
         COCM,
         N85_NTL,
         N85_NTIIP,
         N85_NDIIP,
         N85_NPDS,
         N85_NRIIP,
         N85_NSIIP  
        FROM   USER_BANCU.RENIM_85 L
  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET
--
DENUMIRE = CR.DENUMIRE,  
CUATM = CR.CUATM,
CFP = CR.CFP,
COCM = CR.COCM,
N85_NTL = CR.N85_NTL,
N85_NTIIP  =  CR.N85_NTIIP,
         N85_NDIIP = CR.N85_NDIIP,
         N85_NPDS =  CR.N85_NPDS,
         N85_NRIIP = CR.N85_NRIIP,
         N85_NSIIP = CR.N85_NSIIP 

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS =  CR.CUIIO_VERS; 
END LOOP;
END;

---------------------------


UPDATE CIS.RENIM r
SET r.CUATM = (
  SELECT TRIM(l.CUATM)
  FROM USER_BANCU.CUATM_CIS_491 l
  WHERE TRIM(l.CUIIO) = r.CUIIO
    AND l.CUIIO_VERS  = 491
)
WHERE r.CUIIO_VERS IN (491,492)
  AND EXISTS (
    SELECT 1
    FROM USER_BANCU.CUATM_CIS_2014 l
    WHERE TRIM(l.CUIIO) = r.CUIIO
      AND l.CUIIO_VERS  = 491
  );


 SELECT 
         TRIM(L.CUIIO) CUIIO,
         L.CUIIO_VERS,
        TRIM(L.CUATM) CUATM

        FROM   USER_BANCU.CUATM_CIS_2014 L;
        
        
        
        
        
        
        
        CREATE TABLE USER_BANCU.CUATM_CIS_491
(
  CUIIO       NUMBER,
  CUIIO_VERS  NUMBER,
  DENUMIRE    VARCHAR2(1024 BYTE),
  CUATM       VARCHAR2(1024 BYTE),
  CFP         VARCHAR2(1024 BYTE),
  CFOJ        VARCHAR2(1024 BYTE),
  COCM        VARCHAR2(1024 BYTE),
  CAEM2       VARCHAR2(1024 BYTE),
  CAEM        VARCHAR2(1024 BYTE),
  IDNO        VARCHAR2(1024 BYTE)
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