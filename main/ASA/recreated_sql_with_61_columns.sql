
SELECT 
   RR.NR_ROW,
   ROUND(SUM(
       CASE 
           WHEN RR.NR_ROW = '100' THEN DD.COL1 WHEN RR.NR_ROW = '110' THEN DD.COL2 WHEN RR.NR_ROW = '120' THEN DD.COL3 WHEN RR.NR_ROW = '130' THEN DD.COL4 WHEN RR.NR_ROW = '140' THEN DD.COL5 WHEN RR.NR_ROW = '150' THEN DD.COL6 WHEN RR.NR_ROW = '160' THEN DD.COL7 WHEN RR.NR_ROW = '170' THEN DD.COL8 WHEN RR.NR_ROW = '180' THEN DD.COL9 WHEN RR.NR_ROW = '190' THEN DD.COL10 WHEN RR.NR_ROW = '200' THEN DD.COL11 WHEN RR.NR_ROW = '210' THEN DD.COL12 WHEN RR.NR_ROW = '220' THEN DD.COL13 WHEN RR.NR_ROW = '230' THEN DD.COL14 WHEN RR.NR_ROW = '240' THEN DD.COL15 WHEN RR.NR_ROW = '250' THEN DD.COL16 WHEN RR.NR_ROW = '260' THEN DD.COL17 WHEN RR.NR_ROW = '270' THEN DD.COL18 WHEN RR.NR_ROW = '280' THEN DD.COL19 WHEN RR.NR_ROW = '290' THEN DD.COL20 WHEN RR.NR_ROW = '300' THEN DD.COL21 WHEN RR.NR_ROW = '310' THEN DD.COL22 WHEN RR.NR_ROW = '320' THEN DD.COL23 WHEN RR.NR_ROW = '330' THEN DD.COL24 WHEN RR.NR_ROW = '340' THEN DD.COL25 WHEN RR.NR_ROW = '350' THEN DD.COL26 WHEN RR.NR_ROW = '360' THEN DD.COL27 WHEN RR.NR_ROW = '370' THEN DD.COL28 WHEN RR.NR_ROW = '380' THEN DD.COL29 WHEN RR.NR_ROW = '390' THEN DD.COL30 WHEN RR.NR_ROW = '400' THEN DD.COL31 WHEN RR.NR_ROW = '410' THEN DD.COL32 WHEN RR.NR_ROW = '420' THEN DD.COL33 WHEN RR.NR_ROW = '430' THEN DD.COL34 WHEN RR.NR_ROW = '440' THEN DD.COL35 WHEN RR.NR_ROW = '450' THEN DD.COL36 WHEN RR.NR_ROW = '460' THEN DD.COL37 WHEN RR.NR_ROW = '470' THEN DD.COL38 WHEN RR.NR_ROW = '480' THEN DD.COL39 WHEN RR.NR_ROW = '490' THEN DD.COL40 WHEN RR.NR_ROW = '500' THEN DD.COL41 WHEN RR.NR_ROW = '510' THEN DD.COL42 WHEN RR.NR_ROW = '520' THEN DD.COL43 WHEN RR.NR_ROW = '530' THEN DD.COL44 WHEN RR.NR_ROW = '540' THEN DD.COL45 WHEN RR.NR_ROW = '550' THEN DD.COL46 WHEN RR.NR_ROW = '560' THEN DD.COL47 WHEN RR.NR_ROW = '570' THEN DD.COL48 WHEN RR.NR_ROW = '580' THEN DD.COL49 WHEN RR.NR_ROW = '590' THEN DD.COL50 WHEN RR.NR_ROW = '600' THEN DD.COL51 WHEN RR.NR_ROW = '610' THEN DD.COL52 WHEN RR.NR_ROW = '620' THEN DD.COL53 WHEN RR.NR_ROW = '630' THEN DD.COL54 WHEN RR.NR_ROW = '640' THEN DD.COL55 WHEN RR.NR_ROW = '650' THEN DD.COL56 WHEN RR.NR_ROW = '660' THEN DD.COL57 WHEN RR.NR_ROW = '670' THEN DD.COL58 WHEN RR.NR_ROW = '680' THEN DD.COL59 WHEN RR.NR_ROW = '690' THEN DD.COL60 WHEN RR.NR_ROW = '700' THEN DD.COL61
           ELSE 0 
       END
   ), 1) AS COL1,

   SUM(
       CASE 
           WHEN (DD.PERS BETWEEN 0 AND 9 OR DD.PERS IS NULL) THEN
               CASE 
                   WHEN RR.NR_ROW = '100' THEN DD.COL1 WHEN RR.NR_ROW = '110' THEN DD.COL2 WHEN RR.NR_ROW = '120' THEN DD.COL3 WHEN RR.NR_ROW = '130' THEN DD.COL4 WHEN RR.NR_ROW = '140' THEN DD.COL5 WHEN RR.NR_ROW = '150' THEN DD.COL6 WHEN RR.NR_ROW = '160' THEN DD.COL7 WHEN RR.NR_ROW = '170' THEN DD.COL8 WHEN RR.NR_ROW = '180' THEN DD.COL9 WHEN RR.NR_ROW = '190' THEN DD.COL10 WHEN RR.NR_ROW = '200' THEN DD.COL11 WHEN RR.NR_ROW = '210' THEN DD.COL12 WHEN RR.NR_ROW = '220' THEN DD.COL13 WHEN RR.NR_ROW = '230' THEN DD.COL14 WHEN RR.NR_ROW = '240' THEN DD.COL15 WHEN RR.NR_ROW = '250' THEN DD.COL16 WHEN RR.NR_ROW = '260' THEN DD.COL17 WHEN RR.NR_ROW = '270' THEN DD.COL18 WHEN RR.NR_ROW = '280' THEN DD.COL19 WHEN RR.NR_ROW = '290' THEN DD.COL20 WHEN RR.NR_ROW = '300' THEN DD.COL21 WHEN RR.NR_ROW = '310' THEN DD.COL22 WHEN RR.NR_ROW = '320' THEN DD.COL23 WHEN RR.NR_ROW = '330' THEN DD.COL24 WHEN RR.NR_ROW = '340' THEN DD.COL25 WHEN RR.NR_ROW = '350' THEN DD.COL26 WHEN RR.NR_ROW = '360' THEN DD.COL27 WHEN RR.NR_ROW = '370' THEN DD.COL28 WHEN RR.NR_ROW = '380' THEN DD.COL29 WHEN RR.NR_ROW = '390' THEN DD.COL30 WHEN RR.NR_ROW = '400' THEN DD.COL31 WHEN RR.NR_ROW = '410' THEN DD.COL32 WHEN RR.NR_ROW = '420' THEN DD.COL33 WHEN RR.NR_ROW = '430' THEN DD.COL34 WHEN RR.NR_ROW = '440' THEN DD.COL35 WHEN RR.NR_ROW = '450' THEN DD.COL36 WHEN RR.NR_ROW = '460' THEN DD.COL37 WHEN RR.NR_ROW = '470' THEN DD.COL38 WHEN RR.NR_ROW = '480' THEN DD.COL39 WHEN RR.NR_ROW = '490' THEN DD.COL40 WHEN RR.NR_ROW = '500' THEN DD.COL41 WHEN RR.NR_ROW = '510' THEN DD.COL42 WHEN RR.NR_ROW = '520' THEN DD.COL43 WHEN RR.NR_ROW = '530' THEN DD.COL44 WHEN RR.NR_ROW = '540' THEN DD.COL45 WHEN RR.NR_ROW = '550' THEN DD.COL46 WHEN RR.NR_ROW = '560' THEN DD.COL47 WHEN RR.NR_ROW = '570' THEN DD.COL48 WHEN RR.NR_ROW = '580' THEN DD.COL49 WHEN RR.NR_ROW = '590' THEN DD.COL50 WHEN RR.NR_ROW = '600' THEN DD.COL51 WHEN RR.NR_ROW = '610' THEN DD.COL52 WHEN RR.NR_ROW = '620' THEN DD.COL53 WHEN RR.NR_ROW = '630' THEN DD.COL54 WHEN RR.NR_ROW = '640' THEN DD.COL55 WHEN RR.NR_ROW = '650' THEN DD.COL56 WHEN RR.NR_ROW = '660' THEN DD.COL57 WHEN RR.NR_ROW = '670' THEN DD.COL58 WHEN RR.NR_ROW = '680' THEN DD.COL59 WHEN RR.NR_ROW = '690' THEN DD.COL60 WHEN RR.NR_ROW = '700' THEN DD.COL61
                   ELSE 0 
               END
           ELSE 0 
       END
   ) AS COL2

FROM 
(
    SELECT 
        DISTINCT D.CUIIO, 
        CASE WHEN MAX(CASE WHEN D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END) IS NULL 
            THEN MAX(SUBSTR(D.CAEM2,2,4)) 
            ELSE MAX(CASE WHEN D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END) 
        END AS CAEM2_ACTUALIZAT,
        MAX(SUBSTR(D.CAEM2,2,4)) AS CAEM2,
        D.CUIIO_VERS, 
        D.CUATM, D.FORM, D.FORM_VERS, D.CUATM_FULL, D.PERIOADA,
        CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('100') THEN CIS2.NVAL(D.COL1) END)) AS COL1, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('110') THEN CIS2.NVAL(D.COL1) END)) AS COL2, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('120') THEN CIS2.NVAL(D.COL1) END)) AS COL3, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('130') THEN CIS2.NVAL(D.COL1) END)) AS COL4, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('140') THEN CIS2.NVAL(D.COL1) END)) AS COL5, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150') THEN CIS2.NVAL(D.COL1) END)) AS COL6, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('160') THEN CIS2.NVAL(D.COL1) END)) AS COL7, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('170') THEN CIS2.NVAL(D.COL1) END)) AS COL8, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('180') THEN CIS2.NVAL(D.COL1) END)) AS COL9, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('190') THEN CIS2.NVAL(D.COL1) END)) AS COL10, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('200') THEN CIS2.NVAL(D.COL1) END)) AS COL11, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('210') THEN CIS2.NVAL(D.COL1) END)) AS COL12, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('220') THEN CIS2.NVAL(D.COL1) END)) AS COL13, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('230') THEN CIS2.NVAL(D.COL1) END)) AS COL14, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('240') THEN CIS2.NVAL(D.COL1) END)) AS COL15, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('250') THEN CIS2.NVAL(D.COL1) END)) AS COL16, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('260') THEN CIS2.NVAL(D.COL1) END)) AS COL17, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('270') THEN CIS2.NVAL(D.COL1) END)) AS COL18, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('280') THEN CIS2.NVAL(D.COL1) END)) AS COL19, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('290') THEN CIS2.NVAL(D.COL1) END)) AS COL20, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('300') THEN CIS2.NVAL(D.COL1) END)) AS COL21, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('310') THEN CIS2.NVAL(D.COL1) END)) AS COL22, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('320') THEN CIS2.NVAL(D.COL1) END)) AS COL23, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('330') THEN CIS2.NVAL(D.COL1) END)) AS COL24, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('340') THEN CIS2.NVAL(D.COL1) END)) AS COL25, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('350') THEN CIS2.NVAL(D.COL1) END)) AS COL26, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('360') THEN CIS2.NVAL(D.COL1) END)) AS COL27, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('370') THEN CIS2.NVAL(D.COL1) END)) AS COL28, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('380') THEN CIS2.NVAL(D.COL1) END)) AS COL29, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('390') THEN CIS2.NVAL(D.COL1) END)) AS COL30, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('400') THEN CIS2.NVAL(D.COL1) END)) AS COL31, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('410') THEN CIS2.NVAL(D.COL1) END)) AS COL32, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('420') THEN CIS2.NVAL(D.COL1) END)) AS COL33, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('430') THEN CIS2.NVAL(D.COL1) END)) AS COL34, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('440') THEN CIS2.NVAL(D.COL1) END)) AS COL35, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('450') THEN CIS2.NVAL(D.COL1) END)) AS COL36, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('460') THEN CIS2.NVAL(D.COL1) END)) AS COL37, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('470') THEN CIS2.NVAL(D.COL1) END)) AS COL38, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('480') THEN CIS2.NVAL(D.COL1) END)) AS COL39, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('490') THEN CIS2.NVAL(D.COL1) END)) AS COL40, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('500') THEN CIS2.NVAL(D.COL1) END)) AS COL41, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('510') THEN CIS2.NVAL(D.COL1) END)) AS COL42, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('520') THEN CIS2.NVAL(D.COL1) END)) AS COL43, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('530') THEN CIS2.NVAL(D.COL1) END)) AS COL44, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('540') THEN CIS2.NVAL(D.COL1) END)) AS COL45, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('550') THEN CIS2.NVAL(D.COL1) END)) AS COL46, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('560') THEN CIS2.NVAL(D.COL1) END)) AS COL47, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('570') THEN CIS2.NVAL(D.COL1) END)) AS COL48, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('580') THEN CIS2.NVAL(D.COL1) END)) AS COL49, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('590') THEN CIS2.NVAL(D.COL1) END)) AS COL50, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('600') THEN CIS2.NVAL(D.COL1) END)) AS COL51, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('610') THEN CIS2.NVAL(D.COL1) END)) AS COL52, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('620') THEN CIS2.NVAL(D.COL1) END)) AS COL53, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('630') THEN CIS2.NVAL(D.COL1) END)) AS COL54, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('640') THEN CIS2.NVAL(D.COL1) END)) AS COL55, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('650') THEN CIS2.NVAL(D.COL1) END)) AS COL56, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('660') THEN CIS2.NVAL(D.COL1) END)) AS COL57, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('670') THEN CIS2.NVAL(D.COL1) END)) AS COL58, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('680') THEN CIS2.NVAL(D.COL1) END)) AS COL59, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('690') THEN CIS2.NVAL(D.COL1) END)) AS COL60, CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('700') THEN CIS2.NVAL(D.COL1) END)) AS COL61
    FROM CIS2.VW_DATA_ALL_COEF D       
    WHERE
        D.FORM IN (64) AND 
        D.FORM_VERS = :PFORM_VERS AND      
        D.PERIOADA = :pPERIOADA AND
        D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
        D.CAPITOL IN (100,1123,1124,1125,1126,1127,1128,1129) 
        AND D.CUIIO IN (26844)
    GROUP BY D.CUIIO, D.CUIIO_VERS, D.CUATM, D.FORM, D.FORM_VERS, D.CUATM_FULL, D.PERIOADA
) DD

CROSS JOIN
(
    SELECT '100' AS NR_ROW, 'COL1' AS COL FROM DUAL UNION ALL SELECT '110' AS NR_ROW, 'COL2' AS COL FROM DUAL UNION ALL SELECT '120' AS NR_ROW, 'COL3' AS COL FROM DUAL UNION ALL SELECT '130' AS NR_ROW, 'COL4' AS COL FROM DUAL UNION ALL SELECT '140' AS NR_ROW, 'COL5' AS COL FROM DUAL UNION ALL SELECT '150' AS NR_ROW, 'COL6' AS COL FROM DUAL UNION ALL SELECT '160' AS NR_ROW, 'COL7' AS COL FROM DUAL UNION ALL SELECT '170' AS NR_ROW, 'COL8' AS COL FROM DUAL UNION ALL SELECT '180' AS NR_ROW, 'COL9' AS COL FROM DUAL UNION ALL SELECT '190' AS NR_ROW, 'COL10' AS COL FROM DUAL UNION ALL SELECT '200' AS NR_ROW, 'COL11' AS COL FROM DUAL UNION ALL SELECT '210' AS NR_ROW, 'COL12' AS COL FROM DUAL UNION ALL SELECT '220' AS NR_ROW, 'COL13' AS COL FROM DUAL UNION ALL SELECT '230' AS NR_ROW, 'COL14' AS COL FROM DUAL UNION ALL SELECT '240' AS NR_ROW, 'COL15' AS COL FROM DUAL UNION ALL SELECT '250' AS NR_ROW, 'COL16' AS COL FROM DUAL UNION ALL SELECT '260' AS NR_ROW, 'COL17' AS COL FROM DUAL UNION ALL SELECT '270' AS NR_ROW, 'COL18' AS COL FROM DUAL UNION ALL SELECT '280' AS NR_ROW, 'COL19' AS COL FROM DUAL UNION ALL SELECT '290' AS NR_ROW, 'COL20' AS COL FROM DUAL UNION ALL SELECT '300' AS NR_ROW, 'COL21' AS COL FROM DUAL UNION ALL SELECT '310' AS NR_ROW, 'COL22' AS COL FROM DUAL UNION ALL SELECT '320' AS NR_ROW, 'COL23' AS COL FROM DUAL UNION ALL SELECT '330' AS NR_ROW, 'COL24' AS COL FROM DUAL UNION ALL SELECT '340' AS NR_ROW, 'COL25' AS COL FROM DUAL UNION ALL SELECT '350' AS NR_ROW, 'COL26' AS COL FROM DUAL UNION ALL SELECT '360' AS NR_ROW, 'COL27' AS COL FROM DUAL UNION ALL SELECT '370' AS NR_ROW, 'COL28' AS COL FROM DUAL UNION ALL SELECT '380' AS NR_ROW, 'COL29' AS COL FROM DUAL UNION ALL SELECT '390' AS NR_ROW, 'COL30' AS COL FROM DUAL UNION ALL SELECT '400' AS NR_ROW, 'COL31' AS COL FROM DUAL UNION ALL SELECT '410' AS NR_ROW, 'COL32' AS COL FROM DUAL UNION ALL SELECT '420' AS NR_ROW, 'COL33' AS COL FROM DUAL UNION ALL SELECT '430' AS NR_ROW, 'COL34' AS COL FROM DUAL UNION ALL SELECT '440' AS NR_ROW, 'COL35' AS COL FROM DUAL UNION ALL SELECT '450' AS NR_ROW, 'COL36' AS COL FROM DUAL UNION ALL SELECT '460' AS NR_ROW, 'COL37' AS COL FROM DUAL UNION ALL SELECT '470' AS NR_ROW, 'COL38' AS COL FROM DUAL UNION ALL SELECT '480' AS NR_ROW, 'COL39' AS COL FROM DUAL UNION ALL SELECT '490' AS NR_ROW, 'COL40' AS COL FROM DUAL UNION ALL SELECT '500' AS NR_ROW, 'COL41' AS COL FROM DUAL UNION ALL SELECT '510' AS NR_ROW, 'COL42' AS COL FROM DUAL UNION ALL SELECT '520' AS NR_ROW, 'COL43' AS COL FROM DUAL UNION ALL SELECT '530' AS NR_ROW, 'COL44' AS COL FROM DUAL UNION ALL SELECT '540' AS NR_ROW, 'COL45' AS COL FROM DUAL UNION ALL SELECT '550' AS NR_ROW, 'COL46' AS COL FROM DUAL UNION ALL SELECT '560' AS NR_ROW, 'COL47' AS COL FROM DUAL UNION ALL SELECT '570' AS NR_ROW, 'COL48' AS COL FROM DUAL UNION ALL SELECT '580' AS NR_ROW, 'COL49' AS COL FROM DUAL UNION ALL SELECT '590' AS NR_ROW, 'COL50' AS COL FROM DUAL UNION ALL SELECT '600' AS NR_ROW, 'COL51' AS COL FROM DUAL UNION ALL SELECT '610' AS NR_ROW, 'COL52' AS COL FROM DUAL UNION ALL SELECT '620' AS NR_ROW, 'COL53' AS COL FROM DUAL UNION ALL SELECT '630' AS NR_ROW, 'COL54' AS COL FROM DUAL UNION ALL SELECT '640' AS NR_ROW, 'COL55' AS COL FROM DUAL UNION ALL SELECT '650' AS NR_ROW, 'COL56' AS COL FROM DUAL UNION ALL SELECT '660' AS NR_ROW, 'COL57' AS COL FROM DUAL UNION ALL SELECT '670' AS NR_ROW, 'COL58' AS COL FROM DUAL UNION ALL SELECT '680' AS NR_ROW, 'COL59' AS COL FROM DUAL UNION ALL SELECT '690' AS NR_ROW, 'COL60' AS COL FROM DUAL UNION ALL SELECT '700' AS NR_ROW, 'COL61' AS COL FROM DUAL
) RR

WHERE 
    (DD.FORM = :pFORM) AND
    (DD.FORM_VERS = :pFORM_VERS) AND
    (:pID_MDTABLE = :pID_MDTABLE) AND
    (DD.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
    DD.PERIOADA IN (:pPERIOADA) AND
    DD.CUIIO = 26844

GROUP BY
    RR.NR_ROW
ORDER BY 
    RR.NR_ROW;