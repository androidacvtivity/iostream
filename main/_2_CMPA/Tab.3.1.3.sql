SELECT 
--    :pPERIOADA AS PERIOADA,
--    :pFORM AS FORM,
--    :pFORM_VERS AS FORM_VERS,
--    :pID_MDTABLE AS ID_MDTABLE,
--    :pCOD_CUATM AS COD_CUATM,
--    '0' AS  NR_SECTIE,
--    '0' AS NUME_SECTIE,
--    '0' AS NR_SECTIE1,
--    '0' AS NUME_SECTIE1,
--    '0' AS NR_SECTIE2,
--    '0' AS NUME_SECTIE2,  
      COL1||'~'||ROWNUM AS NR_ROW,  
      ROWNUM AS ORDINE,
     '000000000' AS DECIMAL_POS,
     REPLACE(REPLACE(DENUMIRE, '<br>'),'</br>') AS NUME_ROW,
ROUND(COL2,0) COL1, 
ROUND(COL3,0) COL2, 
ROUND(COL4,0) COL3,  
ROUND(COL5,0) COL4, 
ROUND(COL6,0) COL5, 
ROUND(COL7,0) COL6, 
ROUND(COL8,0) COL7, 
ROUND(COL9,0) COL8, 
ROUND(COL10,0) COL9



FROM
(

SELECT
--     CC.CODUL NR_SECTIE ,
--     CC.DENUMIRE NUME_SECTIE, 
--     CC.FULL_CODE,
     MR.ORDINE,
     MR.RIND,
     MR.DENUMIRE,       
     SUM( D.COL1) AS COL1,     
     SUM( D.COL3) AS COL2,   
     SUM( D.COL4) AS COL3, 
     SUM( D.COL6) AS COL4, 
     SUM( D.COL7) AS COL5, 
     SUM( D.COL9) AS COL6, 
     SUM( D.COL11) AS COL7, 
     SUM( D.COL13) AS COL8, 
     SUM( D.COL15) AS COL9, 
     SUM( D.COL16) AS COL10 


        FROM CIS2.DATA_ALL_GC D 
                 
     
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                  
                INNER JOIN CIS2.REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN CIS2.VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
               -- INNER JOIN CIS2.VW_CL_CUATM CC ON CT.FULL_CODE LIKE '%'||CC.CODUL||';%'   
                    

            WHERE 
                        
               
                --  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.PERIOADA IN (:pPERIOADA))  AND   
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (416)
  
                --   AND CC.PRGS IN (2)
                   AND D.UNIT_CODE IN (
                    SELECT FC.UNIT_CODE
                  
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  
 
            SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (62) AND UNIT_CODE_VERS <= :pPERIOADA
                               GROUP BY UNIT_CODE
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
             WHERE FC.FORM IN (62) AND FC.STATUT <> '3'
                   
                   )

                   GROUP BY 
--                  CC.CODUL,
--                  CC.DENUMIRE, 
--                  CC.FULL_CODE,
                  MR.ORDINE,
                  MR.RIND,
                  MR.DENUMIRE    
                 
            
            UNION  
        
   SELECT
--     CC.CODUL NR_SECTIE ,
--     CC.DENUMIRE NUME_SECTIE, 
--     CC.FULL_CODE,
    17.2 ORDINE,
     '043' RIND,
     'Ovine si Caprine - total' DENUMIRE,         
     SUM( D.COL1) AS COL1,     
     SUM( D.COL3) AS COL2,   
     SUM( D.COL4) AS COL3, 
     SUM( D.COL6) AS COL4, 
     SUM( D.COL7) AS COL5, 
     SUM( D.COL9) AS COL6, 
     SUM( D.COL11) AS COL7, 
     SUM( D.COL13) AS COL8, 
     SUM( D.COL15) AS COL9, 
     SUM( D.COL16) AS COL10 


        FROM CIS2.DATA_ALL_GC D 
                 
     
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                  
                INNER JOIN CIS2.REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN CIS2.VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
            --    INNER JOIN CIS2.VW_CL_CUATM CC ON CT.FULL_CODE LIKE '%'||CC.CODUL||';%'   
                    

            WHERE 
                        
               
                 -- (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.PERIOADA IN (:pPERIOADA))  AND   
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (416)
  
               --    AND CC.PRGS IN (2)
                   AND MR.RIND IN ('030','040')

                
                   AND D.UNIT_CODE IN (
                    SELECT FC.UNIT_CODE
                  
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  
 
            SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (62) AND UNIT_CODE_VERS <= :pPERIOADA
                               GROUP BY UNIT_CODE
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
             WHERE FC.FORM IN (62) AND FC.STATUT <> '3'
                   
                   )
                  
                  UNION  
        
   SELECT
--     CC.CODUL NR_SECTIE ,
--     CC.DENUMIRE NUME_SECTIE, 
--     CC.FULL_CODE,
      27.2 ORDINE,
     '092' RIND,
     'Pasari - total' DENUMIRE,       
     SUM( D.COL1) AS COL1,     
     SUM( D.COL3) AS COL2,   
     SUM( D.COL4) AS COL3, 
     SUM( D.COL6) AS COL4, 
     SUM( D.COL7) AS COL5, 
     SUM( D.COL9) AS COL6, 
     SUM( D.COL11) AS COL7, 
     SUM( D.COL13) AS COL8, 
     SUM( D.COL15) AS COL9, 
     SUM( D.COL16) AS COL10 


        FROM CIS2.DATA_ALL_GC D 
                 
     
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                  
                INNER JOIN CIS2.REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN CIS2.VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
              --  INNER JOIN CIS2.VW_CL_CUATM CC ON CT.FULL_CODE LIKE '%'||CC.CODUL||';%'   
                    

            WHERE 
                        
               
                  --- (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.PERIOADA IN (:pPERIOADA))  AND   
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (416)
  
                --   AND CC.PRGS IN (2)
                    AND MR.RIND IN ('060','070','080','090')
 AND D.UNIT_CODE IN (
                    SELECT FC.UNIT_CODE
                  
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  
 
            SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (62) AND UNIT_CODE_VERS <= :pPERIOADA
                               GROUP BY UNIT_CODE
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
             WHERE FC.FORM IN (62) AND FC.STATUT <> '3'
                   
                   )
                  
                  ORDER BY 
  
  ORDINE
  )

 