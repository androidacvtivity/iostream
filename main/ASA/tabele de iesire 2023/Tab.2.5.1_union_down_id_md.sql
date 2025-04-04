--SELECT 
--:pPERIOADA AS PERIOADA,
--:pFORM AS FORM,
--:pFORM_VERS AS FORM_VERS,
--:pID_MDTABLE AS ID_MDTABLE,
--:pCOD_CUATM AS COD_CUATM,    
--'0' AS  NR_SECTIE,
--'0' AS NUME_SECTIE,
--'0' AS NR_SECTIE1,
--'0' AS NUME_SECTIE1,
--'0' AS NR_SECTIE2,
--'0' AS NUME_SECTIE2, 
--NR_ROW||'~'|| NR_SECTIE||COL1||'2' AS NR_ROW,
--2||ORDINE AS ORDINE,
--'00000000000000000000000000000000000000000000000000' AS DECIMAL_POS,
--NUME_ROW,
--COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19,
--    COL20, COL21, COL22,COL23,COL24,COL25,COL26,COL27,COL28,COL29,COL30, COL31, COL32, COL33, COL34, COL35, COL36, COL37, COL38, COL39, COL40,
--    COL41, COL42,COL43,COL44,COL45,COL46,COL47,COL48,COL49,COL50
--FROM
--(
 SELECT
D.CODUL AS NR_ROW,
ORDINE,
D.DENUMIRE AS NUME_ROW,
COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11, COL12, COL13, COL14, COL15, COL16, COL17, COL18, COL19,
    COL20, COL21, COL22,COL23,COL24,COL25,COL26,COL27,COL28,COL29,COL30, COL31, COL32, COL33, COL34, COL35, COL36, COL37, COL38, COL39, COL40,
    COL41, COL42,COL43,COL44,COL45,COL46,COL47,COL48,COL49,COL50

FROM(
SELECT 
   CC.FULL_CODE,
   CC.DENUMIRE,
   CC.CODUL,
   CC.FULL_CODE AS ORDINE,
   COUNT(DISTINCT DD.CUIIO ) AS COL1, 
   COUNT(DISTINCT CASE  WHEN DD.COL0 BETWEEN 0 AND 3   THEN DD.CUIIO  END) AS COL2, 
   COUNT(DISTINCT CASE  WHEN DD.COL0 BETWEEN 3 AND 6   THEN DD.CUIIO  END) AS COL3, 
   COUNT(DISTINCT CASE  WHEN DD.COL0 BETWEEN 6 AND 9   THEN DD.CUIIO  END) AS COL4, 
   COUNT(DISTINCT CASE  WHEN DD.COL0 BETWEEN 9 AND 12  THEN DD.CUIIO  END) AS COL5,
  
   SUM(CASE WHEN DR.RIND IN ('100') THEN  DR.COL1 END) AS COL6,
   SUM(CASE WHEN DR.RIND IN ('110') THEN  DR.COL1 END) AS COL7,
   SUM(CASE WHEN DR.RIND IN ('111') THEN  DR.COL1 END) AS COL8,
   SUM(CASE WHEN DR.RIND IN ('112') THEN  DR.COL1 END) AS COL9,
   SUM(CASE WHEN DR.RIND IN ('120') THEN  DR.COL1 END) AS COL10,
   SUM(CASE WHEN DR.RIND IN ('121') THEN  DR.COL1 END) AS COL11,
   SUM(CASE WHEN DR.RIND IN ('122') THEN  DR.COL1 END) AS COL12,
   SUM(CASE WHEN DR.RIND IN ('130') THEN  DR.COL1 END) AS COL13,
   SUM(CASE WHEN DR.RIND IN ('140') THEN  DR.COL1 END) AS COL14,
   SUM(CASE WHEN DR.RIND IN ('150') THEN  DR.COL1 END) AS COL15,
   SUM(CASE WHEN DR.RIND IN ('151') THEN  DR.COL1 END) AS COL16,
   SUM(CASE WHEN DR.RIND IN ('160') THEN  DR.COL1 END) AS COL17,
   SUM(CASE WHEN DR.RIND IN ('170') THEN  DR.COL1 END) AS COL18,
   SUM(CASE WHEN DR.RIND IN ('180') THEN  DR.COL1 END) AS COL19,
   
   SUM(CASE WHEN DR.RIND IN ('200') THEN  DR.COL1 END) AS COL20,
   SUM(CASE WHEN DR.RIND IN ('210') THEN  DR.COL1 END) AS COL21,
   SUM(CASE WHEN DR.RIND IN ('220') THEN  DR.COL1 END) AS COL22,
   SUM(CASE WHEN DR.RIND IN ('221') THEN  DR.COL1 END) AS COL23,
   SUM(CASE WHEN DR.RIND IN ('222') THEN  DR.COL1 END) AS COL24,
   SUM(CASE WHEN DR.RIND IN ('240') THEN  DR.COL1 END) AS COL25,
   SUM(CASE WHEN DR.RIND IN ('241') THEN  DR.COL1 END) AS COL26,
   SUM(CASE WHEN DR.RIND IN ('242') THEN  DR.COL1 END) AS COL27,
   SUM(CASE WHEN DR.RIND IN ('243') THEN  DR.COL1 END) AS COL28,
   SUM(CASE WHEN DR.RIND IN ('260') THEN  DR.COL1 END) AS COL29,
   SUM(CASE WHEN DR.RIND IN ('270') THEN  DR.COL1 END) AS COL30,
   SUM(CASE WHEN DR.RIND IN ('280') THEN  DR.COL1 END) AS COL31,
   SUM(CASE WHEN DR.RIND IN ('281') THEN  DR.COL1 END) AS COL32,
   SUM(CASE WHEN DR.RIND IN ('282') THEN  DR.COL1 END) AS COL33,
   SUM(CASE WHEN DR.RIND IN ('290') THEN  DR.COL1 END) AS COL34,
   SUM(CASE WHEN DR.RIND IN ('2911') THEN  DR.COL1 END) AS COL35,
   SUM(CASE WHEN DR.RIND IN ('2912') THEN  DR.COL1 END) AS COL36,
   SUM(CASE WHEN DR.RIND IN ('292') THEN  DR.COL1 END) AS COL37,
   SUM(CASE WHEN DR.RIND IN ('293') THEN  DR.COL1 END) AS COL38,
   SUM(CASE WHEN DR.RIND IN ('2931') THEN  DR.COL1 END) AS COL39,
   SUM(CASE WHEN DR.RIND IN ('241') THEN  DR.COL1 END) AS COL40,
   SUM(CASE WHEN DR.RIND IN ('294') THEN  DR.COL1 END) AS COL41,
   SUM(CASE WHEN DR.RIND IN ('2941') THEN  DR.COL1 END) AS COL42,
   SUM(CASE WHEN DR.RIND IN ('2942') THEN  DR.COL1 END) AS COL43,
   SUM(CASE WHEN DR.RIND IN ('2943') THEN  DR.COL1 END) AS COL44,
   SUM(CASE WHEN DR.RIND IN ('2944') THEN  DR.COL1 END) AS COL45,
   SUM(CASE WHEN DR.RIND IN ('295') THEN  DR.COL1 END) AS COL46,
   SUM(CASE WHEN DR.RIND IN ('296') THEN  DR.COL1 END) AS COL47,
   SUM(CASE WHEN DR.RIND IN ('2961') THEN  DR.COL1 END) AS COL48,
   SUM(CASE WHEN DR.RIND IN ('2962') THEN  DR.COL1 END) AS COL49,
   SUM(CASE WHEN DR.RIND IN ('297') THEN  DR.COL1 END) AS COL50
                                                                                     
                
    FROM
    
    
    CIS2.VW_DATA_ALL DR INNER JOIN
    
    (
-------------------------------------------------------------------------------     
  SELECT  
    DISTINCT 
    D.CUIIO,
    D.CUIIO_VERS,
    NVAL(SUM(CASE WHEN  D.ID_MD IN (59334,59336,59337,59338,59339,59340,59341,59342,59343,59344,59345,59346) THEN  D.COL1 ELSE 0 END))  AS COL0 ,  
    NVAL(SUM(CASE WHEN  D.ID_MD IN (69986) THEN  D.COL4 ELSE 0 END))  AS COL4 
FROM   
    CIS2.DATA_ALL D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA --AND
 -- D.ID_MD IN (59334,59336,59337,59338,59339,59340,59341,59342,59343,59344,59345,59346,69986)
 
 GROUP BY 
 D.CUIIO,
 D.CUIIO_VERS
 
 
) DD ON DR.CUIIO=DD.CUIIO AND DR.CUIIO_VERS=DD.CUIIO_VERS
-------------------------------------------------------------------------------    

 INNER JOIN (SELECT
CODUL, 
DENUMIRE, 
GRUPA, 
ORDINE, 
FULL_CODE, 
NUM_CODE, 
PRIM                
                FROM  CIS2.VW_CL_CAEM2
                
               
                
                WHERE 
                CODUL LIKE 'C%'
                OR CODUL LIKE 'B%'
                OR CODUL LIKE 'D%'
                OR CODUL LIKE 'E%'
                OR CODUL LIKE 'F%'
                OR CODUL LIKE 'G%'
                OR CODUL LIKE 'H%'
                OR CODUL LIKE 'I%'
                OR CODUL LIKE 'J%'
                OR CODUL LIKE 'L%'
                OR CODUL LIKE 'M%'
                OR CODUL LIKE 'N%'
                OR CODUL LIKE 'S%'
             
                
                ORDER BY
                FULL_CODE) C ON C.CODUL = DR.CAEM2                  
 INNER JOIN CIS2.VW_CL_CAEM2 CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
 
         
 WHERE 
  (DR.FORM=:pFORM) AND
  (DR.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
 -- (DR.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
  DR.PERIOADA IN (:pPERIOADA) 
 -- AND  C.CODUL LIKE '%0'
 -- AND  DR.CUIIO=40856685
   GROUP BY
    CC.FULL_CODE,
    CC.DENUMIRE,
    CC.CODUL
   ORDER BY 
     
     CC.CODUL
     ) D
     
      WHERE
         
         D.COL1+D.COL2+ D.COL3+D.COL4+D.COL5>0 
         --)
    