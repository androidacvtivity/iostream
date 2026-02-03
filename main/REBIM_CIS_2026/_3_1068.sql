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
--
--
--

SELECT 


  CUIIO,
  1068 CUIIO_VERS,
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

 
             
  SELECT 
    DISTINCT CUIIO   
  
  FROM USER_BANCU.RENIM_CIS_5C_1068         

)
-------------------------------------
--AND CUIIO_VERS <> 1068;  

