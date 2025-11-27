--INSERT INTO TABLE_OUT
--(
--
--
--      PERIOADA,
--      FORM,
--      FORM_VERS,
--
--      ID_MDTABLE,
--      COD_CUATM,
--      NR_SECTIE,
--      NUME_SECTIE,
--      NR_SECTIE1,
--      NUME_SECTIE1,
--      NR_SECTIE2,
--      NUME_SECTIE2,
--      NR_ROW,
--      ORDINE,
--      DECIMAL_POS,
--      NUME_ROW,   
--         COL1,
--         COL2,
--         COL3,
--         COL4,
--         COL5,
--         COL6,
--         COL7,
--         COL8,
--         COL9,
--         COL10,
--         COL11,
--         COL12
--        
--
--
--)
--



SELECT 
 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    '0'   AS NR_SECTIE,
    '0' AS NUME_SECTIE, 
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2, 
     MR.RIND   AS NR_ROW,
     MR.ORDINE   AS ORDINE,
    '000000000000' AS DECIMAL_POS,
     TRIM(MR.DENUMIRE) NUME_ROW,
     SUM(D.COL1)   COL1,
     SUM(D.COL2)   COL2,
     SUM(D.COL3)   COL3,
     SUM(D.COL4)   COL4,
     SUM(D.COL5)   COL5,
     SUM(D.COL6)   COL6,
     SUM(D.COL7)   COL7,
     SUM(D.COL8)   COL8,
     SUM(D.COL9)   COL9,
     SUM(D.COL10)  COL10,
     SUM(D.COL11)  COL11,
     SUM(D.COL12)  COL12
      
     
FROM   CIS2.VW_DATA_ALL D 

    INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)



WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
  D.FORM = 49 AND 
  D.CAPITOL IN (1049) 
  
  
  AND 
  
  (
  D.RIND IN ('010','020','030','035','040','050','060','070')
  
  
  OR 
  
  D.RIND IN 
  ( 
  SELECT 
  
  CODUL
  
  FROM CIS2.CL_TARI_CS ) 
  )
  
   


  GROUP BY 
  
  MR.RIND,
  MR.DENUMIRE,
  MR.ORDINE
  


   ORDER BY 
   MR.ORDINE  

   
