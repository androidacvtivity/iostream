SELECT 
D.*

FROM CIS2.MD_PERIOADA D
WHERE 

D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4;

--D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA;




--D.PERIOADA IN (1052,1053,1054,1055)



--D.PERIOADA IN (1048,1049,1050,1051)