--INSERT INTO CIS2.RENIM 
--(
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  EDIT_USER,
--  STATUT,
--  CUATM,
--  CFP,
--  CFOJ,
----  R.COCM,
----  R.CAEM2,
--
--  IDNO  
--
--)

SELECT 
  R.CUIIO,
  R.CUIIO_VERS,
  R.DENUMIRE,
  1 EDIT_USER,
  '1' STATUT,
  R.CUATM,
  R.CFP,
  R.CFOJ,
--  R.COCM,
--  R.CAEM2,

  R.IDNO  


FROM USER_BANCU.IDNO R LEFT JOIN CIS2.RENIM L ON R.CUIIO = L.CUIIO  AND R.CUIIO_VERS = L.CUIIO_VERS

            WHERE
            L.CUIIO IS  NULL;
            
            ----------------------------------