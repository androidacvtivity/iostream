DECLARE -- ====================================================================

CURSOR C IS

  SELECT
  
  CUIIO,
  CUIIO_VERS,
  CUATM
  FROM USER_BANCU.AGRO_24
  
--  WHERE
--  CUIIO IS NOT NULL 
  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS.RENIM SET
--
--DENUMIRE = CR.DENUMIRE,
CUATM = CR.CUATM
--CFP = CR.CFP,
--CFOJ = CR.CFOJ,
--CAEM2 = CR.CAEM2,
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------