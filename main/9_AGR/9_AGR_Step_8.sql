----Statistical units that are not in the old catalog and must be blocked.
   SELECT 
          D.CUIIO D_CUIIO,
          R.CUIIO R_CUIIO
          
                
  FROM USER_BANCU.VW_KATALOG_29_AGRO_TRIM_4_23 D RIGHT   JOIN (
     SELECT     R.CUIIO,
           R.CUIIO_VERS
          
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (39) AND CUIIO_VERS <= 2012
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (39) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)



  ) R ON D.CUIIO = R.CUIIO 
  
  WHERE 
  D.CUIIO IS NULL 


                  
                     