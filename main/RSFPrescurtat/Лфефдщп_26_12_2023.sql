--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)



SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
--           57 FORM,
--           2009 FORM_VERS,
--           '1' STATUT 

           R.IDNO
--           
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND 
                                  FORM_VERS = 2000 AND 
                                  CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               WHERE
               1=1
           --    and   R.cuiio_vers <>  2011 
               
               
               AND     R.IDNO IS  NULL 
               


--Pentru  perioada - 2012 sa pun in form_cuiio CUIIO_VERS - 2012 pentr rsf1, 2, 3, Prescurtat Da. ? Ca acum nu mai 4287  sunt cu cuiio_VERS = 2012
