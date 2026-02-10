DECLARE -- ====================================================================

CURSOR C IS

 SELECT 
         TRIM(L.CUIIO) CUIIO,
        L.CUIIO_VERS,
     --   TRIM(L.DENUMIRE)  DENUMIRE
         TRIM(L.CUATM) CUATM
--        TRIM(L.CFP) CFP,
--        TRIM(L.CFOJ) CFOJ,
--        TRIM(L.CAEM2)  CAEM2,
--        TRIM(L.IDNO)   IDNO
        FROM   USER_BANCU.CUATM_CIS_10 L
  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
--UPDATE CIS2.RENIM SET
--
--DENUMIRE = CR.DENUMIRE -- Din care tabel este CR  
CUATM = CR.CUATM
--CFP = CR.CFP,
--CFOJ = CR.CFOJ,
--CAEM2 = CR.CAEM2,
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS IN (1067,1068); 
END LOOP;
END;

---------------------------


UPDATE CIS.RENIM r
SET r.CUATM = (
  SELECT TRIM(l.CUATM)
  FROM USER_BANCU.CUATM_CIS_2014 l
  WHERE TRIM(l.CUIIO) = r.CUIIO
    AND l.CUIIO_VERS  = 2014
)
WHERE r.CUIIO_VERS IN (2014,2015)
  AND EXISTS (
    SELECT 1
    FROM USER_BANCU.CUATM_CIS_2014 l
    WHERE TRIM(l.CUIIO) = r.CUIIO
      AND l.CUIIO_VERS  = 2014
  );


 SELECT 
         TRIM(L.CUIIO) CUIIO,
         L.CUIIO_VERS,
        TRIM(L.CUATM) CUATM

        FROM   USER_BANCU.CUATM_CIS_2014 L;
        
        
        
        
        
        
        
        CREATE TABLE USER_BANCU.CUATM_CIS_2014
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