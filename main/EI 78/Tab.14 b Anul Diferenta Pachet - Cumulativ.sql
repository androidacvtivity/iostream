--DECLARE
--
--  CURSOR C IS
--
--SELECT 
--    DF.PERIOADA,
--    DF.FORM,
--    DF.FORM_VERS,
--    DF.ID_MDTABLE,
--    DF.COD_CUATM,
--    DF.NR_SECTIE,
--    DF.NUME_SECTIE,
--    DF.NR_SECTIE1,
--    DF.NUME_SECTIE1,
--    DF.NR_SECTIE2,
--    DF.NUME_SECTIE2,
--    DF.NR_ROW NR_ROW,
--    DF.ORDINE,
--    DF.DECIMAL_POS,
--    DF.NUME_ROW,
--    DF.COL1,
--    DF.COL2,
--    DF.COL3,
--    DF.COL4,
--    DF.COL5
--   
--   
--   FROM 
--(


SELECT 
--    :pPERIOADA AS PERIOADA,
--    :pFORM AS FORM,
--    :pFORM_VERS AS FORM_VERS,
--    :pID_MDTABLE AS ID_MDTABLE,
--    :pCOD_CUATM AS COD_CUATM,
--    '0' AS NR_SECTIE,
--   '0' AS  NUME_SECTIE,
--    '0' AS NR_SECTIE1,
--    '0' AS NUME_SECTIE1,
--    '0' AS NR_SECTIE2,
--    '0' AS NUME_SECTIE2,
     CUIIO||'-'||ITEM_CODE||'~'||ROWNUM NR_ROW,
     ROWNUM  AS ORDINE,
     '00000' AS DECIMAL_POS,
     CUIIO||'-'||DENUMIRE NUME_ROW,

     
        PACHET     COL1,
     REPLACE(ITEM_CODE,'.','')   COL2,
   
    
     COL1 COL3,
     COL2 COL4,
     COL3 COL5
     FROM


(
SELECT 
   D.CUIIO,
   MAX(D.DENUMIRE) DENUMIRE,
   L.PACHET,
   D.ITEM_CODE, 
   D.NAME,
   SUM(D.COL1) AS COL1,
   SUM(D.COL2) AS COL2,
   NVAL(SUM(D.COL1)) - NVAL(SUM(D.COL2)) AS COL3
   
   FROM
(
SELECT
   D.CUIIO,
   MAX(R.DENUMIRE) DENUMIRE,
   MAX(D.PACHET)  PACHET,
   CI.ITEM_CODE, 
   CI.NAME,
  SUM(CASE WHEN (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA) AND  D.CAPITOL IN (405) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL1,
  SUM(CASE WHEN (D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4) AND  D.CAPITOL IN (405) AND D.RIND NOT IN ('1','-')  THEN NVAL(D.COL4) ELSE 0 END) AS COL2


FROM
  CIS2.VW_DATA_ALL D 
  INNER JOIN CIS2.RENIM R ON R.CUIIO =  D.CUIIO AND R.CUIIO_VERS =  D.CUIIO_VERS 
  INNER JOIN  CIS2.VW_CLS_CLASS_ITEM CI  ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))

WHERE 
 -- (D.PERIOADA IN(:pPERIOADA, :pPERIOADA-4)) AND    
    ((D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA) OR (D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4))  AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
   D.FORM IN (44)
   AND  D.CAPITOL IN (405) 
  AND D.CUIIO = 41180391
   
GROUP BY
  D.CUIIO,
 -- D.PACHET,
  CI.ITEM_CODE,
  CI.NAME
  
  
  
  
  
  ORDER BY 
  D.CUIIO,
  CI.ITEM_CODE
  
  ) D LEFT JOIN (
 SELECT
  DISTINCT  D.CUIIO,
                    MAX(D.PACHET) AS PACHET
                    FROM CIS2.VW_DATA_ALL  D 
                                INNER JOIN MD_RIND  R ON R.ID_MD = D.ID_MD 
                    
                    WHERE 
                    D.FORM = 44
                    AND D.PERIOADA IN(:pPERIOADA)
                    
                    
                       AND (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') 
                 
                      AND D.CUIIO = 41180391
                    
                    GROUP BY 
                    D.CUIIO
  
 ) L ON L.CUIIO = D.CUIIO  
 
 
 GROUP BY 
   D.CUIIO,
 --  D.DENUMIRE,
   L.PACHET,
   D.ITEM_CODE, 
   D.NAME
   
   HAVING 
   
   NVAL(SUM(D.COL1)) - NVAL(SUM(D.COL2)) > 500000 
   OR 
   NVAL(SUM(D.COL2)) - NVAL(SUM(D.COL1)) > 500000

  ORDER BY 
  CUIIO,
  ITEM_CODE
  )
  

--) DF
--
--;
--   
--    BEGIN
--
--  FOR CR IN C
--  
--  LOOP
--    INSERT INTO -- USER_BANCU.TABLE_OUT_TEST 
--    
--     CIS2.TABLE_OUT
--    (
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
--       
--      COL1, COL2, COL3,  COL4, COL5
--    )
--    VALUES
--    (
--      CR.PERIOADA,
--      CR.FORM,
--      CR.FORM_VERS,
--      CR.ID_MDTABLE,
--      CR.COD_CUATM,
--      CR.NR_SECTIE,
--      CR.NUME_SECTIE,
--      CR.NR_SECTIE1,
--      CR.NUME_SECTIE1,
--      CR.NR_SECTIE2,
--      CR.NUME_SECTIE2,
--      CR.NR_ROW,
--      CR.ORDINE,
--      CR.DECIMAL_POS,
--      CR.NUME_ROW,
--       
--      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5
--    );
--  END LOOP;
--END;