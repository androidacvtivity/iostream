
CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_MAX_RE_CIS2_2014_2_INV_AN
AS
SELECT 
 CUIIO,
 CUIIO_VERS,
 DENUMIRE,
 EDIT_USER,
 STATUT,
 CUATM,
 CFP,
 CFOJ,
 COCM,
 CAEM,
 BUGET,
 TIP,
 PROD,
 FOR_CUB,
 GENMUZEE,
 TIPMUZEE,
 TIP_LOCAL,
 TIP_INST,-------------------------------------------------------------
 CAEM2,
 N85_NTL,
 N85_NTIIP,
 N85_NDIIP,
 N85_NPDS,
 N85_NRIIP,
 N85_NSIIP,
 GENMUZEE2,
 NFI,
 NTII,
 NPDS,
 ORGANE,
 TIP_INV,
 RENIM_PERS,
 ORGANE_COND,
 GEN_INSTITUTIE,
 IDNO

   
                    FROM   -- USER_BANCU.VW_MAX_RENIM_CIS2_1067  
                    -- USER_BANCU.VW_MAX_RENIM_TRIM_CIS2    
                          -- USER_BANCU.VW_MAX_RENIM_2LIVII 
                         USER_BANCU.VW_MAX_RENIM_CIS2_2014
                  --   USER_BANCU.VW_MAX_RENIM_CIS2_2014
                  --  USER_BANCU.VW_MAX_RENIM_299_CIS2
                ----------------------------------------------------------------    
                    WHERE 
         CUIIO IN (
        
        SELECT FC.CUIIO
                  
              FROM( 


SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (8) AND CUIIO_VERS <= 2014
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (8) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             
             ) FC
             
             WHERE 
             
             FC.CUIIO_VERS <>   2014

)   


 AND 
 
 (CUIIO_VERS <>  2014 AND CUIIO_VERS <>  2015) ; 
 
 
 
 
 
 -- SQL - find duplicate from column cuiio - cuiio is number  -- SQL Oracle 
 SELECT 
 CUIIO 
 FROM USER_BANCU.VW_MAX_RE_CIS2_2014_2_INV_AN;
 
 
 SELECT
  CUIIO,
  COUNT(*) AS dup_count           -- COUNT(*) counts NULLs; use this if you want to flag repeated NULLs too
FROM USER_BANCU.VW_MAX_RE_CIS2_2014_2_INV_AN
GROUP BY CUIIO
HAVING COUNT(*) > 1
ORDER BY dup_count DESC, CUIIO;


SELECT t.*
FROM USER_BANCU.VW_MAX_RE_CIS2_2014_2_INV_AN t
JOIN (
  SELECT CUIIO
  FROM USER_BANCU.VW_MAX_RE_CIS2_2014_2_INV_AN
  GROUP BY CUIIO
  HAVING COUNT(*) > 1
) d
  ON d.CUIIO = t.CUIIO
ORDER BY t.CUIIO;