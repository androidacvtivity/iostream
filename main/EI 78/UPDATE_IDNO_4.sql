DECLARE -- ====================================================================

  CURSOR C IS
        

SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
          l.CAEM2,
          R.IDNO

           
           
      FROM


(
SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
          R.CAEM2,
          R.IDNO

           
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (18) AND 
                                  --FORM_VERS = 2009 AND 
                                  CUIIO_VERS <= 1061
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (18) 
             AND FC.STATUT <> '3'
           --  AND FC.FORM_VERS = 2009
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               WHERE
               1=1
   
               
               
               AND     R.CUIIO in (
               
               SELECT 
          R.CUIIO
--          R.CUIIO_VERS,
--          R.CAEM2,
--          R.IDNO
          
          from IDNO R
               )  )  r LEFT jOIN (
               
               SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
          R.CAEM2,
          R.IDNO
          
          from IDNO R
               )  l ON l.CUIIO = r.CUIIO 

         
     
;
       
       
       
          
BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
       CAEM2 = CR.CAEM2
--      DENUMIRE = CR.DENUMIRE,
--      CUATM = CR.CUATM,
--      CFP = CR.CFP,
--      CFOJ = CR.CFOJ,
   --   IDNO = CR.IDNO
      
    WHERE 
      CUIIO  = CR.CUIIO 
      
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================