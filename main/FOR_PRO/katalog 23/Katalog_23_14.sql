DECLARE -- ====================================================================

  CURSOR C IS
        
        
  
 
        SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.TIP ,
        L.BUGET
        FROM  USER_BANCU.INVEST_2_TRIM L
        
        
--        WHERE 
--        
--            L.CUIIO = 40605658
          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS.RENIM SET 
      
        CAEM2 = CR.CAEM2,
        DENUMIRE = CR.DENUMIRE,
        CUATM = CR.CUATM,
        CFP = CR.CFP
     --   TIP = CR.TIP,
       -- BUGET = CR.BUGET
      --  CFOJ = CR.CFOJ
       -- IDNO = CR.IDNO
 --     
  --  ETAPA_PROD = CR.ETAPA_PROD
    
    
    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; --