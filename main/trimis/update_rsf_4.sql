DECLARE -- ====================================================================
CURSOR C IS
--------------------------------
 SELECT 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.IDNO
        
        FROM  USER_BANCU.IDNO L 
           LEFT JOIN ADD_NEW_SU_M3_2024 R 
        
        ON L.CUIIO =   R.CUIIO
        
            WHERE
        R.CUIIO IS    NULL 
------------------------------------------------
          ;
---------------------------
BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET

DENUMIRE = CR.DENUMIRE,
CUATM = CR.CUATM,
CFP = CR.CFP,
CFOJ = CR.CFOJ,
CAEM2 = CR.CAEM2,
IDNO = CR.IDNO


WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS 
;
END LOOP;
END;

---------------------------












