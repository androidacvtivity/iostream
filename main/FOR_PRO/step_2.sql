 SELECT 
 
        L.CUIIO
--        C.CUIIO
--        L.CUIIO_VERS,
--        L.DENUMIRE,
--        L.CUATM,
--        L.CFP,
--        L.CFOJ,
--        L.CAEM2
        FROM USER_BANCU.ADD_NEW_SU L
        
        
                       LEFT JOIN CIS2.X_RENIM_IMPORT C ON C.CUIIO  =  L.CUIIO 
                        
                    --   LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  L.CAEM2
                        
--                        WHERE 
--                        
--                        C.CODUL IS NOT NULL 