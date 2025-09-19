 CREATE OR REPLACE FORCE VIEW USER_BANCU.EI_78_DATA_ALL_2024 
AS

SELECT 
CUIIO,
COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8 
FROM 

(
SELECT 
     d.cuiio,   
     SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'5.00.00'||';%'
     AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL1,
         SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'9.1'||';%'
     AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL2,
           
                   SUM(CASE WHEN  D.CAPITOL IN (405)   AND 
                   
                   (
                   
                   REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.1.1'||';%'
                   OR 
                   REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.1.2'||';%'
                   OR 
                   REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.1.3'||';%'
                   
                   )
    

 AND D.RIND NOT IN ('1','-')  
     
     THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL3,
     
     
      SUM(CASE WHEN  D.CAPITOL IN (405)   AND 
                   
                   (
                   
                   REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.2.1'||';%'
                   OR 
                   REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.2.2'||';%'
                   OR 
                   REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.2.3'||';%'
                   
                   )
    

 AND D.RIND NOT IN ('1','-')  
     
     THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL4,
     
     SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'10.3.1.1'||';%'
     AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL5,
     
         SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'10.3.1.2'||';%'
     AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL6,
     
     
     
     
     
              SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'4.2.4'||';%'
     AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL7, 
     
                   SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'11.2.4'||';%'
     AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL8      
     

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
  
  )
  
where 

COL1 <>  0 or 
COL2 <>  0 or 
COL3 <>  0 or 
COL4 <>  0 or 
COL5 <>  0 OR 
COL6 <>  0 OR 
COL7 <>  0 OR 
COL8 <>  0
  
----  CII.SHOW_ORDER,  
----  CII.NAME
