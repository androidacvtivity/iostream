SELECT
  DISTINCT D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM, 
  D.CFP,
  D.CFOJ,
  D.COCM,
  D.CAEM2,
  D.CAEM, ----------------------
  D.IDNO    
------------------------------------------------

FROM  USER_BANCU.INV_2_TRIM D

-- WHERE 
--
--D.CUATM IN ('2710002');

                                
--                                
----                                INNER JOIN CIS2.CL_CUATM74 L ON D.CUATM = L.CODUL4 
--                                 LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2   DD ON DD.CUIIO = D.CUIIO    
--                                
--                                
--                                
--                                ) D
                                
                           
--------------------------------------------------------------------------------
                     --   LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2   DD ON DD.CUIIO = D.CUIIO    
                                
                         LEFT JOIN CIS.VW_CL_CUATM C ON TRIM(C.CODUL) =  TRIM(D.CUATM)
                        
                       -- LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  D.CAEM2
                        
                     --   LEFT JOIN CIS.VW_CL_CFP C ON C.CODUL =  D.CFP
                       
                        WHERE 
                        
                        C.CODUL IS     NULL ;
--                        
----                        
--
--
--
--40959600	1067		5701001
--38857648	1067		5701001
--41328072	1067		4313003



        SELECT *
        
            FROM CIS2.VW_CL_CUATM
            
            WHERE 
            
           -- CODUL LIKE '2710002%'
            
            CODUL IN ('4313003','4313001','5701001','2710002','5701001')
            ;
            
            
            
            SELECT ITEM_CODE,
                   ITEM_PARENT,
                   NAME,
                   ITEM_PATH
            
                FROM CIS2.VW_CLS_CLASS_ITEM
                WHERE 
                CLASS_CODE IN ('CUATM')
            
                 AND 
                 (
--                 ITEM_CODE LIKE '43%'
--                 OR 
                 -- ITEM_CODE LIKE '27%' 
                 
                 ITEM_CODE IN ('4313003','4313001','5701001','2710002','5701001')
                 )
                 
                 
                 -- 2710002
                 
                 ORDER BY 
                 ITEM_PATH
                 ;