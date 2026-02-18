

--INSERT INTO CIS2.FORM_CUIIO  (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)

SELECT 
L.CUIIO,
L.CUIIO_VERS,
63 FORM,
2000 FORM_VERS,
'1' STATUT
FROM
(
SELECT L.CUIIO,
       R.CUIIO R_CUIIO,
       R.CUIIO_VERS CUIIO_VERS  
   FROM USER_BANCU.R_2014_LIPS L  LEFT JOIN USER_BANCU.VW_MAX_RENIM_CIS2 R ON R.CUIIO = L.CUIIO 
   
        WHERE 
        
            R.CUIIO IS NOT NULL
            AND  
            R.CUIIO_VERS = 2014 ) L LEFT JOIN (
            SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (57) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (57) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2009
            )  R ON R.CUIIO = L.CUIIO 
            
            
            WHERE 
            
            R.CUIIO IS NULL;
            
            
            
            
            
            
            
            ;
            
            
            
          SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
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
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             AND FC.FORM_VERS IN (:pFORM_VERS) ) FC
             
             
             WHERE 
             
             FC.CUIIO IN (
  
      
SELECT CUIIO
      
   FROM LICHIDARE

             )
            