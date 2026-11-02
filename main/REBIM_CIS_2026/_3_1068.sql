-- INSERT INTO CIS.RENIM (
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  EDIT_USER,
--  STATUT,
--  CUATM,
--  CFP,
--  CFOJ,
--  COCM,
--  CAEM,
--  BUGET,
--  TIP,
--  PROD,
--  FOR_CUB,
--  ETAPA_PROD,
--  RENIM_PERS,
--  CAEM2  
-- )




SELECT 


  CUIIO,
  1070 CUIIO_VERS,
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
                    FROM   --USER_BANCU.VW_RENIM_2012_CIS2
                     
                          -- USER_BANCU.VW_MAX_RENIM_CIS
                    
                    --   VW_RENIM_2013_CIS2
                         USER_BANCU.VW_MAX_RENIM_TRIM_CIS
                         -- VW_MAX_RENIM_299_CIS
                          
                    
                    WHERE 
   CUIIO IN (

 
             
2048979,
37688095,
40217264,
40512885,
40657589,
41086611,
41100133,
41239983,
41328600,
41378420,
41547472,
41557364
     

)
-------------------------------------
AND CUIIO_VERS <> 1070;  

