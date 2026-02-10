DECLARE -- ====================================================================

CURSOR C IS

  
 
           SELECT 
                   R.CUIIO,
                   R.CUIIO_VERS,
                   L.DENUMIRE,
                   L.CUATM,
                   L.CFP,
                   L.CFOJ,
                   L.CAEM2
                   FROM  VW_DATA_ALL_491 R LEFT JOIN  VW_DATA_ALL_490 L ON L.CUIIO = R.CUIIO 
                   
                   WHERE 
                   L.CUIIO IS NOT NULL;
  
 
            
            --------------------------------
            

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS.RENIM SET
--
DENUMIRE = CR.DENUMIRE,
CUATM = CR.CUATM,
CFP = CR.CFP,
CFOJ = CR.CFOJ,
CAEM2 = CR.CAEM2
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------