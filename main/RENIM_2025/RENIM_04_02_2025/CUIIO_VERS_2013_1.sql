------------------------------------------------------
--
--INSERT INTO CIS2.RENIM (
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
--)
 



SELECT 
 1065 CUIIO,
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
 TIP_INST,-------------------------------------------------------------
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

   
                    FROM USER_BANCU.VW_MAX_RENIM_TRIM_CIS2     
                    --USER_BANCU.VW_MAX_RENIM_CIS2
                 --   USER_BANCU.VW_MAX_RENIM_CIS2_2013
                ----------------------------------------------------------------    
                    WHERE 
                  
--CUIIO IN (
--40526373,
--40709062,
--40878600,
--40995665,
--41044564,
--41089779,
--41140351,
--41217065,
--41556821,
--41584289,
--41650678,
--41675187,
--41797832,
--41797981,
--41814938
--)

AND CUIIO_VERS  <> 1065
        
--        AND CUIIO_VERS <> 1065
        
        
--        AND CUIIO NOT IN (
----        SELECT FC.CUIIO
--
--              FROM
--              ( 
--              SELECT FC.CUIIO,
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
--              FROM CIS2.FORM_CUIIO  FC
--                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
--                                   FROM CIS2.FORM_CUIIO
--                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
--                                  
--                               GROUP BY CUIIO) BB
--                       ON (    BB.CUIIO = FC.CUIIO
--                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
--             WHERE 
--             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
--             and FC.FORM_VERS = 1004
--             ) FC
--             
--             
--             WHERE
--             
--             FC.CUIIO IN (
--            SELECT
--               DISTINCT  CUIIO
--            FROM  USER_BANCU.ADD_NEW_SU_M3_2024
--
--          )
--
--        AND FC.CUIIO_VERS =  1064
--        
--             
--        )