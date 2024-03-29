SELECT 
  CC.CODUL,

  NULL AS COL1,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2', '1042.3.1.1','1042.3.1.2','1042.3.1.3','1046.7.1.1','1046.7.1.2','1046.7.1.3','1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL2,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2') AND D.COL1=1 THEN 1 END) AS COL3,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1','1042.3.1.2','1042.3.1.3') AND D.COL1=1 THEN 1 END) AS COL4,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1','1046.7.1.2','1046.7.1.3') AND D.COL1=1 THEN 1 END) AS COL5,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL6,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.1') AND D.COL1=1 THEN 1 END) AS COL7,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.2') AND D.COL1=1 THEN 1 END) AS COL8,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.1') AND D.COL1=1 THEN 1 END) AS COL9,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.2') AND D.COL1=1 THEN 1 END) AS COL10,
-- 
 
 NULL AS COL11,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2', '1042.3.1.1','1042.3.1.2','1042.3.1.3','1046.7.1.1','1046.7.1.2','1046.7.1.3','1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL12,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2') AND D.COL1=1 THEN 1 END) AS COL13,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1','1042.3.1.2','1042.3.1.3') AND D.COL1=1 THEN 1 END) AS COL14,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1','1046.7.1.2','1046.7.1.3') AND D.COL1=1 THEN 1 END) AS COL15,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL16,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.1') AND D.COL1=1 THEN 1 END) AS COL17,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.2') AND D.COL1=1 THEN 1 END) AS COL18,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.1') AND D.COL1=1 THEN 1 END) AS COL19,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'1111111'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.2') AND D.COL1=1 THEN 1 END) AS COL20,
 
 
  NULL AS COL21,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2', '1042.3.1.1','1042.3.1.2','1042.3.1.3','1046.7.1.1','1046.7.1.2','1046.7.1.3','1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL22,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2') AND D.COL1=1 THEN 1 END) AS COL23,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1','1042.3.1.2','1042.3.1.3') AND D.COL1=1 THEN 1 END) AS COL24,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1','1046.7.1.2','1046.7.1.3') AND D.COL1=1 THEN 1 END) AS COL25,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL26,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.1') AND D.COL1=1 THEN 1 END) AS COL27,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.2') AND D.COL1=1 THEN 1 END) AS COL28,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.1') AND D.COL1=1 THEN 1 END) AS COL29,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'2222222'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.2') AND D.COL1=1 THEN 1 END) AS COL30,
 
 
 NULL AS COL31,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2', '1042.3.1.1','1042.3.1.2','1042.3.1.3','1046.7.1.1','1046.7.1.2','1046.7.1.3','1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL32,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2') AND D.COL1=1 THEN 1 END) AS COL33,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1','1042.3.1.2','1042.3.1.3') AND D.COL1=1 THEN 1 END) AS COL34,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1','1046.7.1.2','1046.7.1.3') AND D.COL1=1 THEN 1 END) AS COL35,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL36,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.1') AND D.COL1=1 THEN 1 END) AS COL37,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.2') AND D.COL1=1 THEN 1 END) AS COL38,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.1') AND D.COL1=1 THEN 1 END) AS COL39,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'3333333'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.2') AND D.COL1=1 THEN 1 END) AS COL40,
 
 
 NULL AS COL41,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2', '1042.3.1.1','1042.3.1.2','1042.3.1.3','1046.7.1.1','1046.7.1.2','1046.7.1.3','1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL42,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2') AND D.COL1=1 THEN 1 END) AS COL43,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1','1042.3.1.2','1042.3.1.3') AND D.COL1=1 THEN 1 END) AS COL44,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1','1046.7.1.2','1046.7.1.3') AND D.COL1=1 THEN 1 END) AS COL45,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL46,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.1') AND D.COL1=1 THEN 1 END) AS COL47,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.2') AND D.COL1=1 THEN 1 END) AS COL48,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.1') AND D.COL1=1 THEN 1 END) AS COL49,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'0100000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.2') AND D.COL1=1 THEN 1 END) AS COL50,
 
 
  NULL AS COL51,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2', '1042.3.1.1','1042.3.1.2','1042.3.1.3','1046.7.1.1','1046.7.1.2','1046.7.1.3','1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL52,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2') AND D.COL1=1 THEN 1 END) AS COL53,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1042.3.1.1','1042.3.1.2','1042.3.1.3') AND D.COL1=1 THEN 1 END) AS COL54,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1046.7.1.1','1046.7.1.2','1046.7.1.3') AND D.COL1=1 THEN 1 END) AS COL55,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 THEN 1 END) AS COL56,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.1') AND D.COL1=1 THEN 1 END) AS COL57,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1041.2.3.2') AND D.COL1=1 THEN 1 END) AS COL58,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.1') AND D.COL1=1 THEN 1 END) AS COL59,
 COUNT(DISTINCT CASE WHEN  C.CODUL = D.CAEM2 AND D.CUATM_FULL LIKE '%'||'9600000'||';%'  AND  D.CAPITOL||'.'||D.RIND IN ('1045.5.2.2') AND D.COL1=1 THEN 1 END) AS COL60
 
 
 
 
--FROM
--  CIS2.VW_DATA_ALL D





 INNER JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL = D.CAEM2
  INNER JOIN CIS2.VW_CL_CAEM2 CC ON C.FULL_CODE LIKE '%'||CC.CODUL||'%'
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM= :pFORM     AND    
 -- D.CUATM_FULL LIKE '%'||'0000000'||';%'  AND 
  D.FORM IN (48)
GROUP BY
  CC.CODUL