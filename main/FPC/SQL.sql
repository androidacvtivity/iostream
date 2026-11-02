SELECT 
                D.CUIIO,
                D.ID_MD,
                D.RIND,
                SUM(D.COL1) COL1,
                SUM(D.COL2) COL2,
                SUM(D.COL3) COL3
            FROM STAT.VW_DATA_ALL D
                       
            
                WHERE
                FORM = 78
AND D.CUIIO = 5696271

AND D.PERIOADA = 2015
 AND D.CAPITOL_DEN = 'CAP. A' 
 --AND D.RIND LIKE '1%'
 
                
                GROUP BY
                D.CUIIO,
                D.RIND,
                D.ID_MD
                
                
                HAVING 
                
                NVAL(SUM(D.COL1)) + NVAL(SUM(D.COL2)) + NVAL(SUM(D.COL3)) <> 0 
                
                ORDER BY
                D.CUIIO,
                 TO_NUMBER(D.RIND) 