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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) 
               LEFT JOIN (
               SELECT  
DISTINCT D.CUIIO
FROM 
  CIS2.VW_DATA_ALL D
WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND

  D.FORM = 40 
  AND D.CAPITOL IN 1032 
  --AND
  --D.RIND IN ('19') 
GROUP BY
D.CUIIO
               ) L ON L.CUIIO = FC.CUIIO
               
               
               WHERE 
               L.CUIIO IS NULL  
               