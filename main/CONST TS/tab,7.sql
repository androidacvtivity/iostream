--INSERT INTO TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,
--  
--  COL1, COL2, COL3, COL4
--)

---------------------------------------------------------------------------------
SELECT 
--  :pPERIOADA AS PERIOADA,
--  :pFORM AS FORM,
--  :pFORM_VERS AS FORM_VERS,
--  :pID_MDTABLE AS ID_MDTABLE,
--  :pCOD_CUATM AS COD_CUATM,
--  
--         
--  '0' AS NR_SECTIE,
--  '0' AS NUME_SECTIE,
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
   R.RIND AS NR_ROW,
   TO_NUMBER(R.RIND) AS ORDINE,
  '1111' AS DECIMAL_POS,
   R.DENUMIRE AS NUME_ROW,      
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN D.COL1 END) AS COL1,  
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-12) THEN D.COL1 END) AS COL2, 
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN D.COL3 END) AS COL3,
   NULL AS COL4          
  
  
FROM 
   -- VW_DATA_ALL_COEF D
    VW_DATA_ALL D
  --INNER JOIN RENIM RN ON (D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS)
  --INNER JOIN VW_CL_CUATM CC ON(RN.CUATM = CC.CODUL) 
  INNER JOIN MD_RIND R ON D.ID_MD=R.ID_MD
  --INNER JOIN MD_FORM F ON  F.FORM=R.FORM AND D.FORM=F.FORM
 
WHERE
  D.FORM IN (2)              AND -- CONST TS  
  D.FORM_VERS = :PFORM_VERS  AND    
  D.CAPITOL IN (6)           AND -- CAP VLC 
  D.CUATM_FULL LIKE  '%'||:pCOD_CUATM||';%'AND
  D.PERIOADA IN (:pPERIOADA,:pPERIOADA-12)
 
  
GROUP BY
   R.DENUMIRE,R.RIND, D.FORM, D.CAPITOL
ORDER BY
   R.RIND