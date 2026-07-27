DECLARE -- ====================================================================

CURSOR C IS
         
                      SELECT 
                        L.CUIIO,
                        L.CUIIO_VERS,
                        R.CAEM2
                        FROM BSC_1068 L LEFT JOIN ASC_25 R ON R.CUIIO = L.CUIIO

            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET
--
--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM
--CFP = CR.CFP,
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