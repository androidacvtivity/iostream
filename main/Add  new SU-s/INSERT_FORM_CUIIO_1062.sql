--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)

SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  5 FORM,
  1004 FORM_VERS,
  '1' STATUT

  FROM USER_BANCU.AUTO_65 D
  
  WHERE D.CUIIO NOT IN (
  SELECT 
   TRIM(L.CUIIO) CUIIO 

        FROM   USER_BANCU.AUTO_65 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  L.CUIIO  
                                                  AND C.CUIIO_VERS  =  L.CUIIO_VERS  
                        
                        WHERE 
                        
                        C.CUIIO  is   NULL
  )