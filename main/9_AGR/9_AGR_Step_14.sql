----Last check 
   SELECT 
          D.CUIIO D_CUIIO,
          R.CUIIO R_CUIIO
          
                
  FROM USER_BANCU.VW_KATALOG_29_AGRO_TRIM_4_22 D RIGHT   JOIN (
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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
             
             
             
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)



  ) R ON D.CUIIO = R.CUIIO 
  
  WHERE
   
  1=1
  
  AND R.CUIIO IS  NULL 
  
  
--  AND R.CUIIO IN (
--  
--  41189162,
--41313923,
--41031544,
--36742714,
--31298717,
--501029700
--  )
--  
  
  ORDER BY 
  R.CUIIO DESC 