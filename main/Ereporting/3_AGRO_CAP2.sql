SELECT f.*
FROM USER_EREPORTING.F_XML_FORMS f
WHERE f.DATA_REG >= TO_DATE('05/01/2026 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
  AND f.FORM_TYPE IN ('3-agr')
  AND DBMS_LOB.INSTR(f.XML, 'CAP2_R') > 0
  AND (
        REGEXP_LIKE(
            f.XML,
            '<CAP2_R2000[^>]*>.*<CAP2_R2000_C0>[[:space:]]*2000-1[[:space:]]*</CAP2_R2000_C0>.*<CAP2_R2000_C(1|2|33|4|5|6|7|8)>[[:space:]]*[^[:space:]<][^<]*</CAP2_R2000_C(1|2|33|4|5|6|7|8)>.*</CAP2_R2000>',
            'n'
        )
     OR REGEXP_LIKE(
            f.XML,
            '<CAP2_R2100[^>]*>.*<CAP2_R2100_C0>[[:space:]]*2100-1[[:space:]]*</CAP2_R2100_C0>.*<CAP2_R2100_C(1|2|33|4|5|6|7|8)>[[:space:]]*[^[:space:]<][^<]*</CAP2_R2100_C(1|2|33|4|5|6|7|8)>.*</CAP2_R2100>',
            'n'
        )
     OR REGEXP_LIKE(
            f.XML,
            '<CAP2_R2200[^>]*>.*<CAP2_R2200_C0>[[:space:]]*2200-1[[:space:]]*</CAP2_R2200_C0>.*<CAP2_R2200_C(1|2|33|4|5|6|7|8)>[[:space:]]*[^[:space:]<][^<]*</CAP2_R2200_C(1|2|33|4|5|6|7|8)>.*</CAP2_R2200>',
            'n'
        )
  )
  
  ORDER BY 
  f.DATA_REG DESC 