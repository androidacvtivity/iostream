             SELECT 
                D.UNIT_CODE,
                D.CAPITOL,
                D.RIND,
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
                SUM(D.COL11) AS COL11    
                
                FROM CIS2.VW_DATA_ALL_GC D
                
                WHERE
                D.FORM = 61 
                AND D.PERIOADA = 1066
                
                AND D.UNIT_CODE = 791972
                GROUP BY
                D.UNIT_CODE,
                D.CAPITOL,
                D.RIND