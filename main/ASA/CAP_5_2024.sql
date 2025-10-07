SELECT 
CUIIO,
DENUMIRE,
CUATM,
RIND,
CUATM_CAP5,
CAEM2_CAP5,
COL1,
COL2,
COL3

FROM

(

SELECT  DISTINCT       
               

             D.CUIIO,  
             R.DENUMIRE,
             R.CUATM,
             C.FULL_CODE, 
             D.COL33 CUATM_CAP5,
             D.COL37 CAEM2_CAP5,
             D.RIND,
             SUM(D.COL8) AS COL1,
             SUM(D.COL9) AS COL2,
             SUM(D.COL10) AS COL3

             
           
 
            FROM CIS2.VW_DATA_ALL D 
            
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                    INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                    WHERE 
                    D.FORM IN (64)
                    AND D.CAPITOL IN (1128)
                    AND D.PERIOADA IN (2013)
--                    AND D.CUIIO = 34275

                    GROUP BY 
                                  D.CUIIO,  
             R.DENUMIRE,
             R.CUATM,
             C.FULL_CODE,
             D.COL33,
             D.COL37, 
             D.RIND







ORDER BY 
C.FULL_CODE,
D.CUIIO,
D.RIND

)