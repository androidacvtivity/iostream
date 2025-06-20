SELECT 
D.ANUL,
D.CUIIO,
R.IDNO,
R.DENUMIRE,
R.CUATM,
R.CFP,
R.CFOJ,
R.CAEM2,----------------------------------
MAX(CASE WHEN D.CAPITOL IN (1129)  AND D.RIND IN ('8') THEN  D.COL31 ELSE NULL END ) CAEM_ACT,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('200') THEN  D.COL1 ELSE NULL END ) RIND_200,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('210') THEN  D.COL1 ELSE NULL END ) RIND_210,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('220') THEN  D.COL1 ELSE NULL END ) RIND_220,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('221') THEN  D.COL1 ELSE NULL END ) RIND_221,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('222') THEN  D.COL1 ELSE NULL END ) RIND_222,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('240') THEN  D.COL1 ELSE NULL END ) RIND_240,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('241') THEN  D.COL1 ELSE NULL END ) RIND_241,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('242') THEN  D.COL1 ELSE NULL END ) RIND_242,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('243') THEN  D.COL1 ELSE NULL END ) RIND_243,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('260') THEN  D.COL1 ELSE NULL END ) RIND_260,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('270') THEN  D.COL1 ELSE NULL END ) RIND_270,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('280') THEN  D.COL1 ELSE NULL END ) RIND_280,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('290') THEN  D.COL1 ELSE NULL END ) RIND_290,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('291') THEN  D.COL1 ELSE NULL END ) RIND_291,
-------------------------------------------------------------------------------------------------

SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('2911') THEN  D.COL1 ELSE NULL END ) RIND_2911,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('2912') THEN  D.COL1 ELSE NULL END ) RIND_2912,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('292') THEN  D.COL1 ELSE NULL END ) RIND_292,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('293') THEN  D.COL1 ELSE NULL END ) RIND_293,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('2931') THEN  D.COL1 ELSE NULL END ) RIND_2931,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('295') THEN  D.COL1 ELSE NULL END ) RIND_295,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('296') THEN  D.COL1 ELSE NULL END ) RIND_296,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('2961') THEN  D.COL1 ELSE NULL END ) RIND_2961,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('2962') THEN  D.COL1 ELSE NULL END ) RIND_2962,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('297') THEN  D.COL1 ELSE NULL END ) RIND_297,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('300') THEN  D.COL1 ELSE NULL END ) RIND_300,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('305') THEN  D.COL1 ELSE NULL END ) RIND_305,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('310') THEN  D.COL1 ELSE NULL END ) RIND_310,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('311') THEN  D.COL1 ELSE NULL END ) RIND_311,
SUM(CASE WHEN D.CAPITOL IN (1125)  AND D.RIND IN ('312') THEN  D.COL1 ELSE NULL END ) RIND_312


FROM   
    --CIS2.VW_DATA_ALL_COEF D    
     
     
      CIS2.VW_DATA_ALL D     
    
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS  
                    
                   
WHERE
  D.FORM IN (64)             AND 
--  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (1125,1129) 
 

GROUP BY 

D.ANUL,
D.CUIIO,
R.IDNO,
R.DENUMIRE,
R.CUATM,
R.CFP,
R.CFOJ,
R.CAEM2


ORDER BY 
D.CUIIO