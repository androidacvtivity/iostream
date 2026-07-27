SELECT 
    DISTINCT 
       D.CUIIO,
       R.DENUMIRE,
       R.CUATM,
       R.CAEM2,
       R.CFP,
       R.CFOJ
FROM CIS2.VW_DATA_ALL D INNER JOIN 
            CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
WHERE
  (D.PERIOADA = 2014) AND 
  (D.FORM = 64 ) AND
  (D.FORM_VERS = 2000)  
 GROUP BY 
       D.CUIIO,
       R.DENUMIRE,
       R.CUATM,
       R.CAEM2,
       R.CFP,
       R.CFOJ 
  
   
   