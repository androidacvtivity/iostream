SELECT   
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.RIND IN ('1') THEN D.COL3 ELSE NULL END) AS RIND_1_COL1,
         SUM(CASE WHEN D.RIND IN ('1') THEN D.COL4 ELSE NULL END) AS RIND_1_COL2,
         SUM(CASE WHEN D.RIND IN ('1') THEN D.COL5 ELSE NULL END) AS RIND_1_COL3,
         SUM(CASE WHEN D.RIND IN ('2') THEN D.COL3 ELSE NULL END) AS RIND_2_COL1,
         SUM(CASE WHEN D.RIND IN ('2') THEN D.COL4 ELSE NULL END) AS RIND_2_COL2,
         SUM(CASE WHEN D.RIND IN ('2') THEN D.COL5 ELSE NULL END) AS RIND_2_COL3,
         
         SUM(CASE WHEN D.RIND IN ('3') THEN D.COL3 ELSE NULL END) AS RIND_3_COL1,
         SUM(CASE WHEN D.RIND IN ('3') THEN D.COL4 ELSE NULL END) AS RIND_3_COL2,
         SUM(CASE WHEN D.RIND IN ('3') THEN D.COL5 ELSE NULL END) AS RIND_3_COL3,
         
         SUM(CASE WHEN D.RIND IN ('4') THEN D.COL3 ELSE NULL END) AS RIND_4_COL1,
         SUM(CASE WHEN D.RIND IN ('4') THEN D.COL4 ELSE NULL END) AS RIND_4_COL2,
         SUM(CASE WHEN D.RIND IN ('4') THEN D.COL5 ELSE NULL END) AS RIND_4_COL3,
         
         
         SUM(CASE WHEN D.RIND IN ('5') THEN D.COL3 ELSE NULL END) AS RIND_5_COL1,
         SUM(CASE WHEN D.RIND IN ('5') THEN D.COL4 ELSE NULL END) AS RIND_5_COL2,
         SUM(CASE WHEN D.RIND IN ('5') THEN D.COL5 ELSE NULL END) AS RIND_5_COL3,
         
         
         SUM(CASE WHEN D.RIND IN ('6') THEN D.COL3 ELSE NULL END) AS RIND_6_COL1,
         SUM(CASE WHEN D.RIND IN ('6') THEN D.COL4 ELSE NULL END) AS RIND_6_COL2,
         SUM(CASE WHEN D.RIND IN ('6') THEN D.COL5 ELSE NULL END) AS RIND_6_COL3,
         
         
         SUM(CASE WHEN D.RIND IN ('7') THEN D.COL3 ELSE NULL END) AS RIND_7_COL1,
         SUM(CASE WHEN D.RIND IN ('7') THEN D.COL4 ELSE NULL END) AS RIND_7_COL2,
         SUM(CASE WHEN D.RIND IN ('7') THEN D.COL5 ELSE NULL END) AS RIND_7_COL3,
         
         
         SUM(CASE WHEN D.RIND IN ('8') THEN D.COL3 ELSE NULL END) AS RIND_8_COL1,
         SUM(CASE WHEN D.RIND IN ('8') THEN D.COL4 ELSE NULL END) AS RIND_8_COL2,
         SUM(CASE WHEN D.RIND IN ('8') THEN D.COL5 ELSE NULL END) AS RIND_8_COL3,
         
         
         
         SUM(CASE WHEN D.RIND IN ('9') THEN D.COL3 ELSE NULL END) AS RIND_9_COL1,
         SUM(CASE WHEN D.RIND IN ('9') THEN D.COL4 ELSE NULL END) AS RIND_9_COL2,
         SUM(CASE WHEN D.RIND IN ('9') THEN D.COL5 ELSE NULL END) AS RIND_9_COL3,
         
         
         SUM(CASE WHEN D.RIND IN ('10') THEN D.COL3 ELSE NULL END) AS RIND_10_COL1,
         SUM(CASE WHEN D.RIND IN ('10') THEN D.COL4 ELSE NULL END) AS RIND_10_COL2,
         SUM(CASE WHEN D.RIND IN ('10') THEN D.COL5 ELSE NULL END) AS RIND_10_COL3,
         
         SUM(CASE WHEN D.RIND IN ('11') THEN D.COL3 ELSE NULL END) AS RIND_11_COL1,
         SUM(CASE WHEN D.RIND IN ('11') THEN D.COL4 ELSE NULL END) AS RIND_11_COL2,
         SUM(CASE WHEN D.RIND IN ('11') THEN D.COL5 ELSE NULL END) AS RIND_11_COL3
        
FROM
  CIS2.VW_DATA_ALL_GC  D

  WHERE
  (D.PERIOADA IN (1059))  AND   
   D.FORM IN (:pFORM) 
   AND D.CAPITOL IN (1198) 
   -- AND D.UNIT_CODE = 822295
  

  
  GROUP BY 
         D.PERIOADA,
         D.UNIT_CODE,
         D.CUATM,
         D.RIND
         
         
         ORDER BY 
           D.UNIT_CODE,
          
         D.RIND