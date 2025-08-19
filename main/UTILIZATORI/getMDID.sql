SELECT 
  '''' ||RIND||'''' || ' : ' ||''''||ID_MD || ''''||' ,'  AS ID_MD
   
FROM CIS2.MD_RIND

WHERE
STATUT = '1'

AND 
capitol=10004 AND capitol_vers=299

 AND DINAMIC IS NOT NULL
 
 ORDER BY 
 
 ORDINE