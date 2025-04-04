-- INSERT INTO CIS2.RENIM (
-- 
-- 
-- CUIIO,
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
--    GENMUZEE,
--    TIPMUZEE,
--    TIP_LOCAL,
--    TIP_INST,
--    CAEM2,
--    N85_NTL,
--    N85_NTIIP,
--    N85_NDIIP,
--    N85_NPDS,
--    N85_NRIIP,
--    N85_NSIIP,
--    GENMUZEE2,
--    NFI,
--    NTII,
--    NPDS,
--    ORGANE,
--    TIP_INV,
--    RENIM_PERS,
--    ORGANE_COND,
--    GEN_INSTITUTIE,
--    IDNO
--
-- 
-- )




SELECT 
    CUIIO,
    CUIIO_VERS,
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
    GENMUZEE,
    TIPMUZEE,
    TIP_LOCAL,
    TIP_INST,
    CAEM2,
    N85_NTL,
    N85_NTIIP,
    N85_NDIIP,
    N85_NPDS,
    N85_NRIIP,
    N85_NSIIP,
    GENMUZEE2,
    NFI,
    NTII,
    NPDS,
    ORGANE,
    TIP_INV,
    RENIM_PERS,
    ORGANE_COND,
    GEN_INSTITUTIE,
    IDNO

                    FROM USER_BANCU.VW_MAX_RENIM_CIS2
                          --USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
                    WHERE 
                    
                    
                    CUIIO IN (
                    
--                          SELECT 
--                          FC.CUIIO
--            
--              FROM CIS2.FORM_CUIIO  FC
--                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
--                                   FROM CIS2.FORM_CUIIO
--                                  WHERE FORM IN (3) AND CUIIO_VERS <= 2011
--                               GROUP BY CUIIO) BB
--                       ON (    BB.CUIIO = FC.CUIIO
--                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
--             WHERE FC.FORM IN (3) AND FC.STATUT <> '3'
             
             
                     SELECT CUIIO
        FROM USER_BANCU.ADD_NEW_SU_M3_2024
                    )
                    
                    AND CUIIO_VERS <>  2013 
                    
                    --CUIIO IN (
           
--        SELECT   
--
--
--  
--         R.CUIIO        
--        -- L.CUIIO  CUIIO
--         
--         FROM (
--
--SELECT     R.CUIIO,
--           R.CUIIO_VERS
--          
--      FROM (SELECT FC.CUIIO,
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
--              FROM CIS2.FORM_CUIIO  FC
--                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
--                                   FROM CIS2.FORM_CUIIO
--                                  WHERE FORM IN (3) AND CUIIO_VERS <= 2011
--                               GROUP BY CUIIO) BB
--                       ON (    BB.CUIIO = FC.CUIIO
--                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
--             WHERE FC.FORM IN (3) AND FC.STATUT <> '3') FC
--           INNER JOIN CIS2.RENIM R
--               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
--               
--               LEFT   JOIN (
--               
--               SELECT CUIIO
--               
--        FROM USER_BANCU.ADD_NEW_SU_TIC
--               ) L ON L.CUIIO = R.CUIIO
--               
--               
--               WHERE 
--               L.CUIIO IS   NULL  
--        
--        ) 
--        
--        AND CUIIO_VERS <>       2011


;


SELECT 
 CUIIO
 FROM    VW_RENIM_2013_CIS2
                    WHERE 
                  
                  

                    
                   
CUIIO IN (

 SELECT
 DISTINCT  CUIIO
        FROM  USER_BANCU.ADD_NEW_SU_M3_2024

          )

        
        AND 
        
        
        CUIIO_VERS  =  2013 