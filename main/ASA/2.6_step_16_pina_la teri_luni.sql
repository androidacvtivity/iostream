SELECT 
SUM(DD.COL0) AS COL1,
 SUM( CASE WHEN (DD.PERS BETWEEN 0 AND 9 OR DD.PERS IS NULL )  THEN COL0 ELSE 0 END ) AS COL2
FROM 
(
SELECT 
  
 DISTINCT D.CUIIO, 
   CASE WHEN MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END ) IS NULL THEN  MAX(SUBSTR(D.CAEM2,2,4)) 
   ELSE MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END )  END AS CAEM2_ACTUALIZAT,
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2,
 D.CUIIO_VERS, 
 D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD')  THEN  D.COL1 ELSE 0 END))  AS COL0,

 
 (SELECT  CASE WHEN DD.COL4 IS NOT NULL THEN DD.COL4 ELSE 0 END 
 FROM
   CIS2.DATA_ALL DD
 WHERE
   DD.PERIOADA IN (D.PERIOADA) AND
   DD.FORM=D.FORM AND
   DD.ID_MD IN (69986) AND
   DD.CUIIO IN (D.CUIIO)) AS PERS
 ----------------------------------------------------------------------------------------------
FROM   
    CIS2.VW_DATA_ALL_COEF D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (100,1123,1124,1125,1126,1127,1128,1129) 
 AND D.CUIIO IN (26844)


 GROUP BY D.CUIIO, D.CUIIO_VERS, D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA
 
HAVING
--  
 (CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)) >0
  AND 
 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('1','5') THEN  D.COL1 ELSE 0 END)) > 0 )
 
  
 
 AND
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD')  THEN  D.COL1 ELSE 0 END))   BETWEEN 0 AND 3 
 ) DD
 
 