

SELECT   
         L.CUIIO       
             FROM (
SELECT     R.CUIIO,
           R.CUIIO_VERS
        
      FROM (
         
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (44) AND CUIIO_VERS <= 1064
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (44) 
             AND FC.STATUT <> '3'
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               RIGHT    JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.ADD_NEW_SU_M3_2024
               ) L ON L.CUIIO = R.CUIIO
               WHERE 
               R.CUIIO IS NOT NULL               
