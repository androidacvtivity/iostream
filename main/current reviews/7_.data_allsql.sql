
  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         COUNT (DISTINCT CASE WHEN D.FORM = 7 THEN D.CUIIO END)     AS COL14,
         NULL                                                       AS COL15
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS.VW_DATA_ALL D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 INNER JOIN
                 (SELECT P.PERIOADA, P.TIP_PERIOADA, P.ANUL
                    FROM (SELECT CASE
                                     WHEN P.NUM = 8 THEN P.PERIOADA - 11
                                     WHEN P.NUM = 7 THEN P.PERIOADA - 10
                                     WHEN P.NUM = 6 THEN P.PERIOADA - 9
                                     WHEN P.NUM = 5 THEN P.PERIOADA - 8
                                     WHEN P.NUM = 4 THEN P.PERIOADA - 7
                                     WHEN P.NUM = 3 THEN P.PERIOADA - 6
                                     WHEN P.NUM = 2 THEN P.PERIOADA - 5
                                     WHEN P.NUM = 1 THEN P.PERIOADA - 4
                                     ELSE P.PERIOADA
                                 END
                                     PERIOADA,
                                 P.NUM,
                                 P.TIP_PERIOADA,
                                 P.ANUL
                            FROM CIS.MD_PERIOADA P
                                 INNER JOIN
                                 (SELECT P.PERIOADA,
                                         P.TIP_PERIOADA,
                                         P.ANUL,
                                         (CASE
                                              WHEN P.NUM = 10 THEN 9
                                              WHEN P.NUM = 11 THEN 9
                                              WHEN P.NUM = 12 THEN 9
                                              ELSE P.NUM
                                          END)
                                             NUM
                                    FROM CIS.MD_PERIOADA P
                                   WHERE P.PERIOADA = :pPERIOADA) PP
                                     ON     P.NUM = PP.NUM
                                        AND P.TIP_PERIOADA = PP.TIP_PERIOADA
                                        AND P.ANUL = PP.ANUL) P) MP
                     ON MP.PERIOADA = D.PERIOADA
           WHERE D.PERIOADA = MP.PERIOADA AND D.FORM IN (7)) D
         INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE