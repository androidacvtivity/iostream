DECLARE
  CURSOR UPD_TABLE_OUT_CNJ IS 
  
  SELECT
  T.ORDINE,
  T.NR_ROW ,
  T.COL1, 
  T.COL2,
  T.COL3,
  T.COL4    
    
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM) AND
      T.FORM = :pFORM              AND
      T.ID_MDTABLE= :pID_MDTABLE   AND      
      T.PERIOADA =:pPERIOADA;
      
      
      BEGIN
    FOR V_GT IN UPD_TABLE_OUT_CNJ LOOP
        UPDATE CIS2.TABLE_OUT 
                     
        SET  
        COL1 = ROUND((COL1*100)/CIS2.NOZERO(V_GT.COL4),1),
        COL2 = ROUND((COL2*100)/CIS2.NOZERO(V_GT.COL4),1),
        COL3 = ROUND((COL3*100)/CIS2.NOZERO(V_GT.COL4),1),
        COL4 = ROUND(ROUND((COL1*100)/CIS2.NOZERO(V_GT.COL4),1)+ROUND((COL2*100)/CIS2.NOZERO(V_GT.COL4),1)+ROUND((COL3*100)/CIS2.NOZERO(V_GT.COL4),1),0),
        COL5 = ROUND((COL1*100)/CIS2.NOZERO(V_GT.COL4),1)-ROUND((COL3*100)/CIS2.NOZERO(V_GT.COL4),1)
        WHERE 
          NR_ROW = V_GT.NR_ROW         AND
          COD_CUATM IN (:pCOD_CUATM)   AND
          PERIOADA IN (:pPERIOADA)     AND 
          ID_MDTABLE=:pID_MDTABLE      AND 
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS);
    END LOOP;  
END;