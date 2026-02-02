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

   
                    FROM   USER_BANCU.VW_MAX_RENIM_CIS2_1067  
                    -- USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                      --   USER_BANCU.VW_MAX_RENIM_CIS2
                  --   USER_BANCU.VW_MAX_RENIM_CIS2_2014
                  --  USER_BANCU.VW_MAX_RENIM_299_CIS2
                ----------------------------------------------------------------    
                    WHERE 
         CUIIO IN (
                
         
        SELECT 
 
        TRIM(L.CUIIO) CUIIO 
        
        FROM   USER_BANCU.CUATM_CIS2 L

)   -- AND CUIIO_VERS <> 1067               



;





SELECT CUIIO,
       CUIIO_VERS 

        FROM USER_BANCU.VW_MAX_RENIM_CIS2_2014
        
        WHERE 
         CUIIO IN (
                
         
        SELECT FC.CUIIO --,
              -- FC.CUIIO_VERS
      

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
             FC.FORM IN (:pFORM) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             ) FC )
             
             
             
             AND 
             
             CUIIO_VERS =  2014;
             
             
             
             
             
             
             
     CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_2_INVEST_NOT_2014

AS
        
          SELECT FC.CUIIO,
                    FC.CUIIO_VERS
      

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
                                  WHERE FORM IN (8) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (8) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             ) FC
             
             WHERE
             FC.CUIIO_VERS <>  2014;
             
             
             
             SELECT CUIIO    
             FROM USER_BANCU.VW_2_INVEST_NOT_2014;
             
                          
             SELECT CUIIO    
             FROM USER_BANCU.VW_2_INVEST_NOT_2014_2;
             
                 CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_2_INVEST_NOT_2014_2

AS 
             
             SELECT 
 CUIIO,
 2014 CUIIO_VERS
 

   
                    FROM  -- USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                         USER_BANCU.VW_MAX_RENIM_CIS2
                  --   USER_BANCU.VW_MAX_RENIM_CIS2_2014
                  --  USER_BANCU.VW_MAX_RENIM_299_CIS2
                ----------------------------------------------------------------    
                    WHERE 
        ( CUIIO IN (
                
         
        SELECT CUIIO    
             FROM USER_BANCU.VW_2_INVEST_NOT_2014
 
)                


AND CUIIO_VERS <>  2014 )





AND CUIIO NOT  IN (

SELECT CUIIO-- ,
     --  CUIIO_VERS 

        FROM USER_BANCU.VW_MAX_RENIM_CIS2_2014
        
        WHERE 
         CUIIO IN (
                
             SELECT CUIIO    
             FROM USER_BANCU.VW_2_INVEST_NOT_2014
        )
             
             
             
             AND 
             
             CUIIO_VERS =  2014
        

);

