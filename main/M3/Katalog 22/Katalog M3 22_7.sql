--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)
--



--SELECT 
--        L.CUIIO,
--        2011 CUIIO_VERS,
--        3  FORM,
--        2000    FORM_VERS,
--        '1' STATUT
--        
--        FROM 

--
--(

SELECT     R.CUIIO,
           R.CUIIO_VERS,
           R.CFP
          
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
               
               
               
               WHERE 
               R.CUIIO IN (
                SELECT CUIIO
        FROM USER_BANCU.ADD_NEW_SU_M3_CFP
               
)
               
AND             R.CUIIO_VERS =    2011
