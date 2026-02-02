INSERT INTO CIS.RENIM  (
        CUIIO,
        CUIIO_VERS,
        DENUMIRE,
 
        EDIT_USER,
        STATUT,
        CUATM,
        CFP,
TIP,
        CAEM2
      
        
        
)



 SELECT 
 
        TRIM(L.CUIIO) CUIIO ,
        L.CUIIO_VERS,
        TRIM(L.DENUMIRE)  DENUMIRE,
         1   EDIT_USER,
        '1' STATUT,
        TRIM(L.CUATM) CUATM,
        TRIM(L.CFP) CFP,
        TRIM(L.TIP)  TIP,
        TRIM(L.CAEM2)  CAEM2
        FROM   USER_BANCU.RENIM_CIS_5C_1068 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =  TRIM(L.CUIIO_VERS) 
                        
                        WHERE
                        
                        C.CUIIO IS      NULL ; 
                      --   AND C.CUIIO_VERS IS     NULL; 