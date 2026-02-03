--INSERT INTO CIS2.FORM_CUIIO 
--(
--
--CUIIO,
--CUIIO_VERS,
--FORM,
--FORM_VERS,
--STATUT
--)
 
------------------------------------------------------------------------------------


SELECT 
R.CUIIO,
1066 CUIIO_VERS,
26 FORM,
1004 FORM_VERS,
'1' STATUT  
FROM RENIM_21_VANZARI L LEFT  JOIN (
SELECT FC.CUIIO,
       FC.CUIIO_VERS  
              FROM(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (26) AND CUIIO_VERS <= 1066
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (26) AND FC.STATUT <> '3'
             --and FC.FORM_VERS = 1004 
             
             ) FC
             
             
             WHERE
               1=1

) R  ON R.CUIIO = L.CUIIO


WHERE 
L.CUIIO  IS NOT NULL ;




--
--
--
INSERT INTO CIS2.FORM_CUIIO 
(

CUIIO,
CUIIO_VERS,
FORM,
FORM_VERS,
STATUT
)
 
    

       SELECT 
       R.CUIIO,
       R.CUIIO_VERS,
       54 FORM,
       2000 FORM_VERS,
       '1' STATUT  
       
       FROM CIS2.RENIM R 
       
            WHERE 
            
            R.CUIIO IN (
819384,
2933598,
38930262,
40109250,
40151111,
40347311,
40547754,
40856515,
41011895,
41084983,
41181441,
41245660,
41616322


)

 AND R.CUIIO_VERS BETWEEN 2014 AND 2014
 
 
 AND CUIIO NOT IN (
819384,
2933598,
38930262,
40151111,
40347311,
40547754


 )
 
 
 
