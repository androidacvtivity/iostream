




        SELECT 
        L.CUIIO,
        R.CUIIO R_CUIIO,
        R.CUIIO_VERS,
        L.CUATM
        FROM USER_BANCU.CUATM_CIS2 L LEFT JOIN USER_BANCU.VW_MAX_RENIM_TRIM_CIS2 R ON R.CUIIO = L.CUIIO 
        
        WHERE 
        R.CUIIO IS NOT NULL   
        
        
        GROUP BY 
              L.CUIIO,
        R.CUIIO_VERS,
        L.CUATM,
        R.CUIIO
        
        HAVING 
        
        R.CUIIO_VERS <>  1067
        
        ORDER BY
        
        R.CUIIO_VERS