----------------------------------------------

------------------------------------------------

INSERT INTO CIS2.RENIM (
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
)
 



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

   
                    FROM -- USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                        USER_BANCU.VW_MAX_RENIM_CIS2
                 --   USER_BANCU.VW_MAX_RENIM_CIS2_2013
                ----------------------------------------------------------------    
                    WHERE 
                  
CUIIO IN (
40221231,
484156,
40075054,
5916034,
40852569,
40958931,
41283754,
37580104,
41126823,
40269159,
40481363,
37745491,
3002258,
5912792,
40331480,
40979318,
41515472,
20199400,
40197231,
40240323,
40600632,
40849892,
20426439,
38916598,
38285146,
5917884,
40098457,
40920880,
15860292,
20164413,
40875866,
40566154,
37596387,
2562044,
2049140,
40451184,
2733439,
38576978,
37129421,
37729279,
41405708,
5910126,
2562305,
38909894,
5921228,
40192311,
4510933

)

      

AND CUIIO_VERS  <> 2014
        


;


SELECT 
       FC.CUIIO
 
      

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
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 1800
             ) FC
             
--             WHERE
--             FC.CUIIO_VERS =    1830