SELECT 
2 ORDINE,
C.FULL_CODE,
C.DENUMIRE,
C.CODUL CODUL_NEMOD,

CASE  WHEN SUBSTR(C.CODUL, -4) = '0000' THEN SUBSTR(C.CODUL, 1, 1)
    ELSE C.CODUL END CODUL, 
ROUND(SUM(DD.COL0),0) AS COL1,
ROUND(SUM(DD.COL1),0) AS COL2


FROM
   (
SELECT 
 
 DISTINCT D.CUIIO, 
--
CASE WHEN MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END ) IS NULL 
 THEN    MAX(SUBSTR(D.CAEM2,2,4))  ELSE MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END ) END   AS CAEM2_ACTUALIZAT,

MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD')  THEN  D.COL1 ELSE 0 END))  AS COL0,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  CIS2.NVAL(D.COL4) END))  AS COL1

FROM   
    CIS2.VW_DATA_ALL_COEF D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
 -- D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
 D.CAPITOL IN (100,1123,1124,1125,1126,1127,1128,1129) 
  

 GROUp BY  
 D.CUIIO

 
HAVING
--  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)) >  0
 
 ) DD
 
--  INNER JOIN CIS2.RENIM R ON R.CUIIO = DD.CUIIO AND R.CUIIO_VERS = DD.CUIIO_VERS  
 
--  INNER JOIN CIS2.VW_CL_CAEM2 C ON SUBSTR( C.CODUL,2,4)  = CASE WHEN DD.CAEM2_ACTUALIZAT IS NULL THEN DD.CAEM2 ELSE DD.CAEM2_ACTUALIZAT END
  
  INNER JOIN CIS2.VW_CL_CAEM2 C ON SUBSTR( C.CODUL,2,4)  = DD.CAEM2_ACTUALIZAT 
  --IS NULL THEN DD.CAEM2 ELSE DD.CAEM2_ACTUALIZAT END
  
--  RIGHT JOIN  (
--  
--  
--  SELECT 
--CODUL, 
--DENUMIRE,
--SUBSTR(CC.CODUL,1,3) AS CODUL_MODIF,
--FULL_CODE
--
--FROM CIS2.VW_CL_CAEM2 CC
--
--WHERE 
--
--(SUBSTR(CC.CODUL,1,3) IN ('B05','B06','B07','B08','B09',
--'C10','C11','C12','C13','C14','C15','C16','C17','C18','C19','C20','C21','C22','C23','C24','C25','C26','C27','C28','C29','C30','C31','C32','C33',
--'D35',
--'E36','E37','E38','E39',
--'F41','F42','F43',
--'G45','G46','G47','G48',
--'H49','H50','H51','H52','H53',
--'I55','I56',
--'J58','J59','J60','J61','J62','J63',
--'M69','M70','M71','M72','M73','M74','M75',
--'N77','N78','N79','N80','N81','N82',
--'S94','S95','S96',
--'L68'
--) 
--
--AND CC.CODUL LIKE '%00')
--
--OR  CC.CODUL IN  ('B0000','C0000','D0000','E0000','F0000','G0000','H0000','I0000','J0000','L0000','M0000','N0000','S0000')
-- 
--
--
--  ) CC ON  (C.FULL_CODE LIKE '%'||CC.CODUL||';%') 
  
   
WHERE 
 C.CODUL LIKE 'C%'   

   GROUP BY
    C.FULL_CODE,
    C.DENUMIRE,
   C.CODUL
   
   
   ORDER BY 
   ORDINE,
   
   FULL_CODE