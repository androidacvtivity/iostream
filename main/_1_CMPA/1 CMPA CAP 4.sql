SELECT 
                   DISTINCT FC.UNIT_CODE,
                   FC.NAME,
                   R.CUATM,
                   CASE WHEN R.RIND_210_COL2 = 0 THEN NULL ELSE R.RIND_210_COL2 END AS RIND_210_COL2,
    CASE WHEN R.RIND_210_COL4 = 0 THEN NULL ELSE R.RIND_210_COL4 END AS RIND_210_COL4,
    CASE WHEN R.RIND_220_COL2 = 0 THEN NULL ELSE R.RIND_220_COL2 END AS RIND_220_COL2,
    CASE WHEN R.RIND_220_COL4 = 0 THEN NULL ELSE R.RIND_220_COL4 END AS RIND_220_COL4,
    CASE WHEN R.RIND_230_COL2 = 0 THEN NULL ELSE R.RIND_230_COL2 END AS RIND_230_COL2,
    CASE WHEN R.RIND_230_COL4 = 0 THEN NULL ELSE R.RIND_230_COL4 END AS RIND_230_COL4,
    CASE WHEN R.RIND_240_COL2 = 0 THEN NULL ELSE R.RIND_240_COL2 END AS RIND_240_COL2,
    CASE WHEN R.RIND_240_COL4 = 0 THEN NULL ELSE R.RIND_240_COL4 END AS RIND_240_COL4,
    CASE WHEN R.RIND_310_COL2 = 0 THEN NULL ELSE R.RIND_310_COL2 END AS RIND_310_COL2,
    CASE WHEN R.RIND_310_COL4 = 0 THEN NULL ELSE R.RIND_310_COL4 END AS RIND_310_COL4,
    CASE WHEN R.RIND_320_COL2 = 0 THEN NULL ELSE R.RIND_320_COL2 END AS RIND_320_COL2,
    CASE WHEN R.RIND_320_COL4 = 0 THEN NULL ELSE R.RIND_320_COL4 END AS RIND_320_COL4,
    CASE WHEN R.RIND_330_COL2 = 0 THEN NULL ELSE R.RIND_330_COL2 END AS RIND_330_COL2,
    CASE WHEN R.RIND_330_COL4 = 0 THEN NULL ELSE R.RIND_330_COL4 END AS RIND_330_COL4,
    CASE WHEN R.RIND_340_COL2 = 0 THEN NULL ELSE R.RIND_340_COL2 END AS RIND_340_COL2,
    CASE WHEN R.RIND_340_COL4 = 0 THEN NULL ELSE R.RIND_340_COL4 END AS RIND_340_COL4,
    CASE WHEN R.RIND_350_COL2 = 0 THEN NULL ELSE R.RIND_350_COL2 END AS RIND_350_COL2,
    CASE WHEN R.RIND_350_COL4 = 0 THEN NULL ELSE R.RIND_350_COL4 END AS RIND_350_COL4,
    CASE WHEN R.RIND_360_COL2 = 0 THEN NULL ELSE R.RIND_360_COL2 END AS RIND_360_COL2,
    CASE WHEN R.RIND_360_COL4 = 0 THEN NULL ELSE R.RIND_360_COL4 END AS RIND_360_COL4,
    CASE WHEN R.RIND_400_COL2 = 0 THEN NULL ELSE R.RIND_400_COL2 END AS RIND_400_COL2,
    CASE WHEN R.RIND_400_COL4 = 0 THEN NULL ELSE R.RIND_400_COL4 END AS RIND_400_COL4,
    CASE WHEN R.RIND_401_COL2 = 0 THEN NULL ELSE R.RIND_401_COL2 END AS RIND_401_COL2,
    CASE WHEN R.RIND_401_COL4 = 0 THEN NULL ELSE R.RIND_401_COL4 END AS RIND_401_COL4,
    CASE WHEN R.RIND_500_COL2 = 0 THEN NULL ELSE R.RIND_500_COL2 END AS RIND_500_COL2,
    CASE WHEN R.RIND_500_COL4 = 0 THEN NULL ELSE R.RIND_500_COL4 END AS RIND_500_COL4,
    CASE WHEN R.RIND_510_COL2 = 0 THEN NULL ELSE R.RIND_510_COL2 END AS RIND_510_COL2,
    CASE WHEN R.RIND_510_COL4 = 0 THEN NULL ELSE R.RIND_510_COL4 END AS RIND_510_COL4,
    CASE WHEN R.RIND_520_COL2 = 0 THEN NULL ELSE R.RIND_520_COL2 END AS RIND_520_COL2,
    CASE WHEN R.RIND_520_COL4 = 0 THEN NULL ELSE R.RIND_520_COL4 END AS RIND_520_COL4,
    CASE WHEN R.RIND_530_COL2 = 0 THEN NULL ELSE R.RIND_530_COL2 END AS RIND_530_COL2,
    CASE WHEN R.RIND_530_COL4 = 0 THEN NULL ELSE R.RIND_530_COL4 END AS RIND_530_COL4,
    CASE WHEN R.RIND_540_COL2 = 0 THEN NULL ELSE R.RIND_540_COL2 END AS RIND_540_COL2,
    CASE WHEN R.RIND_540_COL4 = 0 THEN NULL ELSE R.RIND_540_COL4 END AS RIND_540_COL4,
    CASE WHEN R.RIND_550_COL2 = 0 THEN NULL ELSE R.RIND_550_COL2 END AS RIND_550_COL2,
    CASE WHEN R.RIND_550_COL4 = 0 THEN NULL ELSE R.RIND_550_COL4 END AS RIND_550_COL4,
    CASE WHEN R.RIND_560_COL2 = 0 THEN NULL ELSE R.RIND_560_COL2 END AS RIND_560_COL2,
    CASE WHEN R.RIND_560_COL4 = 0 THEN NULL ELSE R.RIND_560_COL4 END AS RIND_560_COL4,
    CASE WHEN R.RIND_570_COL2 = 0 THEN NULL ELSE R.RIND_570_COL2 END AS RIND_570_COL2,
    CASE WHEN R.RIND_570_COL4 = 0 THEN NULL ELSE R.RIND_570_COL4 END AS RIND_570_COL4,
    CASE WHEN R.RIND_580_COL2 = 0 THEN NULL ELSE R.RIND_580_COL2 END AS RIND_580_COL2,
    CASE WHEN R.RIND_580_COL4 = 0 THEN NULL ELSE R.RIND_580_COL4 END AS RIND_580_COL4,
    CASE WHEN R.RIND_600_COL2 = 0 THEN NULL ELSE R.RIND_600_COL2 END AS RIND_600_COL2,
    CASE WHEN R.RIND_600_COL4 = 0 THEN NULL ELSE R.RIND_600_COL4 END AS RIND_600_COL4,
    CASE WHEN R.RIND_610_COL2 = 0 THEN NULL ELSE R.RIND_610_COL2 END AS RIND_610_COL2,
    CASE WHEN R.RIND_610_COL4 = 0 THEN NULL ELSE R.RIND_610_COL4 END AS RIND_610_COL4,
    CASE WHEN R.RIND_710_COL2 = 0 THEN NULL ELSE R.RIND_710_COL2 END AS RIND_710_COL2,
    CASE WHEN R.RIND_710_COL4 = 0 THEN NULL ELSE R.RIND_710_COL4 END AS RIND_710_COL4,
    CASE WHEN R.RIND_720_COL2 = 0 THEN NULL ELSE R.RIND_720_COL2 END AS RIND_720_COL2,
    CASE WHEN R.RIND_720_COL4 = 0 THEN NULL ELSE R.RIND_720_COL4 END AS RIND_720_COL4


                   
                  
                      

                   FROM

(

SELECT FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   RR.NAME
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  
                   
                   SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFORM_1) AND UNIT_CODE_VERS <= :pPERIOADA_1
                               GROUP BY UNIT_CODE
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
                         
                         INNER JOIN  CIS2.REG_UNIT_GC RR 
                               ON RR.UNIT_CODE = BB.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = BB.UNIT_CODE_VERS
                           
             WHERE 
             FC.FORM IN (:pFORM_1) AND FC.STATUT <> '3' 
             
             
             
             ) FC LEFT JOIN (
             
             
             SELECT 
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '210' THEN D.COL2 ELSE NULL END) AS RIND_210_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '210' THEN D.COL4 ELSE NULL END) AS RIND_210_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '220' THEN D.COL2 ELSE NULL END) AS RIND_220_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '220' THEN D.COL4 ELSE NULL END) AS RIND_220_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '230' THEN D.COL2 ELSE NULL END) AS RIND_230_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '230' THEN D.COL4 ELSE NULL END) AS RIND_230_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '240' THEN D.COL2 ELSE NULL END) AS RIND_240_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '240' THEN D.COL4 ELSE NULL END) AS RIND_240_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '310' THEN D.COL2 ELSE NULL END) AS RIND_310_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '310' THEN D.COL4 ELSE NULL END) AS RIND_310_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '320' THEN D.COL2 ELSE NULL END) AS RIND_320_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '320' THEN D.COL4 ELSE NULL END) AS RIND_320_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '330' THEN D.COL2 ELSE NULL END) AS RIND_330_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '330' THEN D.COL4 ELSE NULL END) AS RIND_330_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '340' THEN D.COL2 ELSE NULL END) AS RIND_340_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '340' THEN D.COL4 ELSE NULL END) AS RIND_340_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '350' THEN D.COL2 ELSE NULL END) AS RIND_350_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '350' THEN D.COL4 ELSE NULL END) AS RIND_350_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '360' THEN D.COL2 ELSE NULL END) AS RIND_360_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '360' THEN D.COL4 ELSE NULL END) AS RIND_360_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '400' THEN D.COL2 ELSE NULL END) AS RIND_400_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '400' THEN D.COL4 ELSE NULL END) AS RIND_400_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '401' THEN D.COL2 ELSE NULL END) AS RIND_401_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '401' THEN D.COL4 ELSE NULL END) AS RIND_401_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '500' THEN D.COL2 ELSE NULL END) AS RIND_500_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '500' THEN D.COL4 ELSE NULL END) AS RIND_500_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '510' THEN D.COL2 ELSE NULL END) AS RIND_510_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '510' THEN D.COL4 ELSE NULL END) AS RIND_510_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '520' THEN D.COL2 ELSE NULL END) AS RIND_520_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '520' THEN D.COL4 ELSE NULL END) AS RIND_520_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '530' THEN D.COL2 ELSE NULL END) AS RIND_530_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '530' THEN D.COL4 ELSE NULL END) AS RIND_530_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '540' THEN D.COL2 ELSE NULL END) AS RIND_540_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '540' THEN D.COL4 ELSE NULL END) AS RIND_540_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '550' THEN D.COL2 ELSE NULL END) AS RIND_550_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '550' THEN D.COL4 ELSE NULL END) AS RIND_550_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '560' THEN D.COL2 ELSE NULL END) AS RIND_560_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '560' THEN D.COL4 ELSE NULL END) AS RIND_560_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '570' THEN D.COL2 ELSE NULL END) AS RIND_570_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '570' THEN D.COL4 ELSE NULL END) AS RIND_570_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '580' THEN D.COL2 ELSE NULL END) AS RIND_580_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '580' THEN D.COL4 ELSE NULL END) AS RIND_580_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '600' THEN D.COL2 ELSE NULL END) AS RIND_600_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '600' THEN D.COL4 ELSE NULL END) AS RIND_600_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '610' THEN D.COL2 ELSE NULL END) AS RIND_610_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '610' THEN D.COL4 ELSE NULL END) AS RIND_610_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '710' THEN D.COL2 ELSE NULL END) AS RIND_710_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '710' THEN D.COL4 ELSE NULL END) AS RIND_710_COL4,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '720' THEN D.COL2 ELSE NULL END) AS RIND_720_COL2,
    SUM(CASE WHEN D.CAPITOL IN (1113) AND D.RIND = '720' THEN D.COL4 ELSE NULL END) AS RIND_720_COL4

         
         
         
         
         
         
        
        
FROM
  CIS2.VW_DATA_ALL_GC  D
  
  
  
  ----
  -----
WHERE
  (D.PERIOADA IN (:pPERIOADA_1))  AND   
   D.FORM IN (:pFORM_1) 

  

  
  GROUP BY 
         D.UNIT_CODE,
         D.CUATM

             
             ) R ON R.UNIT_CODE = FC.UNIT_CODE
             
             
--             WHERE 
--             R.UNIT_CODE IS NULL  