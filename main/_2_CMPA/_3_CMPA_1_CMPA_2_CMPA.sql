SELECT
L.UNIT_CODE,
L.NAME,
L.CUATM,
L.COL1,
L.COL2,
L.COL1_1CMPA,
L.COL2_1CMPA,
L.COL3_1CMPA,
L.COL4_1CMPA,
R.COL1_2_CMPA,
R.COL2_2_CMPA,
R.COL3_2_CMPA,
R.COL4_2_CMPA,
R.COL5_2_CMPA,
R.COL6_2_CMPA,
R.COL7_2_CMPA

FROM

(
SELECT
L.UNIT_CODE,
L.NAME,
L.CUATM,
L.COL1,
L.COL2,
R.COL1 AS COL1_1CMPA,
R.COL2 AS COL2_1CMPA,
R.COL3 AS COL3_1CMPA,
R.COL4 AS COL4_1CMPA

FROM

(
SELECT
                   DISTINCT FC.UNIT_CODE,
                   FC.NAME,
                   R.CUATM,
                   CASE WHEN R.COL1 = 0 THEN NULL ELSE R.COL1 END AS COL1,
                   CASE WHEN R.COL2 = 0 THEN NULL ELSE R.COL2 END AS COL2



                   FROM

(

SELECT FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   RR.NAME
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (

                   SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFORM) AND UNIT_CODE_VERS <= :pPERIOADA
                               GROUP BY UNIT_CODE


                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)

                         INNER JOIN  CIS2.REG_UNIT_GC RR
                               ON RR.UNIT_CODE = BB.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = BB.UNIT_CODE_VERS

             WHERE
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'



             ) FC LEFT JOIN (


             SELECT
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.CAPITOL IN (1115) AND D.RIND = '6000' THEN D.COL1 ELSE NULL  END) AS COL1,
         SUM(CASE WHEN D.CAPITOL IN (1116) AND D.RIND = '6200' THEN D.COL1 ELSE NULL  END) AS COL2







FROM
  CIS2.VW_DATA_ALL_GC  D



  ----
  -----
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND
   D.FORM IN (:pFORM)
   -- AND D.UNIT_CODE =822223



  GROUP BY
         D.UNIT_CODE,
         D.CUATM


             ) R ON R.UNIT_CODE = FC.UNIT_CODE  ) L LEFT JOIN (

             SELECT
                   DISTINCT FC.UNIT_CODE,
                   FC.NAME,
                   R.CUATM,
                   CASE WHEN R.COL1 = 0 THEN NULL ELSE R.COL1 END AS COL1,
                   CASE WHEN R.COL2 = 0 THEN NULL ELSE R.COL2 END AS COL2,
                   CASE WHEN R.COL3 = 0 THEN NULL ELSE R.COL3 END AS COL3,
                   CASE WHEN R.COL4 = 0 THEN NULL ELSE R.COL4 END AS COL4


                   FROM

(

SELECT FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   RR.NAME
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (

                   SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFORM_1) AND UNIT_CODE_VERS <= :pPERIOADA_1
                               GROUP BY UNIT_CODE


                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)

                         INNER JOIN  CIS2.REG_UNIT_GC RR
                               ON RR.UNIT_CODE = BB.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = BB.UNIT_CODE_VERS

             WHERE
             FC.FORM IN (:pFORM_1) AND FC.STATUT <> '3'



             ) FC LEFT JOIN (


             SELECT
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.CAPITOL IN (1110) AND D.RIND = '005' THEN D.COL3 ELSE NULL  END) AS COL1,
         SUM(CASE WHEN D.CAPITOL IN (1110) AND D.RIND = '006' THEN D.COL3 ELSE NULL  END) AS COL2,
         SUM(CASE WHEN D.CAPITOL IN (1110) AND D.RIND = '007' THEN D.COL3 ELSE NULL  END) AS COL3,
         SUM(CASE WHEN D.CAPITOL IN (1110) AND D.RIND IN ('005','006','007') THEN D.COL3 ELSE NULL  END) AS COL4







FROM
  CIS2.VW_DATA_ALL_GC  D



  ----
  -----
WHERE
  (D.PERIOADA IN (:pPERIOADA_1))  AND
   D.FORM IN (:pFORM_1)




  GROUP BY
         D.UNIT_CODE,
         D.CUATM


             ) R ON R.UNIT_CODE = FC.UNIT_CODE




             ) R ON R.UNIT_CODE = L.UNIT_CODE ) L  LEFT JOIN (
             
             SELECT 
                   DISTINCT FC.UNIT_CODE,
                   FC.NAME,
                   R.CUATM,
                   CASE WHEN R.COL1 = 0 THEN NULL ELSE R.COL1 END AS COL1_2_CMPA,
                   CASE WHEN R.COL2 = 0 THEN NULL ELSE R.COL2 END AS COL2_2_CMPA,
                   CASE WHEN R.COL3 = 0 THEN NULL ELSE R.COL3 END AS COL3_2_CMPA,
                   CASE WHEN R.COL4 = 0 THEN NULL ELSE R.COL4 END AS COL4_2_CMPA,
                   CASE WHEN R.COL5 = 0 THEN NULL ELSE R.COL5 END AS COL5_2_CMPA,
                   CASE WHEN R.COL6 = 0 THEN NULL ELSE R.COL6 END AS COL6_2_CMPA,
                   CASE WHEN R.COL7 = 0 THEN NULL ELSE R.COL7 END AS COL7_2_CMPA      

                   FROM

(

               SELECT 
                 DISTINCT 
                 
                   FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,

                   MAX(RR.NAME) NAME

              FROM
              (  

             SELECT 
                   FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT

              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  
                   
                   SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFORM_2) AND UNIT_CODE_VERS <= :pPERIOADA_2
                               GROUP BY UNIT_CODE
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
                         

                           
             WHERE 
             FC.FORM IN (:pFORM_2) AND FC.STATUT <> '3' 
             
             
             ORDER BY
             FC.UNIT_CODE_VERS
             
             
             
             ) FC
             
              LEFT JOIN  CIS2.REG_UNIT_GC RR 
                               ON RR.UNIT_CODE = FC.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = FC.UNIT_CODE_VERS
                           
                           
                           GROUP BY
                                              FC.UNIT_CODE,
                                              FC.UNIT_CODE_VERS

             
             
             
             ) FC LEFT JOIN (
             
             
             SELECT 
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '010' THEN D.COL16 ELSE NULL  END) AS COL1,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '020' THEN D.COL16 ELSE NULL  END) AS COL2,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '030' THEN D.COL16 ELSE NULL  END) AS COL3,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '040' THEN D.COL16 ELSE NULL  END) AS COL4,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '050' THEN D.COL16 ELSE NULL  END) AS COL5,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND IN  ('060','070','080','090') THEN D.COL16 ELSE NULL  END) AS COL6,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND IN ('100') THEN D.COL16 ELSE NULL  END) AS COL7
         
         
        
       
        
        
FROM
  CIS2.VW_DATA_ALL_GC  D
  
  
  
  ----
  -----
WHERE
  (D.PERIOADA IN (:pPERIOADA_2))  AND   
   D.FORM IN (:pFORM_2) 

  

  
  GROUP BY 
         D.UNIT_CODE,
         D.CUATM

             
             ) R ON R.UNIT_CODE = FC.UNIT_CODE
             
             

             ) R ON R.UNIT_CODE = L.UNIT_CODE
             
             
             ORDER BY
             TO_NUMBER(L.COL4_1CMPA) 