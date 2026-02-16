--INSERT INTO CIS2.FORM_CUIIO  (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)

SELECT 
L.CUIIO,
L.CUIIO_VERS,
63 FORM,
2000 FORM_VERS,
'1' STATUT
FROM
(
SELECT L.CUIIO,
       R.CUIIO R_CUIIO,
       R.CUIIO_VERS CUIIO_VERS  
   FROM USER_BANCU.CALINCU_59 L  LEFT JOIN USER_BANCU.VW_MAX_RENIM_CIS2 R ON R.CUIIO = L.CUIIO 
   
        WHERE 
        
            R.CUIIO IS  NOT NULL
            AND 
            R.CUIIO_VERS = 2014        
 ) L ;
 
 
 
 
 
 ----------------------------------------------------------------------------------
 
 
 INSERT INTO CIS2.FORM_CUIIO  (
        CUIIO,
        CUIIO_VERS,
        FORM,
        FORM_VERS,
        STATUT 
)
 

 
SELECT 
L.CUIIO,
L.CUIIO_VERS,
63 FORM,
2000 FORM_VERS,
'1' STATUT
      
      --  L.KAT_112
        FROM   USER_BANCU.F_57_new L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =  TRIM(L.CUIIO_VERS)
                        
                        WHERE
                        
                        C.CUIIO IS NOT  NULL; 
       