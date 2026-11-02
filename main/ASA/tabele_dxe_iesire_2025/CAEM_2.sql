
SELECT
CODUL, 
DENUMIRE, 
GRUPA, 
ORDINE, 
FULL_CODE, 
NUM_CODE, 
PRIM                
                FROM 
                (
SELECT
CODUL, 
DENUMIRE, 
GRUPA, 
ORDINE, 
FULL_CODE, 
NUM_CODE, 
PRIM                
                FROM  CIS2.VW_CL_CAEM2
                
               
                
                WHERE 
                
                
                
                (
                SUBSTR(CODUL, 1, 1) IN (
    'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'P', 'Q', 'R', 'S'
)
                )
                
                AND 
                
                SUBSTR(CODUL,1,3) NOT IN ('S94','K65')
                AND 
                CODUL NOT IN ('K6419','K6411')
                
                
                
                
                
                
                )
                
                
                WHERE
                CODUL LIKE 'S%'