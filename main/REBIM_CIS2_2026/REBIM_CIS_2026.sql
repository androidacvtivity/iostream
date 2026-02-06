--INSERT INTO CIS2.FORM_CUIIO  (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)
--
               SELECT             
                   FC.CUIIO,
                   1068 CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
           
              FROM( 


SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 1004
             
             ) FC
             
             WHERE 
             
             FC.CUIIO IN (
             41647021,
40933552,
40991696,
41170903,
40933167,
38926473,
41019849,
40080188,
40414562,
41753757,
40882799,
2925707,
3135692,
38290456,
40109095,
2049007,
41581061,
41068027,
40197923,
37561667,
41576108,
41353957,
40736165,
40075054,
38284158,
5916034,
40995978,
1846756,
41264969,
41070225,
41382396,
1845544,
40975384,
1843835,
41210525,
40797824,
40218186
             )
             
             
       --      AND FC.CUIIO_VERS <> 1068