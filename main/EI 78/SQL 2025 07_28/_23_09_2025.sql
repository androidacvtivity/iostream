SELECT 
     d.cuiio, 
--  CI.ITEM_CODE,
--  CI.SHOW_ORDER,  
--  CI.NAME,

     SUM(CASE WHEN  D.CAPITOL IN (405)   
     
     AND REPLACE(' '||CI.ITEM_PATH,';','; ') 
     LIKE '% '||'2'||';%'
      
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL1
      

           
               
     

     FROM VW_DATA_ALL D
         INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
         
         
                 
       
   WHERE 
  --(D.PERIOADA =:pPERIOADA) AND 
 -- (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
  (D.PERIOADA BETWEEN 1060 AND 1063) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  
  D.FORM IN (44)
  AND D.CAPITOL IN (405) 
  
 -- AND D.CUIIO = 1050885
--  and CI.ITEM_CODE in ('55.1',
--'55.2',
--'55.3',
--'55.9')
  
  
  GROUP BY 
  d.cuiio
--  CI.ITEM_CODE,
--  CI.SHOW_ORDER,  
--  CI.NAME
