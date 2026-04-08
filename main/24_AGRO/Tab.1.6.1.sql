DECLARE

  CURSOR C IS
    SELECT :pCOD_CUATM AS pCOD_CUATM
    FROM DUAL;

BEGIN
  FOR CR IN C LOOP

    IF CR.pCOD_CUATM = '0000000' THEN

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
        COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14
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

        TRIM(TO_CHAR(ROUND(PASARI_TOTAL_2025,0), '99999999999999999999999990'))
        || '~' || NR_ROW
        || '~' || RAWTOHEX(SYS_GUID()) AS NR_ROW,

        ORDINE,
        '11111111111111' AS DECIMAL_POS,
        NUME_ROW,

        ROUND(PASARI_TOTAL_2026,0) AS COL1,
        ROUND((CIS2.NVAL(PASARI_TOTAL_2026) / CIS2.NOZERO(PASARI_TOTAL_2025)) * 100, 1) AS COL2,

        NULL AS COL3,
        ROUND(GAINI_COCOSI_TOTAL_2026,0) AS COL4,
        NULL AS COL5,

        NULL AS COL6,
        ROUND(PENTRU_SACRIFICARE_2026,0) AS COL7,
        NULL AS COL8,

        NULL AS COL9,
        ROUND(GAINI_OUATOARE_ADULTE_2026,0) AS COL10,
        NULL AS COL11,

        NULL AS COL12,
        ROUND(GAINI_OU_CONSUM_2026,0) AS COL13,
        NULL AS COL14

      FROM
      (
        SELECT
          R.NR_ROW,
          R.NUME_ROW,
          TO_NUMBER(R.NR_ROW) AS ORDINE,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA - 4)
               AND D.PERIOADA < 1068
               AND D.RIND IN ('10')
               AND CC.FULL_CODE LIKE '%' || R.CS_CUATM || '%'
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PASARI_TOTAL_2025,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2170')
               AND CC.FULL_CODE LIKE '%' || R.CS_CUATM || '%'
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PASARI_TOTAL_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2171','2172')
               AND CC.FULL_CODE LIKE '%' || R.CS_CUATM || '%'
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_COCOSI_TOTAL_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2171')
               AND CC.FULL_CODE LIKE '%' || R.CS_CUATM || '%'
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PENTRU_SACRIFICARE_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2172')
               AND CC.FULL_CODE LIKE '%' || R.CS_CUATM || '%'
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_OUATOARE_ADULTE_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2173')
               AND CC.FULL_CODE LIKE '%' || R.CS_CUATM || '%'
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_OU_CONSUM_2026

        FROM CIS2.VW_DATA_ALL D
        INNER JOIN CIS2.VW_CL_CUATM CC
          ON (D.CUATM = CC.CODUL)
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
              '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39',
              '9601000','40','9602000','41','9603000','42'
            ) AS NR_ROW,
            CS.DENUMIRE AS NUME_ROW,
            CS.CODUL AS CS_CUATM
          FROM CIS2.VW_CL_CUATM CS
          WHERE CS.CODUL IN
          (
            '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
            '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
            '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
            '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000','9601000',
            '9602000','9603000'
          )
        ) R
        WHERE
          D.PERIOADA IN (:pPERIOADA, :pPERIOADA - 4)
          AND D.FORM_VERS = :pFORM_VERS
          AND (:pID_MDTABLE = :pID_MDTABLE)
          AND D.CUATM_FULL LIKE '%' || :pCOD_CUATM || ';%'
          AND D.FORM IN (33)
          AND D.CAPITOL IN (381)
        GROUP BY
          R.NR_ROW,
          R.NUME_ROW
      );

    ELSE

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
        COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14
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

        TRIM(TO_CHAR(ROUND(PASARI_TOTAL_2025,0), '99999999999999999999999990'))
        || '~' || NR_ROW AS NR_ROW,

        ORDINE,
        '11111111111111' AS DECIMAL_POS,
        NUME_ROW || ' - ' || NR_ROW AS NUME_ROW,

        ROUND(PASARI_TOTAL_2026,0) AS COL1,
        ROUND((CIS2.NVAL(PASARI_TOTAL_2026) / CIS2.NOZERO(PASARI_TOTAL_2025)) * 100, 1) AS COL2,

        NULL AS COL3,
        ROUND(GAINI_COCOSI_TOTAL_2026,0) AS COL4,
        NULL AS COL5,

        NULL AS COL6,
        ROUND(PENTRU_SACRIFICARE_2026,0) AS COL7,
        NULL AS COL8,

        NULL AS COL9,
        ROUND(GAINI_OUATOARE_ADULTE_2026,0) AS COL10,
        NULL AS COL11,

        NULL AS COL12,
        ROUND(GAINI_OU_CONSUM_2026,0) AS COL13,
        NULL AS COL14

      FROM
      (
        SELECT
          RE.CUIIO AS NR_ROW,
          MAX(RE.DENUMIRE) AS NUME_ROW,
          TO_NUMBER(RE.CUIIO) AS ORDINE,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA - 4)
               AND D.PERIOADA < 1068
               AND D.RIND IN ('10')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PASARI_TOTAL_2025,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2170')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PASARI_TOTAL_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2171','2172')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_COCOSI_TOTAL_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2171')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PENTRU_SACRIFICARE_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2172')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_OUATOARE_ADULTE_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2173')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_OU_CONSUM_2026

        FROM CIS2.VW_DATA_ALL D
        INNER JOIN CIS2.RENIM RE
          ON (D.CUIIO = RE.CUIIO AND D.CUIIO_VERS = RE.CUIIO_VERS)
        WHERE
          D.PERIOADA IN (:pPERIOADA, :pPERIOADA - 4)
          AND D.FORM_VERS = :pFORM_VERS
          AND (:pID_MDTABLE = :pID_MDTABLE)
          AND D.CUATM_FULL LIKE '%' || :pCOD_CUATM || ';%'
          AND D.FORM IN (33)
          AND D.CAPITOL IN (381)
          AND D.CFOJ IS NOT NULL
        GROUP BY RE.CUIIO

        UNION ALL

        SELECT
          0 AS NR_ROW,
          'TOTAL' AS NUME_ROW,
          0 AS ORDINE,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA - 4)
               AND D.PERIOADA < 1068
               AND D.RIND IN ('10')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PASARI_TOTAL_2025,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2170')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PASARI_TOTAL_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2171','2172')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_COCOSI_TOTAL_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2171')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS PENTRU_SACRIFICARE_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2172')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_OUATOARE_ADULTE_2026,

          CIS2.NVAL(SUM(
            CASE
              WHEN D.PERIOADA IN (:pPERIOADA)
               AND D.PERIOADA >= 1068
               AND D.RIND IN ('2173')
               AND D.CAPITOL IN (381)
              THEN CIS2.NVAL(D.COL1)
            END
          )) AS GAINI_OU_CONSUM_2026

        FROM CIS2.VW_DATA_ALL D
        INNER JOIN CIS2.RENIM RE
          ON (D.CUIIO = RE.CUIIO AND D.CUIIO_VERS = RE.CUIIO_VERS)
        WHERE
          D.PERIOADA IN (:pPERIOADA, :pPERIOADA - 4)
          AND D.FORM_VERS = :pFORM_VERS
          AND (:pID_MDTABLE = :pID_MDTABLE)
          AND D.CUATM_FULL LIKE '%' || :pCOD_CUATM || ';%'
          AND D.FORM IN (33)
          AND D.CAPITOL IN (381)
          AND D.CFOJ IS NOT NULL
      );

    END IF;

  END LOOP;
END;
