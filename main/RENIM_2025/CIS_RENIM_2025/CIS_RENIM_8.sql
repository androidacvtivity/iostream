DECLARE -- ====================================================================

CURSOR C IS

 SELECT DISTINCT  
 CUIIO 
        FROM USER_BANCU.RENIM_AGR
  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS.RENIM SET
--

-- PROD = CR.PROD
--DENUMIRE = CR.DENUMIRE
--CUATM = CR.CUATM
CFP = CR.CFP
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