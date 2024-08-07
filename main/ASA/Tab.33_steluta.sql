--INSERT INTO CIS2.TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,  
--  COL1,COL2
--)
--     
SELECT 
--:pPERIOADA AS PERIOADA,
--:pFORM AS FORM,
--:pFORM_VERS AS FORM_VERS,
--:pID_MDTABLE AS ID_MDTABLE,
--:pCOD_CUATM AS COD_CUATM,    
--'0' AS NR_SECTIE,
--'0' AS NUME_SECTIE, 
--'0' AS NR_SECTIE1,
--'0' AS NUME_SECTIE1,
--'0' AS NR_SECTIE2,
--'0' AS NUME_SECTIE2, 
NR_ROW AS NR_ROW,
ORDINE AS ORDINE,
'0000000' AS DECIMAL_POS,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NUME_ROW,'<br>'),'nbsp'),'&;'),'</b>'),'<br />'),'<b>'),'-') AS NUME_ROW,
COL1,COL2
FROM
(

-------------------------------------------------------------------------------     
 SELECT  DISTINCT 
 CASE 
 WHEN R.RIND IN '800' THEN '47'   
 WHEN R.RIND IN '810' THEN '47.10'  
 WHEN R.RIND IN '820' THEN '47.1' 
 WHEN R.RIND IN '821' THEN '47.11' 
 WHEN R.RIND IN '822' THEN '47.12' 
 WHEN R.RIND IN '823' THEN '47.13'
 WHEN R.RIND IN '824' THEN '47.14' 
 WHEN R.RIND IN '825' THEN '47.15' 
 WHEN R.RIND IN '826' THEN '47.16'  
 WHEN R.RIND IN '827' THEN '47.17'
 WHEN R.RIND IN '828' THEN '47.18' 
 WHEN R.RIND IN '829' THEN '47.19'
 WHEN R.RIND IN '830' THEN '47.2'
 WHEN R.RIND IN '831' THEN '47.25' 
 WHEN R.RIND IN '832' THEN '47.26'
 WHEN R.RIND IN '833' THEN '47.27'
 WHEN R.RIND IN '834' THEN '47.28'-- fictiv
 WHEN R.RIND IN '840' THEN '47.29'--fictiv
 WHEN R.RIND IN '850' THEN '47.3'
 WHEN R.RIND IN '860' THEN '47.4'
 WHEN R.RIND IN '870' THEN '47.5'
 WHEN R.RIND IN '871' THEN '47.54'
 WHEN R.RIND IN '872' THEN '47.55'
 WHEN R.RIND IN '880' THEN '47.6'
 WHEN R.RIND IN '890' THEN '47.7'
 WHEN R.RIND IN '891' THEN '47.71'
 WHEN R.RIND IN '892' THEN '47.72'
 WHEN R.RIND IN '893' THEN '47.74'
 WHEN R.RIND IN '894' THEN '47.76'
 WHEN R.RIND IN '900' THEN '47.8' 
 WHEN R.RIND IN '901' THEN '47.81'   END AS NR_ROW,
 R.ORDINE,
 
 CASE 
 WHEN R.RIND IN '800' THEN SUBSTR(R.DENUMIRE,1,105)||SUBSTR(R.DENUMIRE,-9,9)
 WHEN R.RIND IN '810' THEN SUBSTR(R.DENUMIRE,1,26)
 WHEN R.RIND IN '820' THEN SUBSTR(R.DENUMIRE,8,109)
 WHEN R.RIND IN '830' THEN SUBSTR(R.DENUMIRE,8,73)
 --WHEN R.RIND IN '834' THEN SUBSTR(R.DENUMIRE,4,100)
 WHEN R.RIND IN '840' THEN SUBSTR(R.DENUMIRE,1,29)
 WHEN R.RIND IN '893' THEN SUBSTR(R.DENUMIRE,24,100)
 ELSE SUBSTR(R.DENUMIRE,9,200) END AS NUME_ROW, 
 
 SUM(CIS2.NVAL( D.COL1)) AS COL1,  
 NULL AS COL2
 
FROM   
    CIS2.VW_DATA_ALL_COEF D INNER JOIN CIS2.MD_RIND R
    ON D.RIND=R.RIND AND D.RIND_VERS=R.RIND_VERS
    
    INNER JOIN (  SELECT DISTINCT D.CUIIO, D.CUIIO_VERS
    FROM CIS2.VW_DATA_ALL D
   WHERE D.FORM IN (64) AND D.PERIOADA IN (2010)
GROUP BY D.CUIIO, D.CUIIO_VERS
  HAVING MAX (
             CASE
                 WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31
                 ELSE NULL
             END) LIKE
             '47%') DD ON DD.CUIIO  = D.CUIIO AND DD.CUIIO_VERS = D.CUIIO_VERS 
             
WHERE
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
  D.PERIOADA IN (:pPERIOADA) AND
  D.FORM IN (64) AND 
  D.CAPITOL IN (1180)   
  
  GROUP BY R.RIND, R.ORDINE, R.DENUMIRE
   
  ORDER BY R.ORDINE
 )
    