 SELECT 
        
            D.CUIIO,
            R.CAEM2 AS RSF_PRESC_CAEM2,
            SUM(CASE WHEN D.ID_MD = 46432 THEN D.COL1 ELSE NULL END)  NMP, -- 62206
            SUM(CASE WHEN D.ID_MD = 61852 THEN D.COL1 ELSE NULL END)  RSF1_PRESC_R_060_C4,
            SUM(CASE WHEN D.ID_MD = 61852 THEN D.COL2 ELSE NULL END)  RSF1_PRESC_R_060_C5,
            SUM(CASE WHEN D.ID_MD = 61891 THEN D.COL1 ELSE NULL END)  RSF1_PRESC_R_010_C3,
            SUM(CASE WHEN D.ID_MD = 61891 THEN D.COL2 ELSE NULL END)  RSF1_PRESC_R_010_C4,
            SUM(CASE WHEN D.ID_MD = 61892 THEN D.COL1 ELSE NULL END)  RSF1_PRESC_R_040_C3,
            SUM(CASE WHEN D.ID_MD = 61892 THEN D.COL2 ELSE NULL END)  RSF1_PRESC_R_040_C4
            
            
            FROM CIS2.DATA_ALL_FR D INNER JOIN 
                                  CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                                  AND R.CUIIO_VERS = D.CUIIO_VERS  
            
              WHERE 
              D.PERIOADA = 2014 
              AND D.FORM = 63
              AND D.FORM_VERS = 2000
           --   AND D.CUIIO = 5718
              GROUP BY 
              D.CUIIO,
              R.CAEM2