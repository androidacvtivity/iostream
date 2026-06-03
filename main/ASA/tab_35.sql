INSERT INTO TABLE_OUT 
(
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,
  
  COL1, COL2, COL3, COL4
)

SELECT 
  :pPERIOADA AS PERIOADA,                                                    
  :pFORM AS FORM,                                                            
  :pFORM_VERS AS FORM_VERS,                                                  
  :pID_MDTABLE AS ID_MDTABLE,                                                
  :pCOD_CUATM AS COD_CUATM,                                                  
  '0' AS NR_SECTIE,                                                         
  '0' AS NUME_SECTIE,                                                        
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,       
   R.CUATM ||'~'||ROWNUM AS NR_ROW,
   ROWNUM AS ORDINE,
  '00000' AS DECIMAL_POS,
   R.DENUMIRE AS NUME_ROW,
   R.CUIIO AS COL1,
   SUBSTR(R.CAEM2,2,4) AS COL2,
   L.COL1 AS COL3,
   L.COL2 AS COL4
           
            FROM
            (
            SELECT 
            R.CUIIO,
            R.CUIIO_VERS,
            R.DENUMIRE,
            R.CUATM,
            R.CAEM2,
            C.FULL_CODE 
            FROM
            (
            SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
   INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
  WHERE
  C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' AND
  FC.FORM IN (64) AND
  FC.STATUT <> '3'
  
  ORDER BY 
  C.FULL_CODE ) R LEFT JOIN (
  
  SELECT 
 
   D.CUIIO, 
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA  AND D.CAPITOL IN (100) AND D.RIND IN ('1','2','3','4','5','6','7') THEN TO_NUMBER(D.RIND) ELSE 0 END) AS COL1,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1  AND D.CAPITOL IN (100) AND D.RIND IN ('1','2','3','4','5','6','7') THEN TO_NUMBER(D.RIND) ELSE 0 END) AS COL2

FROM CIS2.VW_DATA_ALL D
INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
 -- (:pID_MDTABLE=:pID_MDTABLE) AND
   D.FORM IN (64) AND
   D.CAPITOL IN (100) AND
   D.PERIOADA IN (:pPERIOADA,  :pPERIOADA-1 )
  -- AND D.CUIIO = 34275
   GROUP BY 
   D.CUIIO
 
  
  ) L ON L.CUIIO = R.CUIIO 