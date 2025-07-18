SELECT


  R.NUME_ROW,
  TO_NUMBER(R.NR_ROW) AS ORDINE,
     SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1104_C1 END) AS R_1104_C1,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1104_C2 END) AS R_1104_C2,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1104_C3 END) AS R_1104_C3,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1104_C4 END) AS R_1104_C4,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1104_C5 END) AS R_1104_C5,

  -- RIND 1110
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1110_C1 END) AS R_1110_C1,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1110_C2 END) AS R_1110_C2,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1110_C3 END) AS R_1110_C3,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1110_C4 END) AS R_1110_C4,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1110_C5 END) AS R_1110_C5,

  -- RIND 1117
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1117_C1 END) AS R_1117_C1,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1117_C2 END) AS R_1117_C2,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1117_C3 END) AS R_1117_C3,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1117_C4 END) AS R_1117_C4,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1117_C5 END) AS R_1117_C5,

  -- RIND 1218
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1218_C1 END) AS R_1218_C1,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1218_C2 END) AS R_1218_C2,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1218_C3 END) AS R_1218_C3,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1218_C4 END) AS R_1218_C4,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1218_C5 END) AS R_1218_C5,

  -- RIND 1631
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1631_C1 END) AS R_1631_C1,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1631_C2 END) AS R_1631_C2,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1631_C3 END) AS R_1631_C3,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1631_C4 END) AS R_1631_C4,
  SUM(CASE WHEN CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%' THEN L.R_1631_C5 END) AS R_1631_C5

FROM
(
SELECT
   -- D.CUIIO,
    D.CUATM,
    C.DENUMIRE,
    C.FULL_CODE,

    -- RIND 1104
    NULLIF(SUM(CASE WHEN D.RIND = '1104' THEN D.COL1 ELSE 0 END), 0) AS R_1104_C1,
    NULLIF(SUM(CASE WHEN D.RIND = '1104' THEN D.COL2 ELSE 0 END), 0) AS R_1104_C2,
    NULLIF(SUM(CASE WHEN D.RIND = '1104' THEN D.COL3 ELSE 0 END), 0) AS R_1104_C3,
    NULLIF(SUM(CASE WHEN D.RIND = '1104' THEN D.COL4 ELSE 0 END), 0) AS R_1104_C4,
    NULLIF(SUM(CASE WHEN D.RIND = '1104' THEN D.COL5 ELSE 0 END), 0) AS R_1104_C5,

    -- RIND 1110
    NULLIF(SUM(CASE WHEN D.RIND = '1110' THEN D.COL1 ELSE 0 END), 0) AS R_1110_C1,
    NULLIF(SUM(CASE WHEN D.RIND = '1110' THEN D.COL2 ELSE 0 END), 0) AS R_1110_C2,
    NULLIF(SUM(CASE WHEN D.RIND = '1110' THEN D.COL3 ELSE 0 END), 0) AS R_1110_C3,
    NULLIF(SUM(CASE WHEN D.RIND = '1110' THEN D.COL4 ELSE 0 END), 0) AS R_1110_C4,
    NULLIF(SUM(CASE WHEN D.RIND = '1110' THEN D.COL5 ELSE 0 END), 0) AS R_1110_C5,

    -- RIND 1117
    NULLIF(SUM(CASE WHEN D.RIND = '1117' THEN D.COL1 ELSE 0 END), 0) AS R_1117_C1,
    NULLIF(SUM(CASE WHEN D.RIND = '1117' THEN D.COL2 ELSE 0 END), 0) AS R_1117_C2,
    NULLIF(SUM(CASE WHEN D.RIND = '1117' THEN D.COL3 ELSE 0 END), 0) AS R_1117_C3,
    NULLIF(SUM(CASE WHEN D.RIND = '1117' THEN D.COL4 ELSE 0 END), 0) AS R_1117_C4,
    NULLIF(SUM(CASE WHEN D.RIND = '1117' THEN D.COL5 ELSE 0 END), 0) AS R_1117_C5,

    -- RIND 1218
    NULLIF(SUM(CASE WHEN D.RIND = '1218' THEN D.COL1 ELSE 0 END), 0) AS R_1218_C1,
    NULLIF(SUM(CASE WHEN D.RIND = '1218' THEN D.COL2 ELSE 0 END), 0) AS R_1218_C2,
    NULLIF(SUM(CASE WHEN D.RIND = '1218' THEN D.COL3 ELSE 0 END), 0) AS R_1218_C3,
    NULLIF(SUM(CASE WHEN D.RIND = '1218' THEN D.COL4 ELSE 0 END), 0) AS R_1218_C4,
    NULLIF(SUM(CASE WHEN D.RIND = '1218' THEN D.COL5 ELSE 0 END), 0) AS R_1218_C5,

    -- RIND 1631
    NULLIF(SUM(CASE WHEN D.RIND = '1631' THEN D.COL1 ELSE 0 END), 0) AS R_1631_C1,
    NULLIF(SUM(CASE WHEN D.RIND = '1631' THEN D.COL2 ELSE 0 END), 0) AS R_1631_C2,
    NULLIF(SUM(CASE WHEN D.RIND = '1631' THEN D.COL3 ELSE 0 END), 0) AS R_1631_C3,
    NULLIF(SUM(CASE WHEN D.RIND = '1631' THEN D.COL4 ELSE 0 END), 0) AS R_1631_C4,
    NULLIF(SUM(CASE WHEN D.RIND = '1631' THEN D.COL5 ELSE 0 END), 0) AS R_1631_C5

FROM CIS2.VW_DATA_ALL D
INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
WHERE 
    D.PERIOADA IN (1060)
    AND D.FORM IN (45)
    AND D.CAPITOL = 399
    AND D.RIND IN ('1104','1110','1117','1218','1631')
GROUP BY
   -- D.CUIIO,
    D.CUATM,
    C.DENUMIRE,
    C.FULL_CODE
    
    ORDER BY
    C.FULL_CODE

) L INNER JOIN VW_CL_CUATM CC ON(L.CUATM = CC.CODUL)    

CROSS JOIN 
  (
    SELECT
      DECODE(CS.CODUL, 
      '0000000','01','0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39')
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000'
        )
  ) R 
    

GROUP BY
 R.NUME_ROW,
 TO_NUMBER(R.NR_ROW) 

ORDER BY

 TO_NUMBER(R.NR_ROW) 