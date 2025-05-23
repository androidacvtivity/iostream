
              SELECT 
                 L.CUIIO,
                 L.CUIIO_VERS,
                 RR.DENUMIRE,
                 RR.CAEM2,
                 RR.CFP,
                 RR.IDNO,
                 L.USER_NAME 
                 FROM    

               ( 
                SELECT DISTINCT D.CUIIO,
                                MAX(CUIIO_VERS) CUIIO_VERS,
                                MAX(D.USER_NAME) USER_NAME
                
                    FROM CIS2.VW_DATA_ALL D 
                    
                    WHERE 
                    D.FORM IN (:pFORM)
                    
                    AND D.PERIOADA IN (:pPERIOADA)
                    
                    GROUP BY
                    D.CUIIO                    

 ) L LEFT JOIN (
                  -----------------------------------  


                    SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
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
                                  WHERE 
                                  FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                 
                                  
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) 
             AND FC.STATUT <> '3'
            
             ) FC
             
                    ) R ON R.CUIIO = L.CUIIO 
                    
                    
                    INNER JOIN CIS2.RENIM RR ON L.CUIIO = RR.CUIIO AND L.CUIIO_VERS = RR.CUIIO_VERS 
                    
                    WHERE 
                    
                    R.CUIIO IS NULL