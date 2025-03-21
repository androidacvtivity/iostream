
INSERT INTO TABLE_OUT 
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
    COL1, 
    COL2,
    COL3,
    COL4,
    COL5,
    COL6, 
    COL7, 
    COL8,
    COL9,
    COL10,
    COL11,
    COL12,
    COL13,
    COL14 
 )
-- 
 -- 12 ROWS  AND 6 COLUMNS
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
         DC.NR_ROW AS NR_ROW,
         DC.ORDINE AS  ORDINE,
        '00000000000000'AS DECIMAL_POS,
         DC.NUME_ROW AS NUME_ROW,
        CASE WHEN  DC.COL1 = 0 THEN NULL ELSE DC.COL1 END AS COL1,
        CASE WHEN  DC.COL2 = 0 THEN NULL ELSE DC.COL2 END AS COL2,
        CASE WHEN  DC.COL3 = 0 THEN NULL ELSE DC.COL3 END AS COL3,
        CASE WHEN  DC.COL4 = 0 THEN NULL ELSE DC.COL4 END AS COL4,
        CASE WHEN  DC.COL5 = 0 THEN NULL ELSE DC.COL5 END AS COL5,
        CASE WHEN  DC.COL6 = 0 THEN NULL ELSE DC.COL6 END AS COL6,
        CASE WHEN  DC.COL7 = 0 THEN NULL ELSE DC.COL7 END AS COL7,
        CASE WHEN  DC.COL8 = 0 THEN NULL ELSE DC.COL8 END AS COL8,
        CASE WHEN  DC.COL9 = 0 THEN NULL ELSE DC.COL9 END AS COL9,
        CASE WHEN  DC.COL10 = 0 THEN NULL ELSE DC.COL10 END AS COL10,
        CASE WHEN  DC.COL11 = 0 THEN NULL ELSE DC.COL11 END AS COL11,
        CASE WHEN  DC.COL12 = 0 THEN NULL ELSE DC.COL12 END AS COL12,
        CASE WHEN  DC.COL13 = 0 THEN NULL ELSE DC.COL13 END AS COL13,
        CASE WHEN  DC.COL14 = 0 THEN NULL ELSE DC.COL14 END AS COL14 
 
 -- 07 ROWS  AND 14 COLUMNS
 FROM
 (  -- ROWS 1 
SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '01' AS NR_ROW,
      1  AS ORDINE,
     'Total' AS NUME_ROW,
     CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND RIND_VERS IN (2011)  AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
     CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND RIND_VERS IN (2011) AND  NS.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL2,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL2 ELSE NULL END))   AS   COL3,   
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END)) AS  COL4,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END)) AS  COL5,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL2 ELSE NULL END)) AS  COL6,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL3 ELSE NULL END)) AS  COL7, 
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL4 ELSE NULL END)) AS  COL8,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL5 ELSE NULL END)) AS  COL9,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL6 ELSE NULL END)) AS  COL10,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL7 ELSE NULL END)) AS  COL11,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL8 ELSE NULL END)) AS  COL12,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL9 ELSE NULL END)) AS  COL13,
     CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('020')  THEN D.COL1 ELSE NULL END)) AS  COL14
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NI�P).(Col.6) <> 6 --- NT.CODUL <> 6 
               --------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NSIIP NS ON (RN.N85_NSIIP=NS.CODUL) -- care (NI�P).(Col.10) = 1 
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)
--               AND
--               D.CUIIO IN (7001770)
               
               UNION 
               --ROWS 2
              SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '02' AS NR_ROW,
      2  AS ORDINE,
     'gradinita de copii' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  1 THEN D.CUIIO ELSE NULL END))  AS  COL1,  
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  1 AND NS.CODUL = 1 THEN D.CUIIO ELSE NULL END)) AS  COL2,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL2 ELSE NULL END)) AS  COL3,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL1 ELSE NULL END)) AS  COL4,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL1 ELSE NULL END)) AS  COL5,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL2 ELSE NULL END)) AS  COL6,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL3 ELSE NULL END)) AS  COL7, 
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL4 ELSE NULL END)) AS  COL8,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL5 ELSE NULL END)) AS  COL9,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL6 ELSE NULL END)) AS  COL10,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL7 ELSE NULL END)) AS  COL11,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL8 ELSE NULL END)) AS  COL12,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  1  THEN D.COL9 ELSE NULL END)) AS  COL13,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('020') AND  NT.CODUL =  1  THEN D.COL1 ELSE NULL END)) AS  COL14
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --care (NI�P).(Col.6) = 1  --- NT.CODUL = 1  
               ------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NSIIP NS ON (RN.N85_NSIIP=NS.CODUL) -- care (NI�P).(Col.10) = 1
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
--               AND
--               D.CUIIO IN (7001770)
               
               UNION 
               --ROWS 3
              SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '03' AS NR_ROW,
      3  AS ORDINE,
     'cresa-gradinita' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  2 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  2 AND  NS.CODUL = 1 THEN D.CUIIO ELSE NULL END))  AS  COL2,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL2 ELSE NULL END)) AS  COL3,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL1 ELSE NULL END)) AS  COL4,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL1 ELSE NULL END)) AS  COL5,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL2 ELSE NULL END)) AS  COL6,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL3 ELSE NULL END)) AS  COL7, 
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL4 ELSE NULL END)) AS  COL8,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL5 ELSE NULL END)) AS  COL9,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL6 ELSE NULL END)) AS  COL10,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL7 ELSE NULL END)) AS  COL11,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL8 ELSE NULL END)) AS  COL12,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  2  THEN D.COL9 ELSE NULL END)) AS  COL13,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('020') AND  NT.CODUL =  2  THEN D.COL1 ELSE NULL END)) AS  COL14
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --care (NI�P).(Col.6) = 1  --- NT.CODUL = 2   
               ------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NSIIP NS ON (RN.N85_NSIIP=NS.CODUL) -- care (NI�P).(Col.10) = 1  NS.CODUL = 1 
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
--               AND
--              D.CUIIO IN (7001770)
              
              UNION 
               --ROWS 4
              SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '04' AS NR_ROW,
      4  AS ORDINE,
     'cresa' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  3 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  3 AND  NS.CODUL = 1 THEN D.CUIIO ELSE NULL END))  AS  COL2,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL2 ELSE NULL END)) AS  COL3,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL1 ELSE NULL END)) AS  COL4,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL1 ELSE NULL END)) AS  COL5,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL2 ELSE NULL END)) AS  COL6,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL3 ELSE NULL END)) AS  COL7, 
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL4 ELSE NULL END)) AS  COL8,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL5 ELSE NULL END)) AS  COL9,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL6 ELSE NULL END)) AS  COL10,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL7 ELSE NULL END)) AS  COL11,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL8 ELSE NULL END)) AS  COL12,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  3  THEN D.COL9 ELSE NULL END)) AS  COL13,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('020') AND  NT.CODUL =  3  THEN D.COL1 ELSE NULL END)) AS  COL14
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --care (NI�P).(Col.6) = 1  --- NT.CODUL = 1  
               ------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NSIIP NS ON (RN.N85_NSIIP=NS.CODUL) -- care (NI�P).(Col.10) = 1 
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
--               AND
--               D.CUIIO IN (7001770)
               
                UNION 
               --ROWS 5
              SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '05' AS NR_ROW,
      5  AS ORDINE,
     'scoala-gradinita de copii' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  4 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  4 AND  NS.CODUL = 1 THEN D.CUIIO ELSE NULL END))  AS  COL2,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL2 ELSE NULL END)) AS  COL3,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL1 ELSE NULL END)) AS  COL4,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL1 ELSE NULL END)) AS  COL5,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL2 ELSE NULL END)) AS  COL6,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL3 ELSE NULL END)) AS  COL7, 
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL4 ELSE NULL END)) AS  COL8,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL5 ELSE NULL END)) AS  COL9,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL6 ELSE NULL END)) AS  COL10,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL7 ELSE NULL END)) AS  COL11,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL8 ELSE NULL END)) AS  COL12,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  4  THEN D.COL9 ELSE NULL END)) AS  COL13,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('020') AND  NT.CODUL =  4  THEN D.COL1 ELSE NULL END)) AS  COL14
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --care (NI�P).(Col.6) = 1  --- NT.CODUL = 1  
               ------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NSIIP NS ON (RN.N85_NSIIP=NS.CODUL) -- care (NI�P).(Col.10) = 1  
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
--               AND
--               D.CUIIO IN (7001770)
              
             UNION 
               --ROWS 6
              SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '06' AS NR_ROW,
      6  AS ORDINE,
     'centru comunitar' AS NUME_ROW,
      CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  5 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND  RIND_VERS IN (2011)  AND NT.CODUL =  5 AND  NS.CODUL = 1 THEN D.CUIIO ELSE NULL END))  AS  COL2,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL2 ELSE NULL END)) AS  COL3,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL1 ELSE NULL END)) AS  COL4,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL1 ELSE NULL END)) AS  COL5,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL2 ELSE NULL END)) AS  COL6,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL3 ELSE NULL END)) AS  COL7, 
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL4 ELSE NULL END)) AS  COL8,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL5 ELSE NULL END)) AS  COL9,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL6 ELSE NULL END)) AS  COL10,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL7 ELSE NULL END)) AS  COL11,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL8 ELSE NULL END)) AS  COL12,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  5  THEN D.COL9 ELSE NULL END)) AS  COL13,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('020') AND  NT.CODUL =  5  THEN D.COL1 ELSE NULL END)) AS  COL14
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               
               
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --care (NI�P).(Col.6) = 1  --- NT.CODUL = 1  
               ------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NSIIP NS ON (RN.N85_NSIIP=NS.CODUL) -- care (NI�P).(Col.10) = 1 
                
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
--               AND
--               D.CUIIO IN (7001770)
               
              UNION 
               --ROWS 7
              SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '07' AS NR_ROW,
      7  AS ORDINE,
     'grupe pregatitoare pe l�nga institutii de �nvatam�nt' AS NUME_ROW,
       NULL AS  COL1, 
       NULL AS  COL2,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL2 ELSE NULL END)) AS  COL3,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL1 ELSE NULL END)) AS  COL4,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL1 ELSE NULL END)) AS  COL5,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL2 ELSE NULL END)) AS  COL6,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL3 ELSE NULL END)) AS  COL7, 
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL4 ELSE NULL END)) AS  COL8,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL5 ELSE NULL END)) AS  COL9,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL6 ELSE NULL END)) AS  COL10,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL7 ELSE NULL END)) AS  COL11,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL8 ELSE NULL END)) AS  COL12,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('010') AND  NT.CODUL =  6  THEN D.COL9 ELSE NULL END)) AS  COL13,
       CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1002) AND D.RIND IN ('020') AND  NT.CODUL =  6  THEN D.COL1 ELSE NULL END)) AS  COL14
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --care (NI�P).(Col.6) = 1  --- NT.CODUL = 1  
               ------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NSIIP NS ON (RN.N85_NSIIP=NS.CODUL) -- care (NI�P).(Col.10) = 1 
                 
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
--               AND
--               D.CUIIO IN (7001770) 
              
              ) DC 
 
    ORDER BY DC.ORDINE