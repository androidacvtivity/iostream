SELECT 
                   DISTINCT FC.UNIT_CODE,
                   FC.NAME,
                   R.CUATM,
                   CASE WHEN R.RIND_010_COL2 = 0 THEN NULL ELSE R.RIND_010_COL2 END AS RIND_010_COL2,
    CASE WHEN R.RIND_010_COL4 = 0 THEN NULL ELSE R.RIND_010_COL4 END AS RIND_010_COL4,
    CASE WHEN R.RIND_011_COL2 = 0 THEN NULL ELSE R.RIND_011_COL2 END AS RIND_011_COL2,
    CASE WHEN R.RIND_011_COL4 = 0 THEN NULL ELSE R.RIND_011_COL4 END AS RIND_011_COL4,
    CASE WHEN R.RIND_012_COL2 = 0 THEN NULL ELSE R.RIND_012_COL2 END AS RIND_012_COL2,
    CASE WHEN R.RIND_012_COL4 = 0 THEN NULL ELSE R.RIND_012_COL4 END AS RIND_012_COL4,
    CASE WHEN R.RIND_013_COL2 = 0 THEN NULL ELSE R.RIND_013_COL2 END AS RIND_013_COL2,
    CASE WHEN R.RIND_013_COL4 = 0 THEN NULL ELSE R.RIND_013_COL4 END AS RIND_013_COL4,
    CASE WHEN R.RIND_014_COL2 = 0 THEN NULL ELSE R.RIND_014_COL2 END AS RIND_014_COL2,
    CASE WHEN R.RIND_014_COL4 = 0 THEN NULL ELSE R.RIND_014_COL4 END AS RIND_014_COL4,
    CASE WHEN R.RIND_015_COL2 = 0 THEN NULL ELSE R.RIND_015_COL2 END AS RIND_015_COL2,
    CASE WHEN R.RIND_015_COL4 = 0 THEN NULL ELSE R.RIND_015_COL4 END AS RIND_015_COL4,
    CASE WHEN R.RIND_016_COL2 = 0 THEN NULL ELSE R.RIND_016_COL2 END AS RIND_016_COL2,
    CASE WHEN R.RIND_016_COL4 = 0 THEN NULL ELSE R.RIND_016_COL4 END AS RIND_016_COL4,
    CASE WHEN R.RIND_017_COL2 = 0 THEN NULL ELSE R.RIND_017_COL2 END AS RIND_017_COL2,
    CASE WHEN R.RIND_017_COL4 = 0 THEN NULL ELSE R.RIND_017_COL4 END AS RIND_017_COL4,
    CASE WHEN R.RIND_020_COL2 = 0 THEN NULL ELSE R.RIND_020_COL2 END AS RIND_020_COL2,
    CASE WHEN R.RIND_020_COL4 = 0 THEN NULL ELSE R.RIND_020_COL4 END AS RIND_020_COL4,
    CASE WHEN R.RIND_021_COL2 = 0 THEN NULL ELSE R.RIND_021_COL2 END AS RIND_021_COL2,
    CASE WHEN R.RIND_021_COL4 = 0 THEN NULL ELSE R.RIND_021_COL4 END AS RIND_021_COL4,
    CASE WHEN R.RIND_022_COL2 = 0 THEN NULL ELSE R.RIND_022_COL2 END AS RIND_022_COL2,
    CASE WHEN R.RIND_022_COL4 = 0 THEN NULL ELSE R.RIND_022_COL4 END AS RIND_022_COL4,
    CASE WHEN R.RIND_023_COL2 = 0 THEN NULL ELSE R.RIND_023_COL2 END AS RIND_023_COL2,
    CASE WHEN R.RIND_023_COL4 = 0 THEN NULL ELSE R.RIND_023_COL4 END AS RIND_023_COL4,
    CASE WHEN R.RIND_024_COL2 = 0 THEN NULL ELSE R.RIND_024_COL2 END AS RIND_024_COL2,
    CASE WHEN R.RIND_024_COL4 = 0 THEN NULL ELSE R.RIND_024_COL4 END AS RIND_024_COL4,
    CASE WHEN R.RIND_030_COL2 = 0 THEN NULL ELSE R.RIND_030_COL2 END AS RIND_030_COL2,
    CASE WHEN R.RIND_030_COL4 = 0 THEN NULL ELSE R.RIND_030_COL4 END AS RIND_030_COL4,
    CASE WHEN R.RIND_040_COL2 = 0 THEN NULL ELSE R.RIND_040_COL2 END AS RIND_040_COL2,
    CASE WHEN R.RIND_040_COL4 = 0 THEN NULL ELSE R.RIND_040_COL4 END AS RIND_040_COL4,
    CASE WHEN R.RIND_041_COL2 = 0 THEN NULL ELSE R.RIND_041_COL2 END AS RIND_041_COL2,
    CASE WHEN R.RIND_041_COL4 = 0 THEN NULL ELSE R.RIND_041_COL4 END AS RIND_041_COL4,
    CASE WHEN R.RIND_042_COL2 = 0 THEN NULL ELSE R.RIND_042_COL2 END AS RIND_042_COL2,
    CASE WHEN R.RIND_042_COL4 = 0 THEN NULL ELSE R.RIND_042_COL4 END AS RIND_042_COL4,
    CASE WHEN R.RIND_043_COL2 = 0 THEN NULL ELSE R.RIND_043_COL2 END AS RIND_043_COL2,
    CASE WHEN R.RIND_043_COL4 = 0 THEN NULL ELSE R.RIND_043_COL4 END AS RIND_043_COL4,
    CASE WHEN R.RIND_044_COL2 = 0 THEN NULL ELSE R.RIND_044_COL2 END AS RIND_044_COL2,
    CASE WHEN R.RIND_044_COL4 = 0 THEN NULL ELSE R.RIND_044_COL4 END AS RIND_044_COL4,
    CASE WHEN R.RIND_045_COL2 = 0 THEN NULL ELSE R.RIND_045_COL2 END AS RIND_045_COL2,
    CASE WHEN R.RIND_045_COL4 = 0 THEN NULL ELSE R.RIND_045_COL4 END AS RIND_045_COL4,
    CASE WHEN R.RIND_046_COL2 = 0 THEN NULL ELSE R.RIND_046_COL2 END AS RIND_046_COL2,
    CASE WHEN R.RIND_046_COL4 = 0 THEN NULL ELSE R.RIND_046_COL4 END AS RIND_046_COL4,
    CASE WHEN R.RIND_047_COL2 = 0 THEN NULL ELSE R.RIND_047_COL2 END AS RIND_047_COL2,
    CASE WHEN R.RIND_047_COL4 = 0 THEN NULL ELSE R.RIND_047_COL4 END AS RIND_047_COL4,
    CASE WHEN R.RIND_048_COL2 = 0 THEN NULL ELSE R.RIND_048_COL2 END AS RIND_048_COL2,
    CASE WHEN R.RIND_048_COL4 = 0 THEN NULL ELSE R.RIND_048_COL4 END AS RIND_048_COL4,
    CASE WHEN R.RIND_049_COL2 = 0 THEN NULL ELSE R.RIND_049_COL2 END AS RIND_049_COL2,
    CASE WHEN R.RIND_049_COL4 = 0 THEN NULL ELSE R.RIND_049_COL4 END AS RIND_049_COL4,
    CASE WHEN R.RIND_050_COL2 = 0 THEN NULL ELSE R.RIND_050_COL2 END AS RIND_050_COL2,
    CASE WHEN R.RIND_050_COL4 = 0 THEN NULL ELSE R.RIND_050_COL4 END AS RIND_050_COL4,
    CASE WHEN R.RIND_051_COL2 = 0 THEN NULL ELSE R.RIND_051_COL2 END AS RIND_051_COL2,
    CASE WHEN R.RIND_051_COL4 = 0 THEN NULL ELSE R.RIND_051_COL4 END AS RIND_051_COL4,
    CASE WHEN R.RIND_052_COL2 = 0 THEN NULL ELSE R.RIND_052_COL2 END AS RIND_052_COL2,
    CASE WHEN R.RIND_052_COL4 = 0 THEN NULL ELSE R.RIND_052_COL4 END AS RIND_052_COL4,
    CASE WHEN R.RIND_053_COL2 = 0 THEN NULL ELSE R.RIND_053_COL2 END AS RIND_053_COL2,
    CASE WHEN R.RIND_053_COL4 = 0 THEN NULL ELSE R.RIND_053_COL4 END AS RIND_053_COL4,
    CASE WHEN R.RIND_054_COL2 = 0 THEN NULL ELSE R.RIND_054_COL2 END AS RIND_054_COL2,
    CASE WHEN R.RIND_054_COL4 = 0 THEN NULL ELSE R.RIND_054_COL4 END AS RIND_054_COL4,
    CASE WHEN R.RIND_060_COL2 = 0 THEN NULL ELSE R.RIND_060_COL2 END AS RIND_060_COL2,
    CASE WHEN R.RIND_060_COL4 = 0 THEN NULL ELSE R.RIND_060_COL4 END AS RIND_060_COL4,
    CASE WHEN R.RIND_070_COL2 = 0 THEN NULL ELSE R.RIND_070_COL2 END AS RIND_070_COL2,
    CASE WHEN R.RIND_070_COL4 = 0 THEN NULL ELSE R.RIND_070_COL4 END AS RIND_070_COL4,
    CASE WHEN R.RIND_071_COL2 = 0 THEN NULL ELSE R.RIND_071_COL2 END AS RIND_071_COL2,
    CASE WHEN R.RIND_071_COL4 = 0 THEN NULL ELSE R.RIND_071_COL4 END AS RIND_071_COL4,
    CASE WHEN R.RIND_072_COL2 = 0 THEN NULL ELSE R.RIND_072_COL2 END AS RIND_072_COL2,
    CASE WHEN R.RIND_072_COL4 = 0 THEN NULL ELSE R.RIND_072_COL4 END AS RIND_072_COL4,
    CASE WHEN R.RIND_080_COL2 = 0 THEN NULL ELSE R.RIND_080_COL2 END AS RIND_080_COL2,
    CASE WHEN R.RIND_080_COL4 = 0 THEN NULL ELSE R.RIND_080_COL4 END AS RIND_080_COL4,
    CASE WHEN R.RIND_081_COL2 = 0 THEN NULL ELSE R.RIND_081_COL2 END AS RIND_081_COL2,
    CASE WHEN R.RIND_081_COL4 = 0 THEN NULL ELSE R.RIND_081_COL4 END AS RIND_081_COL4,
    CASE WHEN R.RIND_082_COL2 = 0 THEN NULL ELSE R.RIND_082_COL2 END AS RIND_082_COL2,
    CASE WHEN R.RIND_082_COL4 = 0 THEN NULL ELSE R.RIND_082_COL4 END AS RIND_082_COL4,
    CASE WHEN R.RIND_083_COL2 = 0 THEN NULL ELSE R.RIND_083_COL2 END AS RIND_083_COL2,
    CASE WHEN R.RIND_083_COL4 = 0 THEN NULL ELSE R.RIND_083_COL4 END AS RIND_083_COL4,
    CASE WHEN R.RIND_090_COL2 = 0 THEN NULL ELSE R.RIND_090_COL2 END AS RIND_090_COL2,
    CASE WHEN R.RIND_090_COL4 = 0 THEN NULL ELSE R.RIND_090_COL4 END AS RIND_090_COL4,
    CASE WHEN R.RIND_091_COL2 = 0 THEN NULL ELSE R.RIND_091_COL2 END AS RIND_091_COL2,
    CASE WHEN R.RIND_091_COL4 = 0 THEN NULL ELSE R.RIND_091_COL4 END AS RIND_091_COL4,
    CASE WHEN R.RIND_092_COL2 = 0 THEN NULL ELSE R.RIND_092_COL2 END AS RIND_092_COL2,
    CASE WHEN R.RIND_092_COL4 = 0 THEN NULL ELSE R.RIND_092_COL4 END AS RIND_092_COL4,
    CASE WHEN R.RIND_093_COL2 = 0 THEN NULL ELSE R.RIND_093_COL2 END AS RIND_093_COL2,
    CASE WHEN R.RIND_093_COL4 = 0 THEN NULL ELSE R.RIND_093_COL4 END AS RIND_093_COL4,
    CASE WHEN R.RIND_094_COL2 = 0 THEN NULL ELSE R.RIND_094_COL2 END AS RIND_094_COL2,
    CASE WHEN R.RIND_094_COL4 = 0 THEN NULL ELSE R.RIND_094_COL4 END AS RIND_094_COL4,
    CASE WHEN R.RIND_100_COL2 = 0 THEN NULL ELSE R.RIND_100_COL2 END AS RIND_100_COL2,
    CASE WHEN R.RIND_100_COL4 = 0 THEN NULL ELSE R.RIND_100_COL4 END AS RIND_100_COL4,
    CASE WHEN R.RIND_110_COL2 = 0 THEN NULL ELSE R.RIND_110_COL2 END AS RIND_110_COL2,
    CASE WHEN R.RIND_110_COL4 = 0 THEN NULL ELSE R.RIND_110_COL4 END AS RIND_110_COL4,
    CASE WHEN R.RIND_120_COL2 = 0 THEN NULL ELSE R.RIND_120_COL2 END AS RIND_120_COL2,
    CASE WHEN R.RIND_120_COL4 = 0 THEN NULL ELSE R.RIND_120_COL4 END AS RIND_120_COL4,
    CASE WHEN R.RIND_131_COL2 = 0 THEN NULL ELSE R.RIND_131_COL2 END AS RIND_131_COL2,
    CASE WHEN R.RIND_131_COL4 = 0 THEN NULL ELSE R.RIND_131_COL4 END AS RIND_131_COL4,
    CASE WHEN R.RIND_132_COL2 = 0 THEN NULL ELSE R.RIND_132_COL2 END AS RIND_132_COL2,
    CASE WHEN R.RIND_132_COL4 = 0 THEN NULL ELSE R.RIND_132_COL4 END AS RIND_132_COL4

                   
                  
                      

                   FROM

(

SELECT FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   RR.NAME
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  
                   
                   SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFORM_1) AND UNIT_CODE_VERS <= :pPERIOADA_1
                               GROUP BY UNIT_CODE
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
                         
                         INNER JOIN  CIS2.REG_UNIT_GC RR 
                               ON RR.UNIT_CODE = BB.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = BB.UNIT_CODE_VERS
                           
             WHERE 
             FC.FORM IN (:pFORM_1) AND FC.STATUT <> '3' 
             
             
             
             ) FC LEFT JOIN (
             
             
             SELECT 
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '010' THEN D.COL2 ELSE NULL  END) AS RIND_010_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '010' THEN D.COL4 ELSE NULL  END) AS RIND_010_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '011' THEN D.COL2 ELSE NULL  END) AS RIND_011_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '011' THEN D.COL4 ELSE NULL  END) AS RIND_011_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '012' THEN D.COL2 ELSE NULL  END) AS RIND_012_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '012' THEN D.COL4 ELSE NULL  END) AS RIND_012_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '013' THEN D.COL2 ELSE NULL  END) AS RIND_013_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '013' THEN D.COL4 ELSE NULL  END) AS RIND_013_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '014' THEN D.COL2 ELSE NULL  END) AS RIND_014_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '014' THEN D.COL4 ELSE NULL  END) AS RIND_014_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '015' THEN D.COL2 ELSE NULL  END) AS RIND_015_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '015' THEN D.COL4 ELSE NULL  END) AS RIND_015_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '016' THEN D.COL2 ELSE NULL  END) AS RIND_016_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '016' THEN D.COL4 ELSE NULL  END) AS RIND_016_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '017' THEN D.COL2 ELSE NULL  END) AS RIND_017_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '017' THEN D.COL4 ELSE NULL  END) AS RIND_017_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '020' THEN D.COL2 ELSE NULL  END) AS RIND_020_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '020' THEN D.COL4 ELSE NULL  END) AS RIND_020_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '021' THEN D.COL2 ELSE NULL  END) AS RIND_021_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '021' THEN D.COL4 ELSE NULL  END) AS RIND_021_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '022' THEN D.COL2 ELSE NULL  END) AS RIND_022_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '022' THEN D.COL4 ELSE NULL  END) AS RIND_022_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '023' THEN D.COL2 ELSE NULL  END) AS RIND_023_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '023' THEN D.COL4 ELSE NULL  END) AS RIND_023_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '024' THEN D.COL2 ELSE NULL  END) AS RIND_024_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '024' THEN D.COL4 ELSE NULL  END) AS RIND_024_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '030' THEN D.COL2 ELSE NULL  END) AS RIND_030_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '030' THEN D.COL4 ELSE NULL  END) AS RIND_030_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '040' THEN D.COL2 ELSE NULL  END) AS RIND_040_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '040' THEN D.COL4 ELSE NULL  END) AS RIND_040_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '041' THEN D.COL2 ELSE NULL  END) AS RIND_041_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '041' THEN D.COL4 ELSE NULL  END) AS RIND_041_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '042' THEN D.COL2 ELSE NULL  END) AS RIND_042_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '042' THEN D.COL4 ELSE NULL  END) AS RIND_042_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '043' THEN D.COL2 ELSE NULL  END) AS RIND_043_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '043' THEN D.COL4 ELSE NULL  END) AS RIND_043_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '044' THEN D.COL2 ELSE NULL  END) AS RIND_044_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '044' THEN D.COL4 ELSE NULL  END) AS RIND_044_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '045' THEN D.COL2 ELSE NULL  END) AS RIND_045_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '045' THEN D.COL4 ELSE NULL  END) AS RIND_045_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '046' THEN D.COL2 ELSE NULL  END) AS RIND_046_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '046' THEN D.COL4 ELSE NULL  END) AS RIND_046_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '047' THEN D.COL2 ELSE NULL  END) AS RIND_047_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '047' THEN D.COL4 ELSE NULL  END) AS RIND_047_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '048' THEN D.COL2 ELSE NULL  END) AS RIND_048_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '048' THEN D.COL4 ELSE NULL  END) AS RIND_048_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '049' THEN D.COL2 ELSE NULL  END) AS RIND_049_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '049' THEN D.COL4 ELSE NULL  END) AS RIND_049_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '050' THEN D.COL2 ELSE NULL  END) AS RIND_050_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '050' THEN D.COL4 ELSE NULL  END) AS RIND_050_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '051' THEN D.COL2 ELSE NULL  END) AS RIND_051_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '051' THEN D.COL4 ELSE NULL  END) AS RIND_051_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '052' THEN D.COL2 ELSE NULL  END) AS RIND_052_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '052' THEN D.COL4 ELSE NULL  END) AS RIND_052_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '053' THEN D.COL2 ELSE NULL  END) AS RIND_053_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '053' THEN D.COL4 ELSE NULL  END) AS RIND_053_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '054' THEN D.COL2 ELSE NULL  END) AS RIND_054_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '054' THEN D.COL4 ELSE NULL  END) AS RIND_054_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '060' THEN D.COL2 ELSE NULL  END) AS RIND_060_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '060' THEN D.COL4 ELSE NULL  END) AS RIND_060_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '070' THEN D.COL2 ELSE NULL  END) AS RIND_070_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '070' THEN D.COL4 ELSE NULL  END) AS RIND_070_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '071' THEN D.COL2 ELSE NULL  END) AS RIND_071_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '071' THEN D.COL4 ELSE NULL  END) AS RIND_071_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '072' THEN D.COL2 ELSE NULL  END) AS RIND_072_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '072' THEN D.COL4 ELSE NULL  END) AS RIND_072_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '080' THEN D.COL2 ELSE NULL  END) AS RIND_080_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '080' THEN D.COL4 ELSE NULL  END) AS RIND_080_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '081' THEN D.COL2 ELSE NULL  END) AS RIND_081_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '081' THEN D.COL4 ELSE NULL  END) AS RIND_081_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '082' THEN D.COL2 ELSE NULL  END) AS RIND_082_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '082' THEN D.COL4 ELSE NULL  END) AS RIND_082_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '083' THEN D.COL2 ELSE NULL  END) AS RIND_083_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '083' THEN D.COL4 ELSE NULL  END) AS RIND_083_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '090' THEN D.COL2 ELSE NULL  END) AS RIND_090_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '090' THEN D.COL4 ELSE NULL  END) AS RIND_090_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '091' THEN D.COL2 ELSE NULL  END) AS RIND_091_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '091' THEN D.COL4 ELSE NULL  END) AS RIND_091_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '092' THEN D.COL2 ELSE NULL  END) AS RIND_092_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '092' THEN D.COL4 ELSE NULL  END) AS RIND_092_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '093' THEN D.COL2 ELSE NULL  END) AS RIND_093_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '093' THEN D.COL4 ELSE NULL  END) AS RIND_093_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '094' THEN D.COL2 ELSE NULL  END) AS RIND_094_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '094' THEN D.COL4 ELSE NULL  END) AS RIND_094_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '100' THEN D.COL2 ELSE NULL  END) AS RIND_100_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '100' THEN D.COL4 ELSE NULL  END) AS RIND_100_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '110' THEN D.COL2 ELSE NULL  END) AS RIND_110_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '110' THEN D.COL4 ELSE NULL  END) AS RIND_110_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '120' THEN D.COL2 ELSE NULL  END) AS RIND_120_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '120' THEN D.COL4 ELSE NULL  END) AS RIND_120_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '131' THEN D.COL2 ELSE NULL  END) AS RIND_131_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '131' THEN D.COL4 ELSE NULL  END) AS RIND_131_COL4,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '132' THEN D.COL2 ELSE NULL  END) AS RIND_132_COL2,
         SUM(CASE WHEN D.CAPITOL IN (1112) AND D.RIND = '132' THEN D.COL4 ELSE NULL  END) AS RIND_132_COL4
         
         
         
         
         
        
        
FROM
  CIS2.VW_DATA_ALL_GC  D
  
  
  
  ----
  -----
WHERE
  (D.PERIOADA IN (:pPERIOADA_1))  AND   
   D.FORM IN (:pFORM_1) 

  

  
  GROUP BY 
         D.UNIT_CODE,
         D.CUATM

             
             ) R ON R.UNIT_CODE = FC.UNIT_CODE
             
             
--             WHERE 
--             R.UNIT_CODE IS NULL  