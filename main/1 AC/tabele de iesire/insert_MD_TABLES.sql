SELECT 
                 
  ID_MDTABLE,
  TABELE,
  TABELE_VERS,
  FORM,
  FORM_VERS,
  DENUMIRE,
  DEN_SHORT,
  NIVELRAIONAL,
  ORDINE,
  DATA_REG,
  STATUT,
  HTML_HEADER,
  SQL_TEXT,
  SQL_TEXT1,
  LANDSCAPE,
  COL_NUM,
  FOOTNOTE,
  UM,
  CREATING  
                    FROM CIS2.MD_TABLES
                    
                    
                    WHERE
                    FORM = 15
                    
                    ORDER BY
                    ORDINE