-- CREATE OR REPLACE FORCE VIEW USER_BANCU.EI_78_DATA_ALL_2024 
--AS

--SELECT 
--CUIIO,
--COL1
--FROM 
--
--(


--Adauga pentru urmatoarele coloane in like sa fie urmatoarele coduru dupa exemplu de col1 si col2 - trebuie sa fie 37 de coloane 

-- 3.6.1	3.6.2	3.6.3	3.7.1	3.7.3	3.8.1	3.8.2	3.8.3	3.9	4.2.3	6.1.1	6.1.2	6.1.3	6.2	6.3	6.4.1	6.4.2	8.1	8.2	8.3	8.4.1	8.4.2	9.3.1	9.3.2	10.1.1.2	10.2.1.1	10.2.2.1	10.3.1.3	10.3.2.1	10.3.2.2	10.3.3	11.1.1	11.1.2	11.2.1	11.2.2	11.2.3

SELECT 
     d.cuiio,   
     SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'2.00.00'||';%'
     AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL1,
     
     SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'3.6.1'||';%'
     AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL2
   
     

     FROM CIS2.VW_DATA_ALL D
         INNER JOIN CIS2.VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
         
         
                 
       
   WHERE 
 
  (D.PERIOADA BETWEEN 1060 AND 1063) AND 
  (D.FORM = 44) AND
  (D.FORM_VERS = 1004) AND 
  
  D.FORM IN (44)
  AND D.CAPITOL IN (405) 
 --- and CI.ITEM_CODE in ('9.2.2')
  
  
  GROUP BY 
  d.cuiio
  
--  )
--  
--where 
--
--COL1 <>  0

-- or 
--COL2 <>  0 or 
--COL3 <>  0 or 
--COL4 <>  0 or 
--COL5 <>  0 OR 
--COL6 <>  0 OR 
--COL7 <>  0 OR 
--COL8 <>  0
  
----  CII.SHOW_ORDER,  
----  CII.NAME
