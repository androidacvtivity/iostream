SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
COUNT (DISTINCT CASE WHEN FC.FORM  = 7 THEN  FC.CUIIO END ) AS auto_1_COL16,
NULL  AS auto_1__COL17,
NULL  AS auto_1__COL18
FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (7) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (7) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS2.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE