DECLARE -- ====================================================================

CURSOR C IS

 SELECT TRIM(CUIIO) CUIIO,
                   TRIM(CUIIO_VERS) CUIIO_VERS,
                  
                   TRIM(CAEM2) CAEM2
              FROM     KATALOG_45_1065 
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET
--
--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM
---CFP = CR.CFP
--CFOJ = CR.CFOJ,
CAEM2 = CR.CAEM2
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------