SELECT 
2 ORDINE,
CC.FULL_CODE,
CC.DENUMIRE,
CC.CODUL CODUL_NEMOD,

CASE  WHEN SUBSTR(CC.CODUL, -4) = '0000' THEN SUBSTR(CC.CODUL, 1, 1)
    ELSE CC.CODUL END CODUL, 
ROUND(SUM(DD.COL0),0) AS COL1,
ROUND(SUM(DD.COL1),0) AS COL2,
ROUND(SUM(DD.COL2),1) AS COL3,
ROUND(SUM(DD.COL3),1) AS COL4,
ROUND(SUM(DD.COL4),1) AS COL5

FROM
   (
SELECT 
 
 DISTINCT D.CUIIO, 


--
CASE WHEN MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END ) IS NULL 
 THEN    MAX(SUBSTR(D.CAEM2,2,4))  ELSE MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END ) END 
 
 AS CAEM2_ACTUALIZAT,
--
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2,
 

-- 
 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD')  THEN  D.COL1 ELSE 0 END))  AS COL0,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  CIS2.NVAL(D.COL4) END))  AS COL1,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150') THEN  CIS2.NVAL(D.COL1) END))  AS COL2,
  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150','160','170') THEN  CIS2.NVAL(D.COL1) END))- 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN CIS2.NVAL(D.COL1) END))+
(
 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL2) - CIS2.NVAL(D.COL1) END))


 
 
 )+
 
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL1) END)))  AS COL3,
  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150','160','170') THEN  CIS2.NVAL(D.COL1) END))- 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN CIS2.NVAL(D.COL1) END))+
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL1) END)))+
 
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL1) END)))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('220') THEN CIS2.NVAL(D.COL1) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('240') THEN CIS2.NVAL(D.COL1) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('290') THEN CIS2.NVAL(D.COL1) END))+
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('294') THEN CIS2.NVAL(D.COL1) END))+
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('180') THEN CIS2.NVAL(D.COL1) END))   AS COL4,
 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END))  AS CD
 
FROM   
    CIS2.VW_DATA_ALL D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
 -- D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
 D.CAPITOL IN (100,1123,1124,1125,1126,1127,1128,1129) 
  
AND  D.CUIIO=40856685
 GROUP BY 
 D.CUIIO

 
HAVING
--  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)) >  0
 
 ) DD
 

  
  INNER JOIN CIS2.VW_CL_CAEM2  C ON SUBSTR(C.CODUL,2,4)  = DD.CAEM2_ACTUALIZAT 

  
  INNER JOIN  CIS2.VW_CL_CAEM2 CC ON  (C.FULL_CODE LIKE '%'||CC.CODUL||';%') 
  
 
  
   
   
   GROUP BY
   CC.FULL_CODE,
    CC.DENUMIRE,
   CC.CODUL
   
   
   ORDER BY 
   ORDINE,
   
   FULL_CODE