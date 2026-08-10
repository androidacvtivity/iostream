             SELECT 
                    DISTINCT
                    D.ANUL,
                    D.CUATM, 
                    D.CUIIO,
                    R.DENUMIRE,
                    SUM(CASE WHEN D.CAPITOL = 1125 AND D.RIND IN ('222') THEN D.COL1 ELSE NULL END) AS R222_C1
                    
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
                    