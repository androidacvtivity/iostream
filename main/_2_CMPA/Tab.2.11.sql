SELECT 

    COUNT(DISTINCT CASE WHEN MR.RIND IN ('0')  THEN D.UNIT_CODE  ELSE NULL END) AS COL1,
    COUNT(DISTINCT CASE WHEN MR.RIND IN ('TIP2', 'TIP3')  THEN D.UNIT_CODE  ELSE NULL END) AS COL2,
    COUNT(DISTINCT CASE WHEN MR.RIND IN ('TIP3')  THEN D.UNIT_CODE  ELSE NULL END) AS COL2,
    COUNT(DISTINCT CASE WHEN MR.RIND IN ('TIP2')  THEN   D.UNIT_CODE  ELSE NULL END) AS COL3,
    COUNT(DISTINCT CASE WHEN MR.RIND NOT IN ('TIP2', 'TIP3','0','CD')  THEN   D.UNIT_CODE  ELSE NULL END) AS COL4
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD

WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (419)
 
  
--  AND 
--  (CC.CODUL NOT LIKE '%01' AND  CC.CODUL NOT LIKE '%02' AND  CC.CODUL NOT LIKE '%03'AND  CC.CODUL NOT LIKE '%04')   
---- AND CC.PRGS NOT IN ('5')
-- 
-- AND CC.CODUL NOT IN ('0110000','0120000','0130000','0140000','0150000')
--GROUP BY
--
--    CC.CODUL,
--    CC.DENUMIRE,
--    CC.FULL_CODE
    
    
--    UNION 
--    
--    SELECT 
--    CC.CODUL,
--    CC.DENUMIRE,
--    CC.FULL_CODE,
--    COUNT(DISTINCT CASE WHEN MR.RIND IN ('0')  THEN D.UNIT_CODE  ELSE NULL END) AS COL1,
--    COUNT(DISTINCT CASE WHEN MR.RIND IN ('TIP3')  THEN D.UNIT_CODE  ELSE NULL END) AS COL2,
--    COUNT(DISTINCT CASE WHEN MR.RIND IN ('TIP2')  THEN   D.UNIT_CODE  ELSE NULL END) AS COL3,
--    COUNT(DISTINCT CASE WHEN MR.RIND NOT IN ('TIP2', 'TIP3','0')  THEN   D.UNIT_CODE  ELSE NULL END) AS COL4
--FROM
--  VW_DATA_ALL_GC  D
--  INNER JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
--  INNER JOIN VW_CL_CUATM C ON(D.CUATM = C.CODUL)
--  INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||';%'   
--WHERE
--  (D.PERIOADA IN (:pPERIOADA))  AND   
--  (D.FORM =:pFORM) AND
--  (D.FORM_VERS =:pFORM_VERS) AND 
--  (:pID_MDTABLE =:pID_MDTABLE) AND
--  D.FORM IN (58)  AND
--  D.CAPITOL IN (419)
--  AND (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') 
-- AND CC.PRGS  IN ('9')
--GROUP BY
--
--    CC.CODUL,
--    CC.DENUMIRE,
--    CC.FULL_CODE
    
    
--    ORDER BY 
--    FULL_CODE