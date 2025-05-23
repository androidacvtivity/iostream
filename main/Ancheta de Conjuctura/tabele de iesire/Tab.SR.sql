INSERT INTO CIS2.TABLE_OUT 
(
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,  
  COL1, COL2, COL3,COL4,COL5, COL6, COL7, COL8, COL9
)

SELECT 
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,    
'0' AS NR_SECTIE,
'0' AS NUME_SECTIE,
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2, 
CUATM  NR_ROW,
ORDINE,
'0000000000' AS DECIMAL_POS, 
NUME_ROW,-----------------------------------
COL1,COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9
FROM
(

SELECT 
    CC.NR_ROW AS NR_ROW,
    CC.CS_CUATM AS CUATM, 
    CC.NUME_ROW,      
    CC.NR_ROW AS ORDINE,
    SUM(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%' THEN DD.COL1_1 ELSE NULL END) AS COL1,
    COUNT(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%'  AND D.CUIIO = D.CUIIO THEN  D.CUIIO ELSE NULL END) AS COL2,              
    COUNT(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%'  AND D.CAPITOL  = 1199 AND D.RIND IN ('1') AND D.CAEM2 NOT LIKE 'A%' THEN  D.CUIIO ELSE NULL END) AS COL3,
    COUNT(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%'  AND D.CAPITOL  = 1199 AND D.RIND IN ('2') THEN  D.CUIIO ELSE NULL END) AS COL4,
    COUNT(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%'  AND D.CAPITOL  = 1199 AND D.RIND IN ('3') THEN  D.CUIIO ELSE NULL END) AS COL5,
    COUNT(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%'  AND D.CAPITOL  = 1199 AND D.RIND IN ('4') THEN  D.CUIIO ELSE NULL END) AS COL6,
    COUNT(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%'  AND D.CAPITOL  = 1199 AND D.RIND IN ('5') THEN  D.CUIIO ELSE NULL END) AS COL7,
    COUNT(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%'  AND D.CAPITOL  = 1199 AND D.RIND IN ('6') THEN  D.CUIIO ELSE NULL END) AS COL8,
    COUNT(DISTINCT CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%'  AND D.CAPITOL  = 1199 AND D.RIND IN ('7') THEN  D.CUIIO ELSE NULL END) AS COL9
    FROM CIS2.VW_DATA_ALL D 
                    
    INNER JOIN  CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
       
  CROSS JOIN 
  (
    SELECT
      DECODE(CS.CODUL, 
      '0000000','01','0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39')
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      CIS2.VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000'
        )
  ) CC 
       
  
  ----
   INNER JOIN (
SELECT 
  CC.NR_ROW  AS NR_ROW,
  CC.CS_CUATM AS CUATM,
  CC.NUME_ROW AS NUME_ROW,
  SUM(CASE WHEN C.FULL_CODE LIKE '%'||CC.CS_CUATM||'%' THEN A.CUIIO END) AS COL1_1
 
  
   FROM 
(SELECT
  
  COUNT (DISTINCT R.CUIIO) AS CUIIO,
  R.CUATM
 -- FC.CUIIO_VERS,
 -- FC.STATUT
FROM
  CIS2.RENIM R
  INNER JOIN CIS2.FORM_CUIIO FC ON (R.CUIIO=FC.CUIIO AND R.CUIIO_VERS=FC.CUIIO_VERS)
  INNER JOIN (
SELECT
  DISTINCT
      R.CUIIO,
      MAX(R.CUIIO_VERS) AS CUIIO_VERS
    FROM
      CIS2.RENIM R
      INNER JOIN CIS2.FORM_CUIIO FC ON (R.CUIIO=FC.CUIIO AND R.CUIIO_VERS=FC.CUIIO_VERS)
    WHERE
      R.CUIIO_VERS <= :pPERIOADA AND
      FC.FORM IN (:pFORM)
    GROUP BY
      R.CUIIO) D ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
WHERE
  FC.FORM IN (:pFORM) AND
  FC.STATUT <> '3'
  
  GROUP BY R.CUATM
  ORDER BY R.CUATM) A
  
  INNER JOIN CIS2.VW_CL_CUATM C ON(A.CUATM = C.CODUL)
  CROSS JOIN 
  (
    SELECT
      DECODE(CS.CODUL, 
      '0000000','01','0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39')
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      CIS2.VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000'
        )
  ) CC 
GROUP BY
  CC.NR_ROW,
  CC.NUME_ROW,
  CC.CS_CUATM
  ORDER BY CC.NR_ROW) DD ON CC.NR_ROW=DD.NR_ROW
  
  ----           
    WHERE
   (D.FORM=:pFORM) AND
   (D.FORM_VERS=:pFORM_VERS) AND
                  
   (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
    D.PERIOADA IN (:pPERIOADA) AND
    D.FORM IN (74) 
    --AND D.CAEM2 NOT LIKE 'A%'
    
    GROUP BY  CC.NR_ROW , 
    CC.NUME_ROW,CC.CS_CUATM)