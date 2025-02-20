SELECT 
  ROWNUM NR,
  CUIIO,
  CUIIO_VERS,
  DENUMIRE,
  CAEM2
FROM 

(
SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  R.DENUMIRE,
  R.CAEM2,
  C.FULL_CODE
  
FROM 
  VW_DATA_ALL D INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                INNER JOIN CIS2.RENIM  R  ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
 
WHERE
  D.PERIOADA IN (2013) AND 


  D.FORM IN (27)    
 
GROUP BY
  D.CUIIO,
  R.CAEM2,
  D.CUIIO_VERS,
  R.DENUMIRE,
  C.FULL_CODE
  
ORDER BY
C.FULL_CODE )