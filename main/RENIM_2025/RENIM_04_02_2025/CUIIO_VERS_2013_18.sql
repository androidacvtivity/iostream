--INSERT INTO CIS2.FORM_CUIIO  (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)
--

SELECT 
  DISTINCT L.CUIIO,
  2014 CUIIO_VERS,
  67 FORM,
  2000  FORM_VERS,
   '1' STATUT
FROM USER_BANCU.F_67 L LEFT  JOIN (
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
                                  WHERE FORM IN (67) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (67) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 2000 
             
             ) FC
             
             
             WHERE
               1=1

) R  ON R.CUIIO = L.CUIIO


WHERE 
R.CUIIO IS NOT  NULL 

--AND L.CUIIO IN (
--
--SELECT  DISTINCT CUIIO 
--        
--        FROM CIS2.RENIM 
--        
--        WHERE
--        
--        R.CUIIO_VERS = 2014
--
-- 
--
--)
;


 
