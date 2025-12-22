INSERT INTO USER_BANCU.BZ_24_NUMBER 
(
CUIIO,
CA,
CA_2023
)

SELECT 
            
              CUIIO,
              TO_NUMBER(CA) CA,
              TO_NUMBER(CA_2023) CA_2023          
                
              FROM   USER_BANCU.BZ_24;
              
              
              
              
              SELECT 
                CUIIO,
                CA,
                CA_2023
              
                FROM USER_BANCU.BZ_24_NUMBER 
                WHERE 
                CA IS NULL 
                ;