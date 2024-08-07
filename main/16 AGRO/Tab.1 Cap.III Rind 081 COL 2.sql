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
-- COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,COL12,COL13,COL14,COL15,COL16
--)

SELECT 
--  :pPERIOADA AS PERIOADA,
--  :pFORM AS FORM,
--  :pFORM_VERS AS FORM_VERS,
--  :pID_MDTABLE AS ID_MDTABLE,
--  :pCOD_CUATM AS COD_CUATM,
--  
--  '0' AS NR_SECTIE,
--  '0' AS NUME_SECTIE,
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
--  
 
               
  MR.RIND AS NR_ROW,
  MR.ORDINE AS ORDINE,
  '0000000000000000' AS DECIMAL_POS,
  REPLACE(REPLACE(REPLACE(MR.DENUMIRE,'<br>'),'nbsp'),'&;') AS NUME_ROW,
  SUM(D.COL1) AS COL1,
  SUM(D.COL2) AS COL2,
  SUM(D.COL3) AS COL3,
  SUM(D.COL4) AS COL4,
  SUM(D.COL5) AS COL5,
  SUM(D.COL6) AS COL6,
  SUM(D.COL7) AS COL7,
  SUM(D.COL8) AS COL8,
  SUM(D.COL9) AS COL9,
  SUM(D.COL10) AS COL10,
  SUM(D.COL11) AS COL11,
  SUM(D.COL12) AS COL12,
  SUM(D.COL13) AS COL13,
  SUM(D.COL14) AS COL14,
  SUM(D.COL15) AS COL15,
  SUM(D.COL16) AS COL16
                    FROM 

(
SELECT 
                MR.RIND,
                MR.RIND_VERS,
                MR.DENUMIRE,
                MR.ORDINE
                
                    FROM CIS2.MD_RIND MR
                    WHERE
                    MR.FORM = 36
                    AND MR.CAPITOL_VERS = 2012
                    AND capitol = 387
                    AND STATUT = '1'
                    
                    ORDER BY
                    MR.ORDINE 
                    
                    
                    
                    ) MR LEFT JOIN (
                    
                    SELECT
                     MR.RIND,
                     MR.RIND_VERS,
                    SUM(D.COL1) AS COL1,
  SUM(D.COL2) AS COL2,
  SUM(D.COL3) AS COL3,
  SUM(D.COL4) AS COL4,
  SUM(D.COL5) AS COL5,
  SUM(D.COL6) AS COL6,
  SUM(D.COL7) AS COL7,
  SUM(D.COL8) AS COL8,
  SUM(D.COL9) AS COL9,
  SUM(D.COL10) AS COL10,
  SUM(D.COL11) AS COL11,
  SUM(D.COL12) AS COL12,
  SUM(D.COL13) AS COL13,
  SUM(D.COL14) AS COL14,
  SUM(D.COL15) AS COL15,
  SUM(D.COL16) AS COL16
FROM 
  VW_DATA_ALL D
  INNER JOIN MD_RIND MR ON (D.ID_MD=MR.ID_MD )
  INNER JOIN RENIM RE ON (D.CUIIO=RE.CUIIO AND D.CUIIO_VERS=RE.CUIIO_VERS) 
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
--  D.CAPITOL_VERS = 2012 AND  
  D.FORM IN (36)                 AND 
  D.CAPITOL IN (387) 
GROUP BY
  MR.RIND,
  MR.DENUMIRE,
  MR.ORDINE,
  MR.RIND_VERS
                    ) D ON D.RIND = MR.RIND 
                    
                    
                    
                    GROUP BY
  MR.RIND,
  MR.DENUMIRE,
  MR.ORDINE,
  MR.RIND_VERS
  
  ORDER BY
  MR.ORDINE