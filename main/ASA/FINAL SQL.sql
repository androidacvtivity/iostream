SELECT 
CODUL||'  '||DENUMIRE  DENUMIRE,
COL1,
COL2,
COL3,
COL4
 
FROM  
(

SELECT 
CC.FULL_CODE,
CC.DENUMIRE,
--CC.CODUL,

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
 MAX( CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END )  AS CAEM2_ACTUALIZAT,
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2,
 D.CUIIO_VERS, D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD')  THEN  D.COL1 ELSE 0 END))  AS COL0,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  CIS2.NVAL(D.COL4) END))  AS COL1,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150') THEN  CIS2.NVAL(D.COL1) END))  AS COL2,
  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150','160','170') THEN  CIS2.NVAL(D.COL1) END))- 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN CIS2.NVAL(D.COL1) END))+
(CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL2) END))-
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL1) END)))+
 
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
    CIS2.VW_DATA_ALL_COEF D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (100,1123,1124,1125,1126,1127,1128,1129) 
  
--  AND D.CUIIO IN (
--  20215033,
--20214306,
--37701312,
--15829566,
--40240547,
--40676836,
--40706129,
--40767680,
--40137743,
--297655,
--40263005,
--40235776,
--41080318,
--40256689,
--40764954,
--38621785,
--15801941,
--40173673,
--20168210,
--37294404,
--40041799,
--40706106,
--40524322,
--40504851,
--15828130,
--41245096,
--40923246,
--38590107,
--15786756,
--4574407,
--40311448,
--40727386,
--40844498,
--40973592,
--4509686,
--37708018,
--15858912,
--37721912,
--37776942,
--6808387,
--40532675,
--40263844,
--40821882,
--20271764,
--37525789,
--38651728,
--3596163,
--9775292,
--6809487,
--37718465,
--41042743,
--40073523,
--40991934,
--38974035,
--38843333,
--40977791,
--15809078,
--15861239,
--38584156,
--4506423,
--297744,
--41244760,
--3001678,
--28403679,
--15802647,
--40269982,
--38908937,
--38994763,
--38965622,
--15858711,
--3466549,
--40458660,
--38972102,
--2746028,
--37589989,
--38421945,
--15842489,
--38764970,
--3596200
--  
--  
--  )

 GROUP BY D.CUIIO, D.CUIIO_VERS, D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA
 
HAVING
--  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)) >0
 
 ) DD
 
--  INNER JOIN CIS2.RENIM R ON R.CUIIO = DD.CUIIO AND R.CUIIO_VERS = DD.CUIIO_VERS  
 
  INNER JOIN CIS2.VW_CL_CAEM2 C ON SUBSTR( C.CODUL,2,4)  = CASE WHEN DD.CAEM2_ACTUALIZAT IS NULL THEN DD.CAEM2 ELSE DD.CAEM2_ACTUALIZAT END
  RIGHT JOIN  (
  SELECT CC.*

FROM CIS2.VW_CL_CAEM2 CC

WHERE 

(CC.CODUL LIKE 'B05%' 
  OR 
  CC.CODUL LIKE 'B06%'
  OR 
  CC.CODUL LIKE 'B07%'
  OR 
  CC.CODUL LIKE 'B08%'
   OR 
  CC.CODUL LIKE 'B09%'
  
  OR 
  CC.CODUL LIKE 'B0000%'
  
  
  
  OR 
  
  
              (CC.CODUL LIKE 'C%'  
              
              AND 
              
              CC.CODUL LIKE '%00')
              
              OR 
              
              (CC.CODUL LIKE 'D%'  
              
              AND 
              
              CC.CODUL LIKE '%00')
              OR 
              
              (CC.CODUL LIKE 'D%'  
              
              AND 
              
              CC.CODUL LIKE '%00')
              
              OR 
              
              (CC.CODUL LIKE 'E%'  
              
              AND 
              
              CC.CODUL LIKE '%00')
              
              
               OR 
              
              (CC.CODUL LIKE 'F%'  
              
              AND 
              
              CC.CODUL LIKE '%00')
              
              
               OR 
              
              (CC.CODUL LIKE 'G%'  
              
              AND 
              
              CC.CODUL LIKE '%00')
              
              
              OR 
              
              (CC.CODUL LIKE 'H%'  
              
              AND 
              
              CC.CODUL LIKE '%00')
  ) 
  
  AND 
  
  (CC.CODUL LIKE '%00' 
  
  --OR CC.CODUL LIKE '%B0000'
  
  )   
  
  AND CC.PRIM IN (0)
  ) CC ON  (C.FULL_CODE LIKE '%'||CC.CODUL||';%') 
  
  
--  WHERE 
--  
--  (CC.CODUL LIKE 'B05%' 
--  OR 
--  CC.CODUL LIKE 'B06%'
--  OR 
--  CC.CODUL LIKE 'B07%'
--  OR 
--  CC.CODUL LIKE 'B08%'
--   OR 
--  CC.CODUL LIKE 'B09%'
--  
--  OR 
--  CC.CODUL LIKE 'B0000%'
--  
--  
--  
--  OR 
--  
--  
--              (CC.CODUL LIKE 'C%'  
--              
--              AND 
--              
--              CC.CODUL LIKE '%00')
--              
--              OR 
--              
--              (CC.CODUL LIKE 'D%'  
--              
--              AND 
--              
--              CC.CODUL LIKE '%00')
--              OR 
--              
--              (CC.CODUL LIKE 'D%'  
--              
--              AND 
--              
--              CC.CODUL LIKE '%00')
--              
--              OR 
--              
--              (CC.CODUL LIKE 'E%'  
--              
--              AND 
--              
--              CC.CODUL LIKE '%00')
--              
--              
--               OR 
--              
--              (CC.CODUL LIKE 'F%'  
--              
--              AND 
--              
--              CC.CODUL LIKE '%00')
--              
--              
--               OR 
--              
--              (CC.CODUL LIKE 'G%'  
--              
--              AND 
--              
--              CC.CODUL LIKE '%00')
--              
--              
--              OR 
--              
--              (CC.CODUL LIKE 'H%'  
--              
--              AND 
--              
--              CC.CODUL LIKE '%00')
--  ) 
--  
--  AND 
--  
--  (CC.CODUL LIKE '%00' 
--  
--  --OR CC.CODUL LIKE '%B0000'
--  
--  )   
--  
--  AND CC.PRIM IN (0)
  
  
  
  
     GROUP BY
   CC.FULL_CODE,
    CC.DENUMIRE,
   CC.CODUL
   
   
   ORDER BY 
   
   CC.FULL_CODE
   
   
   )