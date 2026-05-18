


        SELECT L.CUIIO
        FROM VW_AGRO_3_K L LEFT JOIN F_XML_FORMS_VW_AGRO_3_K R ON R.CUIIO = L.CUIIO 
        
            WHERE 
            R.CUIIO IS NULL;