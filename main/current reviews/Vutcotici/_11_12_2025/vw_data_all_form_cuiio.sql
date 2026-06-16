SELECT 
distinct L.CUIIO 
FROM (

SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          R.CUATM,
                          D.FORM
            FROM CIS2.DATA_ALL D
             
                  INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
           WHERE D.PERIOADA = :pPERIOADA_LUNA AND D.FORM IN (:pFORM)
          --  AND D.DATA_REG  < TO_DATE('04/01/2026 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
           
             AND D.FORM_VERS IN (:pFORM_VERS) ) L   LEFT JOIN (
             SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA_LUNA  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS IN (:pFORM_VERS) 
             ) R ON R.CUIIO = L.CUIIO 
             
             WHERE 
             
             R.CUIIO IS NULL 