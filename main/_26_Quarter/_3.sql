﻿UPDATE  CIS2.MD_TABLES 

SET DENUMIRE = REPLACE(DENUMIRE,'TRIMSTRING','TRIMNUM')



WHERE 
 FORM = 26
 
 AND STATUT = '1'

 AND TABELE_VERS IN (1053)
  