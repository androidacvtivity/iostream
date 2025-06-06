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
  CD.CUATM||'~'||CD.NR_ROW  AS NR_ROW,  
   CD.NR_ROW AS ORDINE,
  '0000111' AS DECIMAL_POS,
   CD.NUME_ROW AS NUME_ROW,
ROUND(SUM(CASE WHEN C.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN D.COL1 ELSE NULL END ),0) AS COL1,
ROUND(SUM(CASE WHEN C.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN D.COL2 ELSE NULL END ),0) AS COL2,
ROUND(SUM(CASE WHEN C.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN D.COL3 ELSE NULL END ),0) AS COL3,
ROUND(SUM(CASE WHEN C.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN D.COL4 ELSE NULL END ),0) AS COL4,
ROUND(SUM(CASE WHEN C.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN D.COL5 ELSE NULL END ),1) AS COL5,
ROUND(SUM(CASE WHEN C.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN D.COL6 ELSE NULL END ),1) AS COL6,
ROUND(SUM(CASE WHEN C.FULL_CODE LIKE '%'||CD.CUATM||';%'  THEN D.COL7 ELSE NULL END ),1) AS COL7

FROM 
(
SELECT
CUIIO,
CUATM,
CASE WHEN SUM(COL1) = 0 THEN NULL ELSE SUM(COL1) END   AS COL1,
CASE WHEN SUM(COL2) = 0 THEN NULL ELSE SUM(COL2) END   AS COL2,
CASE WHEN SUM(COL3) = 0 THEN NULL ELSE SUM(COL3) END   AS COL3,
CASE WHEN SUM(COL4) = 0 THEN NULL ELSE SUM(COL4) END   AS COL4,
SUM(R_520 / 1000) AS COL5, 
SUM((R_520 / 1000) * (R_531 / 100)) AS COL6,
SUM((R_520 / 1000) * (R_532 / 100)) AS COL7
   FROM

(
SELECT
D.CUIIO,
D.CUATM,
COUNT (DISTINCT(CASE WHEN D.RIND  IN ('511','512') AND   CIS2.NVAL(D.COL1)=1  THEN D.CUIIO END)) AS COL1,
COUNT (DISTINCT(CASE WHEN D.RIND  IN ('511')    AND   CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END)) AS COL2,
COUNT (DISTINCT(CASE WHEN D.RIND  IN ('512')    AND   CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END)) AS COL3,
COUNT (DISTINCT(CASE WHEN D.RIND  IN ('513')    AND   CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END)) AS COL4,
SUM (CASE WHEN D.RIND  IN ('520') THEN  D.COL1 ELSE NULL  END) AS R_520,
SUM (CASE WHEN D.RIND  IN ('531') THEN  D.COL1 ELSE NULL  END) AS R_531,
SUM (CASE WHEN D.RIND  IN ('532') THEN  D.COL1 ELSE NULL  END) AS R_532
  
 FROM
      CIS2.VW_DATA_ALL D        
      
      WHERE  
       D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS = :pFORM_VERS  AND  
      (:pID_MDTABLE=:pID_MDTABLE) AND
       D.FORM = 71 AND
       D.CAPITOL IN (1185) --AND
      -- D.CUATM_FULL LIKE '%'||:pCOD_CUATM||'%'
    --  AND D.CUIIO = 40211764
  
  GROUP BY
  D.CUIIO,
  D.CUATM
     
)         


GROUP BY
CUIIO,
CUATM ) D

      INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL)
      CROSS JOIN 

(   SELECT 'TOTAL' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. CHISINAU' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION  
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balti' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Briceni' AS NUME_ROW,                             '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Donduseni' AS NUME_ROW,                           '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Drochia' AS NUME_ROW,                             '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Edinet' AS NUME_ROW,                              '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Falesti' AS NUME_ROW,                             '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Floresti' AS NUME_ROW,                            '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Glodeni' AS NUME_ROW,                             '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Ocnita' AS NUME_ROW,                              '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION     
    SELECT 'r-l Riscani' AS NUME_ROW,                             '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Singerei' AS NUME_ROW,                            '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION     
    SELECT 'r-l Soroca' AS NUME_ROW,                              '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION  
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Anenii Noi' AS NUME_ROW,                          '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION        
    SELECT 'r-l Calaras' AS NUME_ROW,                             '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Criuleni' AS NUME_ROW,                            '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION   
    SELECT 'Dubasari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'r-l Hincesti' AS NUME_ROW,                            '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Ialoveni' AS NUME_ROW,                            '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Nisporeni' AS NUME_ROW,                           '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Orhei' AS NUME_ROW,                               '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Rezina' AS NUME_ROW,                              '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Straseni' AS NUME_ROW,                            '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION     
    SELECT 'r-l Soldanesti' AS NUME_ROW,                          '28' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Telenesti' AS NUME_ROW,                           '29' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Ungheni' AS NUME_ROW,                             '30' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '31' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Basarabeasca' AS NUME_ROW,                        '32' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Cahul' AS NUME_ROW,                               '34' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Cantemir' AS NUME_ROW,                            '35' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION     
    SELECT 'r-l Causeni' AS NUME_ROW,                             '36' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Cimislia' AS NUME_ROW,                            '37' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Leovo' AS NUME_ROW,                               '38' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Stefan Voda' AS NUME_ROW,                         '39' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Taraclia' AS NUME_ROW,                            '40' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION   
    SELECT 'UTA Gagauzia' AS NUME_ROW,                            '41' AS NR_ROW, '9600000' AS CUATM FROM DUAL     
      ) CD 
      
WHERE 

        C.FULL_CODE LIKE '%'||:pCOD_CUATM||'%'  

GROUP BY  CD.NR_ROW , CD.NUME_ROW, CD.CUATM
ORDER BY  CD.NR_ROW