DECLARE -- ====================================================================

CURSOR C IS

SELECT
               FC.CUIIO,
               FC.CUIIO_VERS,
               R.PROD
               FROM
             (  
               
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (3) AND CUIIO_VERS <= 492
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (3) 
             AND FC.STATUT <> '3' ) FC INNER JOIN USER_BANCU.IDN_TS_PROD R ON R.CUIIO = FC.CUIIO
  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS.RENIM SET
--

PROD = CR.PROD
--DENUMIRE = CR.DENUMIRE
--CUATM = CR.CUATM
--CFP = CR.CFP
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