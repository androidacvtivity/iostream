UPDATE USER_BANCU.RSF_PRESC_22
        
        SET  CUIIO_VERS = 2011; 


SELECT CUIIO

FROM USER_BANCU.RSF_PRESC_22


WHERE 

CUIIO NOT IN (
SELECT CUIIO
FROM USER_BANCU.RSF_PRESC_22
) AND CUIIO_VERS IN  (2011)

AND FORM = 63