--Review this code
---------------------------------------------------------------------------------
------------------------------------------------------------------------------
SELECT     R.CUIIO,
           R.CUIIO_VERS,
           R.CAEM2,
           R.idno 
          
      FROM (
      
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) 
--               
--               
               where
               1=1
             --  R.CUIIO_VERS = 2014
            AND   R.CAEM2 LIKE 'B%' 
--              or  
--               R.idno is null 
               ----------------------------------------------------------------------
               ---------------------------------------------------------------------
               
               -------------------------------`--------------------------------------
               
               