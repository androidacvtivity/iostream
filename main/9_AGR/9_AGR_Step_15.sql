   --Those that are in the new catalog but are not in the old catalog must be inserted.
   SELECT 
          D.CUIIO D_CUIIO
 
          
                
  FROM USER_BANCU.VW_KATALOG_29_AGRO_TRIM_4_22 D 
  
  LEFT JOIN

(

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
             
             
) R ON D.CUIIO = R.CUIIO 


WHERE 

R.CUIIO IS NULL 