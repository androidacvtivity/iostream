
     CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_2_IN_CONTROL

AS
SELECT 
 
        TRIM(L.CUIIO) CUIIO ,
    
        TRIM(L.CUIIO_VERS) CUIIO_VERS, 
        TRIM(L.DENUMIRE)  DENUMIRE,
        1   EDIT_USER,
        '1' STATUT,
        TRIM(L.CUATM) CUATM,
        TRIM(L.CFP) CFP,
       -- TRIM(L.CFOJ) CFOJ,
        TRIM(L.CAEM2)  CAEM2,
 
        TRIM(TRIM(L.IDNO))  IDNO
      
      --  L.KAT_112
        FROM   USER_BANCU.INV_2_2025 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =    TRIM(L.CUIIO_VERS) 
                        
                        WHERE
                        
                        C.CUIIO IS  NULL AND C.CUIIO_VERS IS NULL
                        
                        
                        
                        ORDER BY 
                        TRIM(TRIM(L.IDNO)) DESC;