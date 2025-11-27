
SELECT 
L.CUIIO,
L.DENUMIRE,
   L.CUATM,
        L.IDNO,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        NULL RIND,
L.CAEM2_CAP4,
ROUND(L.COL1 / 2,1) AS COL1,
ROUND(L.COL2 / 2,1) AS COL2,
ROUND(L.COL3 / 2,1) AS COL3,
'PART 1' AS COL4,
'PART 1' AS COL5,
'PART 1' AS COL6
 


FROM
(
SELECT
        D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        R.IDNO,
        R.CFP,
        R.CFOJ,
        R.CAEM2,
        
      
        MAX(D.COL31) AS CAEM2_CAP4,
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    
       WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
        AND D.RIND IN ('410','400')
 

        HAVING 
        SUM (CASE WHEN D.RIND  IN ('400','410') THEN NVAL(D.COL4) + NVAL(D.COL5) + NVAL(D.COL6) ELSE 0 END ) > 0
        
        GROUP BY
       D.CUIIO,
        R.CUATM,
        R.IDNO,
        R.CFP,
        R.CFOJ,
        R.CAEM2,
        R.DENUMIRE
        
        ) L LEFT JOIN (
        
        
        SELECT
        D.CUIIO,
      
        MAX(D.COL31) AS CAEM2_CAP4,
        SUM(D.COL3) AS COL1,
        SUM(D.COL4) AS COL2,
        SUM(D.COL5) AS COL3
    FROM CIS2.VW_DATA_ALL D
    
       WHERE
        D.FORM IN (64)
        AND D.CAPITOL IN (1127)
        AND D.PERIOADA IN (2013)
        AND D.RIND NOT IN ('410','400')
 

        HAVING 
        SUM (CASE WHEN D.RIND  NOT IN ('400','410') THEN NVAL(D.COL4) + NVAL(D.COL5) + NVAL(D.COL6) ELSE 0 END ) > 0
        
        GROUP BY
        D.CUIIO
        
        ) R ON R.CUIIO = L.CUIIO 
         
        
        WHERE 
        R.CUIIO IS NULL 
        
        AND L.CAEM2_CAP4 LIKE '56%'
        