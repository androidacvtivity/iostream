--            UPDATE  CIS2.FORM_CUIIO 
--
--            SET STATUT = '3'

--             SELECT *
--            FROM CIS2.FORM_CUIIO  FC
--            
--            WHERE 
--            FORM = 13
--            AND CUIIO_VERS = 2014
--            AND FORM_VERS = 2000
--            AND STATUT = '1'
--            AND CUIIO IN (
            
            SELECT FC.CUIIO
      
             FROM
              ( 
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (18) AND CUIIO_VERS <= 1068
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (18) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 1004
             ) FC
             
             
             WHERE
             
             FC.CUIIO IN (
             
             SELECT CUIIO 
             
                FROM USER_BANCU.MEICO
             )
             
--             AND CUIIO_VERS =  2014
--            ) 