
---------------------------------------------------------------------------

SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
          R.IDNO

           
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (44) AND 
                                  --FORM_VERS = 2009 AND 
                                  CUIIO_VERS <= 1061
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (44) 
             AND FC.STATUT <> '3'
           --  AND FC.FORM_VERS = 2009
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               WHERE
               1=1
   
               
               
             --  AND     R.IDNO IS NULL 
               


--Pentru  perioada - 2012 sa pun in form_cuiio CUIIO_VERS - 2012 pentr rsf1, 2, 3, Prescurtat Da. ? Ca acum nu mai 4287  sunt cu cuiio_VERS = 2012
