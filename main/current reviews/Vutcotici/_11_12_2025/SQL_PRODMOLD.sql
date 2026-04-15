
SELECT 
DISTINCT L.CUIIO
FROM 
(

SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS.VW_DATA_ALL D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_LUNA AND D.FORM IN (:pFORM) ) L LEFT JOIN (
           
           SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA_LUNA  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
                        
  
           ) R ON R.CUIIO = L.CUIIO 
           
           
           WHERE 
           
           R.CUIIO IS NULL;
           
           
           

CUIIO IN (
40797540,
40189481,
40524322,
41414676,
40190714,
40317340,
20416205,
37674035,
3399468,
40191754
40450244,
38186504,
40618359,
41257969,
38743821
40068501
)

          