create table MD_TABLES_48
as 
            SELECT *
            
                FROM CIS2.MD_TABLES
                
                    WHERE
                    FORM IN  (48)
AND TABELE_VERS  = 2013
--AND STATUT = '1'

--AND ID_MDTABLE <>  14498