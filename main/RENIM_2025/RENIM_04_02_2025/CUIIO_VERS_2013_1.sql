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
-- 



SELECT 
 CUIIO,
 2014 CUIIO_VERS,
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

   
                    FROM  --USER_BANCU.VW_MAX_RENIM_CIS2_1067  
                      -- USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                      --   USER_BANCU.VW_MAX_RENIM_CIS2
                       USER_BANCU.VW_MAX_RENIM_CIS2_2014
                   --  USER_BANCU.VW_MAX_RENIM_299_CIS2
                ----------------------------------------------------------------    
                    WHERE 
        
                
CUIIO IN (
38912330,
38800737,
38916960,
38884792,
41776468,
41730160,
41832675,
41832540,
41833114,
41833427,
41832379,
41833580,
41833723,
41832345,
37743931,
41833462,
39082043,
6808157,
41832451,
41832868,
41832534,
41589720,
41834071,
41832994,
39077195,
41726967,
41774854,
41833108,
41833611,
41833930,
41730638,
41727518,
41832818,
38903164,
40021006,
38422519,
38325940,
37687523,
38983710,
40130184,
38971054,
38954558,
40052426,
38403812,
38644800,
38898721,
37958100,
37826025,
38585492,
3943676,
38951873,
37702398,
38395314,
38343808,
38644088,
38403901,
3944121,
37421334,
38912100,
38470599,
37439898,
2741485,
37368628,
38918338,
40572835,
20280556,
37477435,
38546687,
37522408,
40067497,
5915052,
38973834,
38968614,
37364062,
38865197,
38900344,
38937011,
38934260,
40971452,
41021540,
41587655
)

AND CUIIO_VERS =  2014

            



;





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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
             
             
             WHERE 
             
             FC.CUIIO_VERS <> 1068;
             
             
             
             
             --SQL Oracle
             --Adauga having sa gaseasca in col denumirea - randurile care sunt mai mari de 250 caractere
             SELECT  
             CUIIO,
             DENUMIRE
               
              FROM  USER_BANCU.P_2014;
              
              
              SELECT
  CUIIO,
  DENUMIRE
FROM USER_BANCU.P_2014
WHERE LENGTH(DENUMIRE) > 250
ORDER BY LENGTH(DENUMIRE) DESC;