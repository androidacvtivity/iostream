DECLARE -- ====================================================================

CURSOR C IS

 

SELECT 
DISTINCT CUIIO,
1064 AS CUIIO_VERS,
MAX(CAEM2) AS CAEM2 

FROM CIS2.RENIM

WHERE

CUIIO IN (

SELECT FC.CUIIO
              FROM(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (18) AND CUIIO_VERS <= 1065
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (18) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 1004 
             
             ) FC INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO  AND R.CUIIO_VERS = FC.CUIIO_VERS
             
             
             WHERE
               1=1
               
               AND R.CAEM2 IS  NULL 
       
               AND FC.CUIIO_VERS = 1064
               
           
               )
               
               AND CUIIO_VERS < 1064
               
               
               GROUP BY
               CUIIO
  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET
--
--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM
--CFP = CR.CFP
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