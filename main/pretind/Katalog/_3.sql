INSERT INTO USER_EREPORTING.FORM_CUIIO_EXTRA (
CUIIO,
CUIIO_VERS,
FORM,
FORM_VERS,
STATUT,
ID_SCHEMA 
)
   
SELECT
R.CUIIO,
R.CUIIO_VERS,
136 FORM,
2000   FORM_VERS,
'1' STATUT,
4 ID_SCHEMA 



--R.CUIIO, 
--R.CUIIO_VERS



FROM 
(

SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   FC.ID_SCHEMA
              FROM USER_EREPORTING.FORM_CUIIO_EXTRA  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM USER_EREPORTING.FORM_CUIIO_EXTRA
                                  WHERE FORM IN (136) AND CUIIO_VERS <= 2014
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (136)  AND FC.STATUT <> '3' 
             
             
             
             
             ) L 
             
             
             RIGHT JOIN (


SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM,
  -- CUATM_4,
  --L.CODUL7 CUATM,  
  D.CFP,
  D.CFOJ,
  D.COCM,
  D.CAEM2,
  D.CAEM,
  D.IDNO    

FROM USER_BANCU.KAT_136 D


             ) R ON R.CUIIO = L.CUIIO 
             
             
             WHERE 
             L.CUIIO IS   NULL
             
--             AND L.CUIIO NOT IN (
--             41799535,
--41847116,
--38974963,
--41754550
--
--             )    
 ;
             
             --AND R.CUIIO_VERS <> 2013;
             
             
             
             
             
             SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   FC.ID_SCHEMA
              FROM USER_EREPORTING.FORM_CUIIO_EXTRA  FC RIGHT JOIN ;
              
              
              
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   FC.ID_SCHEMA
              FROM USER_EREPORTING.FORM_CUIIO_EXTRA  FC INNER JOIN (
              
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   FC.ID_SCHEMA
              FROM USER_EREPORTING.FORM_CUIIO_EXTRA  FC
              )
              
              
              
              
              