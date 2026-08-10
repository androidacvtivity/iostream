SELECT
                   DISTINCT 
                   FC.UNIT_CODE
                   


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
                                  WHERE FORM IN (:pFORM) AND UNIT_CODE_VERS <=  :pPERIOADA
                               GROUP BY UNIT_CODE


                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)

                         INNER JOIN  CIS2.REG_UNIT_GC RR
                               ON RR.UNIT_CODE = BB.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = BB.UNIT_CODE_VERS

             WHERE
             FC.FORM IN (62) AND FC.STATUT <> '3' ) FC