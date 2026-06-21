 SELECT
                D.CUIIO,
                R.IDNO,
                R.DENUMIRE,
                CC.CODUL,
                CC.FULL_CODE,
                LL.denumire AS Raion,
                CC.DENUMIRE CUATM_DENUMIRE,
                SUM(CASE WHEN   D.CAPITOL IN (399) AND  D.RIND IN ('1410') THEN D.COL1 ELSE 0 END ) AS R_1410
               
               
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                        INNER JOIN (
                        
SELECT 
C.ITEM_CODE CODUL,
C.NAME DENUMIRE,
C.A01 AS PRGS,
C.ITEM_PARENT,
C.ITEM_CODE_VERS,
C.ITEM_PATH FULL_CODE
FROM  CIS2.VW_CLS_CLASS_ITEM C INNER JOIN 
(
 SELECT 
 ITEM_CODE,
 MAX (ITEM_CODE_VERS) AS ITEM_CODE_VERS
 
 FROM  CIS2.VW_CLS_CLASS_ITEM
 
 WHERE 
 
 CLASS_CODE IN ('CUATM')
 
 GROUP BY
 ITEM_CODE ) CC ON C.ITEM_CODE = CC.ITEM_CODE AND C.ITEM_CODE_VERS = CC.ITEM_CODE_VERS
 
 
 
 ) CC ON(D.CUATM = CC.CODUL)
 
 
        INNER JOIN USER_BANCU.PRGS2 LL ON SUBSTR(LL.CODUL,1,2) = SUBSTR(D.CUATM,1,2)
            
                    WHERE 
                    D.PERIOADA IN (:pPERIOADA)
                    AND D.FORM IN (45)
                    AND D.CAPITOL IN (399) 
                   -- AND D.CUIIO = 27832
                    
                   
                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                CC.CODUL,
                CC.DENUMIRE,
                CC.FULL_CODE,
                LL.denumire,
                R.IDNO
                
                ORDER BY
                CC.FULL_CODE  
                
                
--1048
--1052
--1056
--1060
--1064


                
               
                