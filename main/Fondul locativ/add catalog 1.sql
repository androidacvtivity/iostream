--INSERT INTO M53.RENIM 
--(
--
--
--CUIIO,
--    CUIIO_VERS,
--    DENUMIRE,
--    EDIT_USER,
--    STATUT,
--    CUATM,
--    CFP,
--    CFOJ,
--    CAEM,
--    COCM,
--    LANG,
--    SPEC,
--    TIP_INV,
--    TIP_INV_DEG,
--    TIP_LOCAL,
--    CUATM4,
--    CFP1,
--    AP_BUGET,
--    CAEM2
--)
-- 
SELECT 
    
    CUIIO,
    314 CUIIO_VERS,
    DENUMIRE,
    EDIT_USER,
    STATUT,
    CUATM,
    CFP,
    CFOJ,
    CAEM,
    COCM,
    LANG,
    SPEC,
    TIP_INV,
    TIP_INV_DEG,
    TIP_LOCAL,
    CUATM4,
    CFP1,
    AP_BUGET,
    CAEM2


            FROM 
        --    M53.RENIM
            USER_BANCU.VW_MAX_RENIM_M53
            
            WHERE 
            
            CUIIO IN (
320293168,
38182274,
13557,
493864,
38976318,
2730352,
38998923,
2562529,
3135290,
2167632,
3210494,
20319583,
3597760,
5910037,
1846809,
3399652,
3597563
)

 AND CUIIO_VERS <> 314  