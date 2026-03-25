 SELECT *
 
            FROM CIS2.VW_DATA_ALL_GC_COEF D
                WHERE 
                   D.PERIOADA = 1067
                   
                   AND D.UNIT_CODE IN (831347)
                   
                   AND D.FORM = 61 
                   AND D.CAPITOL IN ('1111','1110') 
                  
                   AND D.UNIT_CODE IN (831347)