--INSERT INTO CIS2.RENIM  (
--        CUIIO,
--        CUIIO_VERS,
--        DENUMIRE,
--        EDIT_USER,
--        STATUT,
--        CUATM,
--        CFP,
--        CFOJ,
--        CAEM2,
--        IDNO
--        
--        
--)

----------------------------------------------

 SELECT 
 
        TRIM(L.CUIIO) CUIIO ,
        --2013 CUIIO_VERS,
        L.CUIIO_VERS,
        TRIM(L.DENUMIRE)  DENUMIRE,
        1   EDIT_USER,
        '1' STATUT,
        TRIM(L.CUATM) CUATM,
        TRIM(L.CFP) CFP,
        TRIM(L.CFOJ) CFOJ,
        TRIM(L.CAEM2)  CAEM2,
 
        TRIM(TRIM(L.IDNO))  IDNO
      
      --  L.KAT_112
        FROM   USER_BANCU.RENIM_AGR L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =  L.CUIIO_VERS
                        
                        WHERE
                        
                        C.CUIIO IS NULL;
                        
                        
--                        AND L.CUIIO IN (
--                        SELECT CUIIO  
--                           FROM USER_BANCU.CALINCU_59 )
                        
                         
                       -- AND C.CUIIO_VERS IS   NULL -
                       
                       
--------------------------------------------------------------------------------





INSERT INTO CIS2.FORM_CUIIO R (
        CUIIO,
        CUIIO_VERS,
        FORM,
        FORM_VERS,
        STATUT 
)



----------------------------------------------

SELECT   
        L.CUIIO,
        2015 CUIIO_VERS,
        43 FORM,
        2000 FORM_VERS,
        '1' STATUT 

         
        FROM USER_BANCU.RENIM L  

            WHERE 
            CUIIO <> 41153773



            