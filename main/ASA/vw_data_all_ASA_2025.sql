             SELECT 
                    DISTINCT
                    D.ANUL,
                    D.CUIIO,
                    D.CUATM, 
                    R.DENUMIRE,
                    SUM(CASE WHEN D.CAPITOL = 1200 AND D.RIND IN ('2113-1') THEN D.COL1 ELSE NULL END) AS R2113_1,
                    SUM(CASE WHEN D.CAPITOL = 1200 AND D.RIND IN ('2113-2') THEN D.COL1 ELSE NULL END) AS R2113_2,
                    SUM(CASE WHEN D.CAPITOL = 1200 AND D.RIND IN ('2113-3') THEN D.COL1 ELSE NULL END) AS R2113_3,
                    SUM(CASE WHEN D.CAPITOL = 1200 AND D.RIND IN ('2113-4') THEN D.COL1 ELSE NULL END) AS R2113_4,
                    SUM(CASE WHEN D.CAPITOL = 1200 AND D.RIND IN ('2123-1') THEN D.COL1 ELSE NULL END) AS R2123_1,
                    SUM(CASE WHEN D.CAPITOL = 1200 AND D.RIND IN ('2123-2') THEN D.COL1 ELSE NULL END) AS R2123_2,
                    SUM(CASE WHEN D.CAPITOL = 1200 AND D.RIND IN ('2123-3') THEN D.COL1 ELSE NULL END) AS R2123_3,
                    SUM(CASE WHEN D.CAPITOL = 1200 AND D.RIND IN ('2123-4') THEN D.COL1 ELSE NULL END) AS R2123_4
                    
                            FROM CIS2.VW_DATA_ALL D 
                                   INNER JOIN CIS2.RENIM R 
                                   ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                            
                                WHERE 
                                
                                D.FORM = 64 
                                AND D.PERIOADA = 2014
                                
                                
                                
                    GROUP BY 
                    D.ANUL,
                    D.CUATM, 
                    D.CUIIO,
                    R.DENUMIRE
                    
                    ORDER BY
                    D.CUATM
                    