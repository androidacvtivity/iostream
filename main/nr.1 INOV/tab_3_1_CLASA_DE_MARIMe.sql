      SELECT
        TR.NR_TABLE,
        TR.TABLE_DENUMIRE,
        TR.RIND_DENUMIRE,
        TR.ORDINE,
        TR.RIND,

        ROUND(DD.COL2 / 1000 * SUM(CASE WHEN A.RIND = '1.3.1' AND NVAL(A.COL1)> 0
             AND ((ROUND(BS.PERS_IT) BETWEEN TR.PERS_INIT AND TR.PERS_FINAL) OR ROUND(BS.PERS_IT) IS NULL)
             AND (TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,2,2)||'%')
             THEN NVAL(A.COL1) END) / 100,1) AS COL_18_1,

        ROUND(DD.COL2 / 1000 *SUM(CASE WHEN A.RIND = '1.3.2' AND NVAL(A.COL1)> 0
             AND ((ROUND(BS.PERS_IT) BETWEEN TR.PERS_INIT AND TR.PERS_FINAL) OR ROUND(BS.PERS_IT) IS NULL)
             AND (TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,2,2)||'%')
             THEN NVAL(A.COL1) END)/ 100,1) AS COL_18_2,

        ROUND(DD.COL2 / 1000 *SUM(CASE WHEN A.RIND = '1.3.3' AND NVAL(A.COL1)> 0
             AND ((ROUND(BS.PERS_IT) BETWEEN TR.PERS_INIT AND TR.PERS_FINAL) OR ROUND(BS.PERS_IT) IS NULL)
             AND (TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,1,1)||'%' OR TR.RIND_C LIKE '%'||SUBSTR(A.CAEM2,2,2)||'%')
             THEN NVAL(A.COL1) END)/ 100,1) AS COL_18_3
             
        

      FROM
      (
        SELECT
          D.ANUL,
          D.CUIIO,
          D.CUATM,
          D.CAEM2,
          D.CAPITOL,
          D.RIND,
          D.COL1 
        FROM CIS2.VW_DATA_ALL D
        WHERE
          D.PERIOADA IN (:pPERIOADA) AND
          D.FORM IN (:pFORM) AND 
          D.CAPITOL=1040 AND D.CAPITOL_VERS=2013 AND 
          D.RIND IN ('1.3.1','1.3.2','1.3.3') AND
          D.CAEM2 NOT LIKE 'A%'
          
           AND D.CUIIO = 40585950
      ) A
      LEFT JOIN CIS2.X_BAZA_SONDAJ BS ON (A.CUIIO=BS.CUIIO AND BS.ANUL=2025)
      
      LEFT JOIN (
                  
SELECT 
CUIIO,
COL2
FROM 

(
SELECT 
                D.CUIIO,
                SUM(D.COL2) AS COL2 
                FROM CIS2.DATA_ALL_FR D
                WHERE
                

            D.FORM = 57 
 --AND D.CUIIO =  40585950
 
AND D.PERIOADA = 2013
AND D.FORM_VERS = 2009
--AND D.capitol=1092  
AND D.ID_MD IN (62206)   --62206

GROUP BY 
                D.CUIIO
               



UNION 

SELECT 
                D.CUIIO,
          
                SUM(D.COL2) AS COL2 
                FROM CIS2.VW_DATA_ALL_FR D
                WHERE
                

            D.FORM = 63 
-- AND D.CUIIO =  5523 
AND D.PERIOADA = 2013
--AND D.capitol= 1121  
AND D.ID_MD IN (61891) -- 61891

GROUP BY 
                D.CUIIO
)         
                
                

                  ) DD ON DD.CUIIO = A.CUIIO 
      INNER JOIN (
        SELECT CODUL, FULL_CODE 
        FROM CIS2.VW_CL_CAEM2
        WHERE SUBSTR(CODUL,1,1) IN ('B','C','D','E','H','J','K') 
           OR SUBSTR(CODUL,1,3) IN ('G46','M71','M72','M73')
      ) C ON C.CODUL = A.CAEM2
      CROSS JOIN 
      (
        SELECT 2 AS NR_TABLE, 'Clasa de marime' AS TABLE_DENUMIRE, 0 AS PERS_INIT, 999999 AS PERS_FINAL, NULL AS RIND, 'Total salariati' AS RIND_DENUMIRE, '1' AS ORDINE, 'B+C+D+E+H+J+K+G46+M71+M72+M73' AS RIND_C FROM DUAL UNION
      --  SELECT 2, 'Clasa de marime', 0, 9,   NULL, '0-9 salariati',        '2',  'B+C+D+E+H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 0, 49, NULL, '10-49 salariati',       '3',  'B+C+D+E+H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 50, 249,NULL, '50-249 salariati',      '4',  'B+C+D+E+H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 250, 999999, NULL, '250 si peste salariati','5','B+C+D+E+H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 0, 999999, NULL, 'Industrie - total','6',  'B+C+D+E' FROM DUAL UNION
     --   SELECT 2, 'Clasa de marime', 0, 9,   NULL, '0-9 salariati',       '7',  'B+C+D+E' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 0, 49, NULL, '10-49 salariati',     '8',  'B+C+D+E' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 50, 249,NULL, '50-249 salariati',    '9',  'B+C+D+E' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 250, 999999, NULL, '250 si peste salariati', '10','B+C+D+E' FROM DUAL UNION 
        SELECT 2, 'Clasa de marime', 0, 999999, NULL, 'Servicii - total', '11','H+J+K+G46+M71+M72+M73' FROM DUAL UNION
     --   SELECT 2, 'Clasa de marime', 0, 9,   NULL, '0-9 salariati',       '12','H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 0, 49, NULL, '10-49 salariati',     '13','H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 50, 249,NULL, '50-249 salariati',    '14','H+J+K+G46+M71+M72+M73' FROM DUAL UNION
        SELECT 2, 'Clasa de marime', 250, 999999, NULL, '250 si peste salariati','15','H+J+K+G46+M71+M72+M73' FROM DUAL
      ) TR
      GROUP BY
        TR.NR_TABLE, TR.TABLE_DENUMIRE, TR.RIND_DENUMIRE, TR.ORDINE, TR.RIND,
        DD.COL2
        
        
        
        ORDER BY
       TO_NUMBER(ORDINE)
