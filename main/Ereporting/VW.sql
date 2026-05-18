 CREATE OR REPLACE FORCE VIEW VW_AGRO_3_K
 
 
AS 
 SELECT FC.CUIIO 
              FROM ( 
              
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (73) AND CUIIO_VERS <= 2015
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (73) AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2000
             ) FC
             
             
             WHERE
             
             1=1
             
             AND FC.CUIIO IN (

4499172,
4499485,
4499019,
4499628,
7004780,
4495642,
4495843,
40072972,
4493519,
40645811,
4493689,
4496162,
4494430,
4498925,
4495783,
37672243,
4498652,
00449987,
4493748,
4499054,
37659722,
4493637,
37758594,
4494750,
4494602,
4498126,
4497821,
4495814,
4495694,
37672266,
37667459,
4499158,
4495719,
20390115,
4495777,
4494200,
4494708,
4495808,
4495866,
4494737,
04494163,
4494097,
4016541,
4495760,
4493235,
3948320,
38790803,
4499203,
4495702,
5694668,
04497960,
4498250,
4493413,
4494329,
4495493,
4497457,
4497049

)
