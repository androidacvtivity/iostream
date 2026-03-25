SELECT D.PERIOADA,
                     D.UNIT_CODE,
                     D.UNIT_CODE_VERS,
                     D.NR_GOSP,
                     D.NR_MAPS,
                     D.FORM,
                     D.FORM_VERS,
                     SUM (
                         CASE
                             WHEN (    MC.CAPITOL IN (419, 1118, 1114)
                                   AND MR.RIND = 'CA')
                             THEN
                                 D.COL1
                             ELSE
                                 NULL
                         END)
                         AS CA
                FROM DATA_ALL_GC D
                     LEFT JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                     LEFT JOIN MD_CAPITOL MC
                         ON     MR.CAPITOL = MC.CAPITOL
                            AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
               WHERE (MC.CAPITOL IN (419, 1118, 1114) AND MR.RIND = 'CA')
               
               AND  D.FORM IN (61)
  AND D.UNIT_CODE IN 831347
    AND D.PERIOADA = 1065
            GROUP BY D.PERIOADA,
                     D.UNIT_CODE,
                     D.UNIT_CODE_VERS,
                     D.NR_GOSP,
                     D.NR_MAPS,
                     D.FORM,
                     D.FORM_VERS