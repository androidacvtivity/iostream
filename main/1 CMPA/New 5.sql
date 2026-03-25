--
----SELECT *
----
----    FROM USER_BANCU.VW_DATA_ALL_GC_CALC;
--
--
--CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_DATA_ALL_GC_CALC
--(
--    PERIOADA,
--    ANUL,
--    NUM,
--    UNIT_CODE,
--    UNIT_CODE_VERS,
--    NR_GOSP,
--    NR_MAPS,
--    CUATM,
--    CUATM_FULL,
--    ADDRESS_1,
--    ADDRESS_2,
--    ADDRESS_3,
--    ADDRESS_4,
--    ENVIRONMENT,
--    PACHET,
--    FORM,
--    FORM_VERS,
--    FORM_DEN,
--    CAPITOL,
--    CAPITOL_VERS,
--    CAPITOL_DEN,
--    TAB,
--    ID_MD,
--    RIND,
--    RIND_VERS,
--    ID_USER,
--    USER_NAME,
--    DATA_REG,
--    COL1,
--    COL2,
--    COL3,
--    COL4,
--    COL5,
--    COL6,
--    COL7,
--    COL8,
--    COL9,
--    COL10,
--    COL11,
--    COL12,
--    COL13,
--    COL14,
--    COL15,
--    COL16,
--    COL17,
--    COL18,
--    COL19,
--    COL20,
--    COL21,
--    COL22,
--    COL23,
--    COL24,
--    COL25,
--    COL26,
--    COL27,
--    COL28,
--    COL29,
--    COL30,
--    CA
--)
--AS
    SELECT D.PERIOADA,
           MP.ANUL,
           MP.NUM,
           D.UNIT_CODE,
           D.UNIT_CODE_VERS,
           D.NR_GOSP,
           D.NR_MAPS,
           RN.CUATM,
           CT.FULL_CODE     AS CUATM_FULL,
           RN.ADDRESS_1,
           RN.ADDRESS_2,
           RN.ADDRESS_3,
           RN.ADDRESS_4,
           RN.ENVIRONMENT,
           D.PACHET,
           MR.FORM,
           MR.FORM_VERS,
           MF.DEN_SHORT     AS FORM_DEN,
           MC.CAPITOL,
           MC.CAPITOL_VERS,
           MC.DEN_SHORT     AS CAPITOL_DEN,
           MC.TAB,
           D.ID_MD,
           MR.RIND,
           MR.RIND_VERS,
           D.ID_USER,
           US.USER_NAME,
           D.DATA_REG,
           D.COL1,
           D.COL2,
           D.COL3,
           D.COL4,
           D.COL5,
           D.COL6,
           D.COL7,
           D.COL8,
           D.COL9,
           D.COL10,
           D.COL11,
           D.COL12,
           D.COL13,
           D.COL14,
           D.COL15,
           D.COL16,
           D.COL17,
           D.COL18,
           D.COL19,
           D.COL20,
           D.COL21,
           D.COL22,
           D.COL23,
           D.COL24,
           D.COL25,
           D.COL26,
           D.COL27,
           D.COL28,
           D.COL29,
           D.COL30,
           C.CA
      FROM DATA_ALL_GC  D
           LEFT JOIN REG_UNIT_GC RN
               ON     D.UNIT_CODE = RN.UNIT_CODE
                  AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                  AND D.NR_GOSP = RN.NR_GOSP
                  AND D.NR_MAPS = RN.NR_MAPS
           LEFT JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
           LEFT JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
           LEFT JOIN MD_FORM MF
               ON MR.FORM = MF.FORM AND MR.FORM_VERS = MF.FORM_VERS
           LEFT JOIN MD_CAPITOL MC
               ON     MR.CAPITOL = MC.CAPITOL
                  AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
           LEFT JOIN MD_PERIOADA MP ON D.PERIOADA = MP.PERIOADA
           LEFT JOIN SYS_USER US ON D.ID_USER = US.ID_USER
           -- important indicators --
           LEFT JOIN
           (  SELECT D.PERIOADA,
                     D.UNIT_CODE,
                     D.UNIT_CODE_VERS,
                     D.NR_GOSP,
                     D.NR_MAPS,
                     D.FORM,
                     D.FORM_VERS,
                     SUM (
                         CASE
                             WHEN (    MC.CAPITOL IN (419, 1118, 1114,1111)
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
               WHERE (MC.CAPITOL IN (419, 1118, 1114,1111) AND MR.RIND = 'CA')
            GROUP BY D.PERIOADA,
                     D.UNIT_CODE,
                     D.UNIT_CODE_VERS,
                     D.NR_GOSP,
                     D.NR_MAPS,
                     D.FORM,
                     D.FORM_VERS) C
               ON (    D.PERIOADA = C.PERIOADA
                   AND D.UNIT_CODE = C.UNIT_CODE
                   AND D.UNIT_CODE_VERS = C.UNIT_CODE_VERS
                   AND D.FORM = C.FORM
                   AND D.FORM_VERS = C.FORM_VERS)
                   
                   
                   WHERE 
                   D.FORM IN (61)
  AND D.UNIT_CODE IN 831347
    AND D.PERIOADA = 1065
--------------------------
;

