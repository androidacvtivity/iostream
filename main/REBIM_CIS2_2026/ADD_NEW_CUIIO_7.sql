INSERT INTO CIS2.RENIM  (
        CUIIO,
        CUIIO_VERS,
        DENUMIRE,
        EDIT_USER,
        STATUT,
        CUATM,
        CFP,
        CFOJ,
        CAEM2,
        IDNO
        
        
)

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
        FROM   USER_BANCU.RENIM_2014 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =  TRIM(L.CUIIO_VERS)
                        
                        WHERE
                        
                        C.CUIIO IS  NULL; 
                       -- AND C.CUIIO_VERS IS   NULL -
                       
                       
--------------------------------------------------------------------------------



SELECT *

    FROM CON_5;

UPDATE USER_BANCU.CON_5
SET CUIIO_VERS = 1068;








            SELECT *
            
                FROM CIS2.RENIM
                
                WHERE 
                
                CUIIO IN (
                41769570,
41806005,
41810295,
41836147,
41846803,
41847760,
41847955,
41848877,
41848908,
41849782,
41852146,
41855280,
41855392,
41855892,
41857853,
41862201,
41863894,
41866875,
41868265,
41868650,
41869201,
41870109,
41871586,
41872427,
41874412,
41875093,
41875650,
41877330,
41880792,
41883201,
41883448,
41883862,
41884755,
41888138,
41888552,
41888670,
41890336,
41891726,
41892526,
41892938,
41893599,
41895813,
41897189,
41898237,
41899024,
41899372,
41900974,
41906578,
41906965,
41914522,
41918218,
41919206,
41921137,
41921893,
41922585,
41923001,
41924443,
41932419,
41934051,
41939093,
41940318,
41941312,
41950860
)      ;          


--AND CUIIO_VERS =  2014;






SELECT 
 
        TRIM(L.CUIIO) CUIIO
       

        FROM   USER_BANCU.RENIM_2014 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =     TRIM(L.CUIIO_VERS) 
                        
                        WHERE
                        
                        C.CUIIO IS  NULL