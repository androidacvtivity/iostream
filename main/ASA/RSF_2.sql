SELECT 
                    DISTINCT
                    D.ANUL,
                    D.CUIIO,
                    D.CUATM, 
                    D.CAEM2,
                    R.DENUMIRE,
                    SUM(CASE WHEN D.CAPITOL = 1106 AND D.RIND IN ('010') THEN D.COL2 ELSE NULL END) AS R010_4,
                    SUM(CASE WHEN D.CAPITOL = 1106 AND D.RIND IN ('020') THEN D.COL2 ELSE NULL END) AS R020_4,
                    SUM(CASE WHEN D.CAPITOL = 1106 AND D.RIND IN ('040') THEN D.COL2 ELSE NULL END) AS R040_4,
                    SUM(CASE WHEN D.CAPITOL = 1106 AND D.RIND IN ('050') THEN D.COL2 ELSE NULL END) AS R050_4,
                    SUM(CASE WHEN D.CAPITOL = 1106 AND D.RIND IN ('070') THEN D.COL2 ELSE NULL END) AS R070_4,
                    SUM(CASE WHEN D.CAPITOL = 1106 AND D.RIND IN ('080') THEN D.COL2 ELSE NULL END) AS R080_4
                 
                    
                            FROM CIS2.VW_DATA_ALL_FR D 
                                   INNER JOIN CIS2.RENIM R 
                                   ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                            
                                WHERE 
                                
                                D.FORM = 59 
                                AND D.PERIOADA = 2014
                                AND D.CAPITOL = 1106
                           AND D.CUIIO IN (
                           39068304,
39081687,
39036072,
40512425,
4503560,
39026607,
41602461,
7030145,
39042753,
37785852,
39054905,
41587046,
20379214,
38863790,
38970112,
39009052,
39017436,
40303118,
7025210,
37715277,
39060934,
39061845,
37386537,
37458582,
39059771,
40070105,
2167460,
5691612,
5692617,
7028421,
7029395,
7036573,
7002516,
41487675,
39047408,
2562081,
5696160,
2562274,
5915566,
5921963,
2562587,
40150519,
5692161,
39006160,
39076114,
5913171,
2166897,
2562200,
20139562,
38587798,
38824206,
39079331,
40219814,
38514635,
41429784,
40690003,
41602478,
40182488,
40696388,
41645855,
39021194,
41551321,
38900605,
41613938,
41631285
                           )     
                                
                                
                    GROUP BY 
                    D.ANUL,
                    D.CUATM, 
                    D.CUIIO,
                    R.DENUMIRE,
                    D.CAEM2
                    
                    ORDER BY
                    D.CUATM