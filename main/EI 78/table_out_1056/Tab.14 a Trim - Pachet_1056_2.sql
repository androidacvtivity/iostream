DECLARE
  CURSOR C IS

SELECT
  DISTINCT D.CUIIO NR_ROW,
   D.FORM, 
   D.PACHET AS COL1,
   SUBSTR(NR_ROW, 1, INSTR(NR_ROW, '-') - 1)
FROM
  CIS2.VW_DATA_ALL D 
 WHERE 
  (D.PERIOADA IN(:pPERIOADA)) AND    
  (D.FORM =:pFORM) 
  

 ;  
      
      
      
      

BEGIN
  
    FOR CR IN C LOOP
    
     
    
       UPDATE TABLE_OUT 
        
  --  UPDATE  USER_BANCU.TABLE_OUT_EI_78_4
    
      
        SET  COL1 = CR.COL1 

--      SELECT *
      
--      FROM TABLE_OUT         
        WHERE 
          COD_CUATM IN (:pCOD_CUATM)   AND
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE IN (:pID_MDTABLE) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS) 
          
          AND    
          --SUBSTR(NR_ROW, 1, INSTR(NR_ROW, '-') - 1) =  CR.
          NR_ROW  = SUBSTR(CR.NR_ROW, 1, INSTR(CR.NR_ROW, '-') - 1)
          
          AND COL1 IS NULL 
          
          ;
         
        
       
        
    
            
    END LOOP;   

END;