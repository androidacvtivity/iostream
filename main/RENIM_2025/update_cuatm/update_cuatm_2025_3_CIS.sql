-- INSERT INTO CIS.RENIM (
-- 
-- 
--    CUIIO,
--    CUIIO_VERS,
--    DENUMIRE,
--    EDIT_USER,
--    STATUT,
--    CUATM,
--    CFP,
--    CFOJ,
--    COCM,
--    CAEM,
--    BUGET,
--    TIP,
--    PROD,
--    FOR_CUB,
--    ETAPA_PROD,
--    RENIM_PERS,
--    CAEM2
--)
-- 
--
--

--


SELECT 
    CUIIO,
    1066 CUIIO_VERS,
    DENUMIRE,
    EDIT_USER,
    STATUT,
    CUATM,
    CFP,
    CFOJ,
    COCM,
    CAEM,
    BUGET,
    TIP,
    PROD,
    FOR_CUB,
    ETAPA_PROD,
    RENIM_PERS,
    CAEM2

       
                    FROM   -- USER_BANCU.VW_MAX_RENIM_CIS
                           USER_BANCU.VW_MAX_RENIM_TRIM_CIS
                     

                          
                    
                    WHERE 
                  
                  
(
                    
                   
CUIIO IN (

SELECT DISTINCT CUIIO
        FROM  USER_BANCU.CUATM_CIS
        



 )
---------------------------------------

AND CUIIO_VERS <>  1066
     
)

--AND 
--
--
--CUIIO NOT IN (
--
--SELECT 
-- DISTINCT CUIIO
-- 
-- FROM    VW_MAX_RENIM_CIS_2013
-- 
--    --    USER_BANCU.VW_MAX_RENIM_CIS2
--                    
-- 
--                    
--                    WHERE 
--                  
--                  
--
--                    
--                   
--CUIIO IN (
--
-- SELECT
-- DISTINCT  CUIIO
--        FROM  USER_BANCU.AGRO_24
--
--          )
--
--        
--        AND 
--        
--        
--        CUIIO_VERS  =  2013 
--
--)

ORDER BY 

CUIIO;