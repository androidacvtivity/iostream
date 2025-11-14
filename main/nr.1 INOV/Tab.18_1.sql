INSERT INTO CIS2.TABLE_OUT 
(
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,  
  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19, COL20, COL21, COL22, COL23

)



SELECT 
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,    
'0' AS NR_SECTIE,
'0' AS NUME_SECTIE,
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2, 
COL1||'~'||ROWNUM||'~'||ROWNUM   NR_ROW,
ROWNUM AS ORDINE,
'00000000000000000000000' AS DECIMAL_POS, 
CODUL||'-'||DENUMIRE AS NUME_ROW,
COL2 AS COL1, 
COL3 AS COL2,
COL4 AS COL3,
COL5 AS COL4,
COL6 AS COL5,
COL7 AS COL6,
COL8 AS COL7,
COL9 AS COL8,
COL10 AS COL9,
COL11 AS COL10,
COL12 AS COL11,
COL13 AS COL12,
COL14 AS COL13,
COL15 AS COL14,
COL16 AS COL15,
COL17 AS COL16,
COL18 AS COL17,
COL19 AS COL18,
COL20 AS COL19,
COL21 AS COL20,
COL22 AS COL21,
COL23 AS COL22,
COL24 AS COL23




FROM
(
SELECT
  A.CODUL,
  A.DENUMIRE,
  ROUND((A.COL1 + A.COL2 + A.COL3),0) AS COL1,
  ROUND(A.COL1,0) AS COL2,
  ROUND(A.COL2,0) AS COL3,
  ROUND(A.COL3,0) AS COL4,
  
  ROUND((A.COL4 + A.COL5 + A.COL6),0) AS COL5,
  ROUND(A.COL4,0) AS COL6,
  ROUND(A.COL5,0) AS COL7,
  ROUND(A.COL6,0) AS COL8,
  
  
  ROUND((A.COL7 + A.COL8 + A.COL9),0) AS COL9,
  ROUND(A.COL7,0) AS COL10,
  ROUND(A.COL8,0) AS COL11,
  ROUND(A.COL9,0) AS COL12,
  
  
  ROUND((A.COL10 + A.COL11 + A.COL12),0) AS COL13,
  ROUND(A.COL10,0) AS COL14,
  ROUND(A.COL11,0) AS COL15,
  ROUND(A.COL12,0) AS COL16,
  
  ROUND((A.COL13 + A.COL14 + A.COL15),0) AS COL17,
  ROUND(A.COL13,0) AS COL18,
  ROUND(A.COL14,0) AS COL19,
  ROUND(A.COL15,0) AS COL20,
  
  
  ROUND((A.COL16 + A.COL17 + A.COL18),0) AS COL21,
  ROUND(A.COL16,0) AS COL22,
  ROUND(A.COL17,0) AS COL23,
  ROUND(A.COL18,0) AS COL24
  
  
 
FROM
(
SELECT 
 
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  
  COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2') AND NVAL(D.COL1)  >=  1  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 =0    )  
    THEN D.CUIIO END) AS COL1,
    
  COUNT(DISTINCT CASE WHEN D.RIND LIKE ('1.5.%')  AND NVAL(D.COL1) >= 1  AND (DD.has_112 + DD.has_111 = 0  ) 
     THEN D.CUIIO END) AS COL2,
     
  COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')   AND NVAL(D.COL1) >= 1  
  
  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 > 0)  AND  (DD.has_112 + DD.has_111 > 0)
    THEN D.CUIIO END) 
   AS COL3,
   
   -----------------------------------------------------------------------------------
   COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2') AND NVAL(D.COL1)  >=  1  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 =0    )  
    AND CU.FULL_CODE  LIKE '%'||'0100000'||';%' THEN D.CUIIO END) AS COL4,
    
  COUNT(DISTINCT CASE WHEN D.RIND LIKE ('1.5.%')  AND NVAL(D.COL1) >= 1  AND (DD.has_112 + DD.has_111 = 0  ) 
     AND CU.FULL_CODE  LIKE '%'||'0100000'||';%' THEN D.CUIIO END) AS COL5,
     
  COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')   AND NVAL(D.COL1) >= 1  
  
  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 > 0)  AND  (DD.has_112 + DD.has_111 > 0)
    AND CU.FULL_CODE  LIKE '%'||'0100000'||';%' THEN D.CUIIO END) 
   AS COL6,
   
   -----------------------------------------------------------------------------------
      COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2') AND NVAL(D.COL1)  >=  1  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 =0    )  
    AND CU.FULL_CODE  LIKE '%'||'1111111'||';%' THEN D.CUIIO END) AS COL7,
    
  COUNT(DISTINCT CASE WHEN D.RIND LIKE ('1.5.%')  AND NVAL(D.COL1) >= 1  AND (DD.has_112 + DD.has_111 = 0  ) 
     AND CU.FULL_CODE  LIKE '%'||'1111111'||';%' THEN D.CUIIO END) AS COL8,
     
  COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')   AND NVAL(D.COL1) >= 1  
  
  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 > 0)  AND  (DD.has_112 + DD.has_111 > 0)
    AND CU.FULL_CODE  LIKE '%'||'1111111'||';%' THEN D.CUIIO END) 
   AS COL9,
   
   -----------------------------------------------------------------------------------

 COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2') AND NVAL(D.COL1)  >=  1  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 =0    )  
    AND CU.FULL_CODE  LIKE '%'||'2222222'||';%' THEN D.CUIIO END) AS COL10,
    
  COUNT(DISTINCT CASE WHEN D.RIND LIKE ('1.5.%')  AND NVAL(D.COL1) >= 1  AND (DD.has_112 + DD.has_111 = 0  ) 
     AND CU.FULL_CODE  LIKE '%'||'2222222'||';%' THEN D.CUIIO END) AS COL11,
     
  COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')   AND NVAL(D.COL1) >= 1  
  
  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 > 0)  AND  (DD.has_112 + DD.has_111 > 0)
    AND CU.FULL_CODE  LIKE '%'||'2222222'||';%' THEN D.CUIIO END) 
   AS COL12,
   
      
   -----------------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------------

 COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2') AND NVAL(D.COL1)  >=  1  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 =0    )  
    AND CU.FULL_CODE  LIKE '%'||'3333333'||';%' THEN D.CUIIO END) AS COL13,
    
  COUNT(DISTINCT CASE WHEN D.RIND LIKE ('1.5.%')  AND NVAL(D.COL1) >= 1  AND (DD.has_112 + DD.has_111 = 0  ) 
     AND CU.FULL_CODE  LIKE '%'||'3333333'||';%' THEN D.CUIIO END) AS COL14,
     
  COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')   AND NVAL(D.COL1) >= 1  
  
  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 > 0)  AND  (DD.has_112 + DD.has_111 > 0)
    AND CU.FULL_CODE  LIKE '%'||'3333333'||';%' THEN D.CUIIO END) 
   AS COL15,
   
      
   -----------------------------------------------------------------------------------
   
     
      -----------------------------------------------------------------------------------

 COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2') AND NVAL(D.COL1)  >=  1  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 =0    )  
    AND CU.FULL_CODE  LIKE '%'||'9600000'||';%' THEN D.CUIIO END) AS COL16,
    
  COUNT(DISTINCT CASE WHEN D.RIND LIKE ('1.5.%')  AND NVAL(D.COL1) >= 1  AND (DD.has_112 + DD.has_111 = 0  ) 
     AND CU.FULL_CODE  LIKE '%'||'9600000'||';%' THEN D.CUIIO END) AS COL17,
     
  COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')   AND NVAL(D.COL1) >= 1  
  
  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 > 0)  AND  (DD.has_112 + DD.has_111 > 0)
    AND CU.FULL_CODE  LIKE '%'||'9600000'||';%' THEN D.CUIIO END) 
   AS COL18,
   
      
   -----------------------------------------------------------------------------------
   
   
   
 COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2') AND NVAL(D.COL1)  >=  1  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 =0    )  
    AND CU.FULL_CODE  LIKE '%'||'9900000'||';%' THEN D.CUIIO END) AS COL19,
    
  COUNT(DISTINCT CASE WHEN D.RIND LIKE ('1.5.%')  AND NVAL(D.COL1) >= 1  AND (DD.has_112 + DD.has_111 = 0  ) 
     AND CU.FULL_CODE  LIKE '%'||'9800000'||';%' THEN D.CUIIO END) AS COL20,
     
  COUNT(DISTINCT CASE WHEN D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')   AND NVAL(D.COL1) >= 1  
  
  AND (DD.has_151 + DD.has_152 + DD.has_153 + DD.has_154 + DD.has_155 + DD.has_156 + DD.has_157 > 0)  AND  (DD.has_112 + DD.has_111 > 0)
    AND CU.FULL_CODE  LIKE '%'||'9800000'||';%' THEN D.CUIIO END) 
   AS COL21
   
    
FROM 
  CIS2.VW_DATA_ALL D 
  
  ---------------------------------------------------------
  INNER JOIN (
  
  SELECT
  D.ANUL,
  D.CUIIO,
  D.CUIIO_VERS,
  D.CUATM,
  D.CAEM2,
  D.CAPITOL,
  D.RIND,
  D.COL1, 
  D.COL2,
  DD.has_111,
  DD.has_112,
  DD.has_151,
  DD.has_152,
  DD.has_153,
  DD.has_154,
  DD.has_155,
  DD.has_156,
  DD.has_157
FROM 
  CIS2.VW_DATA_ALL D
  
  INNER JOIN (
  SELECT
    CUIIO,
    MAX(CUIIO_VERS) CUIIO_VERS,

    MAX(CASE WHEN ID_MD = 83509 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_111,
    MAX(CASE WHEN ID_MD = 83504 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_112,
    MAX(CASE WHEN ID_MD = 83532 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_151,
    MAX(CASE WHEN ID_MD = 83533 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_152,
    MAX(CASE WHEN ID_MD = 83534 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_153,
    MAX(CASE WHEN ID_MD = 83535 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_154,
    MAX(CASE WHEN ID_MD = 83536 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_155,
    MAX(CASE WHEN ID_MD = 83537 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_156,
    MAX(CASE WHEN ID_MD = 83538 AND NVAL(COL1) = 1 THEN 1 ELSE 0 END) AS has_157
    

  FROM CIS2.DATA_ALL
  WHERE PERIOADA = :pPERIOADA
    AND FORM     = :pFORM
    AND 
    ID_MD IN (83509,83504,83532,83533,83534,83535,83536,83537,83538)
     
    
    
 
  GROUP BY 
    CUIIO
  
    

  ) DD ON DD.CUIIO = D.CUIIO AND DD.CUIIO_VERS = D.CUIIO_VERS  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND
  D.FORM IN (:pFORM) AND 
  D.capitol=1040 AND  capitol_vers=2013 AND 
  D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')
  AND D.CAEM2 NOT LIKE 'A%'
  --AND D.CUIIO = 400053
  

  ) DD ON DD.CUIIO = D.CUIIO AND DD.CUIIO_VERS = D.CUIIO_VERS  
  ------------------------------------------------------------  
             INNER JOIN  CIS2.VW_CL_CUATM  CU ON CU.CODUL = D.CUATM
  
            INNER JOIN (
            
SELECT *

FROM CIS2.VW_CL_CAEM2
WHERE 
SUBSTR(CODUL,1,1) IN ('B','C','D','E','H','J','K') OR 
SUBSTR(CODUL,1,3) IN ('G46','M71','M72','M73') 




) C ON C.CODUL = D.CAEM2


            INNER JOIN CIS2.VW_CL_CAEM2  CC ON  C.FULL_CODE LIKE '%'||CC.CODUL||';%'

           
WHERE
  D.PERIOADA IN (:pPERIOADA) AND
  D.FORM IN (:pFORM) AND 
 (D.RIND IN ('1.1.1','1.1.2','1.5.1','1.5.2','1.5.3','1.5.4','1.5.5','1.5.6','1.5.7')) 
  AND D.CAEM2 NOT LIKE 'A%'
  AND CC.CODUL LIKE '%00'
--  AND D.CUIIO = 458963
  GROUP BY
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE
  
  ORDER BY
  CC.FULL_CODE
  
  
 ) A
 
 )