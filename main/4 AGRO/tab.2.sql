SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  CFOJ_ORDINE AS NR_SECTIE,
  CFOJ_DENUMIRE||' ('||CFOJ||')' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  RIND||'~'||ORDINE AS NR_ROW,
  ORDINE,
  CASE WHEN RIND BETWEEN '062' AND '082' THEN '1' ELSE '0' END AS DECIMAL_POS,
  DENUMIRE AS NUME_ROW,
  ROUND(COL1,1) AS COL1
FROM
(
SELECT
  A.CFOJ,
  A.CFOJ_DENUMIRE,
  A.CFOJ_ORDINE,
  A.RIND,
  A.ORDINE,
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.DENUMIRE,'<br>'),'nbsp'),'&;'),'<b>'),'</b>') AS DENUMIRE,
  B.COL1
FROM
(
SELECT
  TR.CFOJ,
  TR.CFOJ_DENUMIRE,
  TR.ORDINE AS CFOJ_ORDINE,
  R.ID_MD,
  R.RIND,
  R.DENUMIRE,
  R.ORDINE
FROM
  MD_RIND R
  CROSS JOIN 
  (
  
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685+686+965' AS CFOJ,'Total categoriile de gospodarii' AS CFOJ_DENUMIRE, 1 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899' AS CFOJ, 'Intreprinderi agricole - total' AS CFOJ_DENUMIRE, 10 AS ORDINE FROM DUAL UNION
SELECT '510+520' AS CFOJ, 'Societati pe actiuni' AS CFOJ_DENUMIRE,11 AS ORDINE FROM DUAL UNION
SELECT '510' AS CFOJ, 'Societati pe actiuni de tip inchis' AS CFOJ_DENUMIRE,12 AS ORDINE FROM DUAL UNION
SELECT '520' AS CFOJ, 'Societati pe actiuni de tip deschis' AS CFOJ_DENUMIRE,13 AS ORDINE FROM DUAL UNION
SELECT '530' AS CFOJ, 'Societati cu raspundere limitata' AS CFOJ_DENUMIRE,14 AS ORDINE FROM DUAL UNION
SELECT '540' AS CFOJ, 'Cooperative agricole de productie' AS CFOJ_DENUMIRE,14.1 AS ORDINE FROM DUAL UNION
SELECT '560' AS CFOJ, 'Alte cooperative (colhozuri-agrofirme+Intreprinderi agricole intergospodaresti)' AS CFOJ_DENUMIRE,15 AS ORDINE FROM DUAL UNION
--SELECT '550' AS CFOJ, 'Cooperative intreprinzator' AS CFOJ_DENUMIRE,16 AS ORDINE FROM DUAL UNION
SELECT '590' AS CFOJ, 'Intreprinderi agricole de stat' AS CFOJ_DENUMIRE,17 AS ORDINE FROM DUAL UNION
SELECT '684+685+686+965' AS CFOJ, 'Sectorul individual' AS CFOJ_DENUMIRE,18 AS ORDINE FROM DUAL UNION
SELECT '684+685+686' AS CFOJ, 'Gospodariile taranesti (de fermier) total' AS CFOJ_DENUMIRE,19 AS ORDINE FROM DUAL UNION
SELECT '684' AS CFOJ, 'Gospodariile taranesti (de fermier) inregistrate cu suprafata terenurilor de 50 ha si peste' AS CFOJ_DENUMIRE,2 AS ORDINE FROM DUAL UNION
SELECT '685' AS CFOJ, 'Gospodariile taranesti (de fermier) cu terenuri agricole de la 10 pina la 50 ha' AS CFOJ_DENUMIRE,20 AS ORDINE FROM DUAL UNION
SELECT '686' AS CFOJ, 'Gospodarii taranesti (de fermier) cu suprafata terenurilor pina la 10 ha' AS CFOJ_DENUMIRE,21 AS ORDINE FROM DUAL UNION
SELECT '684+685' AS CFOJ, 'Gospodariile taranesti (de fermier) inregistrate cu suprafata terenurilor de 10 ha si peste' AS CFOJ_DENUMIRE,22 AS ORDINE FROM DUAL UNION
SELECT '685+686' AS CFOJ, 'Gospodariile taranesti (de fermier) cu terenuri agricole mai putin 50 ha ' AS CFOJ_DENUMIRE,23 AS ORDINE FROM DUAL UNION
SELECT '690' AS CFOJ, 'Alte intreprinderi (Asociatii de gospodarii taranesti si altele)' AS CFOJ_DENUMIRE,24 AS ORDINE FROM DUAL UNION
SELECT '870' AS CFOJ, 'Institutii de stat' AS CFOJ_DENUMIRE,25 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685+686' AS CFOJ, 'Intreprinderi agricole si gospodarii taranesti (de fermier)' AS CFOJ_DENUMIRE,26 AS ORDINE FROM DUAL UNION
SELECT '965' AS CFOJ, 'Gospodarii auxiliare ale populatiei' AS CFOJ_DENUMIRE,27 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684' AS CFOJ, 'Intreprinderi agricole si GT (de fermier) cu terenuri agricole de 50 ha si peste' AS CFOJ_DENUMIRE,28 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685' AS CFOJ, 'Intreprinderi agricole si GT (de fermier) cu terenuri agricole de 10 ha si peste' AS CFOJ_DENUMIRE,29 AS ORDINE FROM DUAL


  ) TR
WHERE
  R.FORM IN (43) AND
  R.CAPITOL IN(397) AND
  R.ID_MD NOT IN (18351, 18352)
--ORDER BY
--  TR.ORDINE
UNION
SELECT
  TR.CFOJ,
  TR.CFOJ_DENUMIRE,
  TR.ORDINE AS CFOJ_ORDINE,
  9999 AS ID_MD,
  '260' AS RIND,
  'Numarul intreprinderilor' AS DENUMIRE,
  260 AS ORDINE
FROM
  (
  
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685+686+965+550' AS CFOJ,'Total categoriile de gospodarii' AS CFOJ_DENUMIRE, 1 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+550' AS CFOJ, 'Intreprinderi agricole - total' AS CFOJ_DENUMIRE, 10 AS ORDINE FROM DUAL UNION
SELECT '510+520' AS CFOJ, 'Societati pe actiuni' AS CFOJ_DENUMIRE,11 AS ORDINE FROM DUAL UNION
SELECT '510' AS CFOJ, 'Societati pe actiuni de tip inchis' AS CFOJ_DENUMIRE,12 AS ORDINE FROM DUAL UNION
SELECT '520' AS CFOJ, 'Societati pe actiuni de tip deschis' AS CFOJ_DENUMIRE,13 AS ORDINE FROM DUAL UNION
SELECT '530' AS CFOJ, 'Societati cu raspundere limitata' AS CFOJ_DENUMIRE,14 AS ORDINE FROM DUAL UNION
SELECT '540' AS CFOJ, 'Cooperative agricole de productie' AS CFOJ_DENUMIRE,14.1 AS ORDINE FROM DUAL UNION
SELECT '560' AS CFOJ, 'Alte cooperative (colhozuri-agrofirme+Intreprinderi agricole intergospodaresti)' AS CFOJ_DENUMIRE,15 AS ORDINE FROM DUAL UNION
--SELECT '550' AS CFOJ, 'Cooperative intreprinzator' AS CFOJ_DENUMIRE,16 AS ORDINE FROM DUAL UNION
SELECT '590' AS CFOJ, 'Intreprinderi agricole de stat' AS CFOJ_DENUMIRE,17 AS ORDINE FROM DUAL UNION
SELECT '684+685+686+965' AS CFOJ, 'Sectorul individual' AS CFOJ_DENUMIRE,18 AS ORDINE FROM DUAL UNION
SELECT '684+685+686' AS CFOJ, 'Gospodariile taranesti (de fermier) total' AS CFOJ_DENUMIRE,19 AS ORDINE FROM DUAL UNION
SELECT '684' AS CFOJ, 'Gospodariile taranesti (de fermier) inregistrate cu suprafata terenurilor de 50 ha si peste' AS CFOJ_DENUMIRE,2 AS ORDINE FROM DUAL UNION
SELECT '685' AS CFOJ, 'Gospodariile taranesti (de fermier) cu terenuri agricole de la 10 pina la 50 ha' AS CFOJ_DENUMIRE,20 AS ORDINE FROM DUAL UNION
SELECT '686' AS CFOJ, 'Gospodarii taranesti (de fermier) cu suprafata terenurilor pina la 10 ha' AS CFOJ_DENUMIRE,21 AS ORDINE FROM DUAL UNION
SELECT '684+685' AS CFOJ, 'Gospodariile taranesti (de fermier) inregistrate cu suprafata terenurilor de 10 ha si peste' AS CFOJ_DENUMIRE,22 AS ORDINE FROM DUAL UNION
SELECT '685+686' AS CFOJ, 'Gospodariile taranesti (de fermier) cu terenuri agricole mai putin 50 ha ' AS CFOJ_DENUMIRE,23 AS ORDINE FROM DUAL UNION
SELECT '690' AS CFOJ, 'Alte intreprinderi (Asociatii de gospodarii taranesti si altele)' AS CFOJ_DENUMIRE,24 AS ORDINE FROM DUAL UNION
SELECT '870' AS CFOJ, 'Institutii de stat' AS CFOJ_DENUMIRE,25 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685+686' AS CFOJ, 'Intreprinderi agricole si gospodarii taranesti (de fermier)' AS CFOJ_DENUMIRE,26 AS ORDINE FROM DUAL UNION
SELECT '965' AS CFOJ, 'Gospodarii auxiliare ale populatiei' AS CFOJ_DENUMIRE,27 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684' AS CFOJ, 'Intreprinderi agricole si GT (de fermier) cu terenuri agricole de 50 ha si peste' AS CFOJ_DENUMIRE,28 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685' AS CFOJ, 'Intreprinderi agricole si GT (de fermier) cu terenuri agricole de 10 ha si peste' AS CFOJ_DENUMIRE,29 AS ORDINE FROM DUAL



  ) TR
) A
LEFT JOIN
(
SELECT
  TR.CFOJ,
  TR.CFOJ_DENUMIRE,
  TR.ORDINE AS CFOJ_ORDINE,
  D.ID_MD,
  D.RIND,
  SUM(CASE WHEN TR.CFOJ LIKE '%'|| D.CFOJ ||'%' THEN D.COL1 END) AS COL1
FROM 
  VW_DATA_ALL D
  CROSS JOIN 
  (
  
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685+686+965' AS CFOJ,'Total categoriile de gospodarii' AS CFOJ_DENUMIRE, 1 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899' AS CFOJ, 'Intreprinderi agricole - total' AS CFOJ_DENUMIRE, 10 AS ORDINE FROM DUAL UNION
SELECT '510+520' AS CFOJ, 'Societati pe actiuni' AS CFOJ_DENUMIRE,11 AS ORDINE FROM DUAL UNION
SELECT '510' AS CFOJ, 'Societati pe actiuni de tip inchis' AS CFOJ_DENUMIRE,12 AS ORDINE FROM DUAL UNION
SELECT '520' AS CFOJ, 'Societati pe actiuni de tip deschis' AS CFOJ_DENUMIRE,13 AS ORDINE FROM DUAL UNION
SELECT '530' AS CFOJ, 'Societati cu raspundere limitata' AS CFOJ_DENUMIRE,14 AS ORDINE FROM DUAL UNION
SELECT '540' AS CFOJ, 'Cooperative agricole de productie' AS CFOJ_DENUMIRE,14.1 AS ORDINE FROM DUAL UNION
SELECT '560' AS CFOJ, 'Alte cooperative (colhozuri-agrofirme+Intreprinderi agricole intergospodaresti)' AS CFOJ_DENUMIRE,15 AS ORDINE FROM DUAL UNION
--SELECT '550' AS CFOJ, 'Cooperative intreprinzator' AS CFOJ_DENUMIRE,16 AS ORDINE FROM DUAL UNION
SELECT '590' AS CFOJ, 'Intreprinderi agricole de stat' AS CFOJ_DENUMIRE,17 AS ORDINE FROM DUAL UNION
SELECT '684+685+686+965' AS CFOJ, 'Sectorul individual' AS CFOJ_DENUMIRE,18 AS ORDINE FROM DUAL UNION
SELECT '684+685+686' AS CFOJ, 'Gospodariile taranesti (de fermier) total' AS CFOJ_DENUMIRE,19 AS ORDINE FROM DUAL UNION
SELECT '684' AS CFOJ, 'Gospodariile taranesti (de fermier) inregistrate cu suprafata terenurilor de 50 ha si peste' AS CFOJ_DENUMIRE,2 AS ORDINE FROM DUAL UNION
SELECT '685' AS CFOJ, 'Gospodariile taranesti (de fermier) cu terenuri agricole de la 10 pina la 50 ha' AS CFOJ_DENUMIRE,20 AS ORDINE FROM DUAL UNION
SELECT '686' AS CFOJ, 'Gospodarii taranesti (de fermier) cu suprafata terenurilor pina la 10 ha' AS CFOJ_DENUMIRE,21 AS ORDINE FROM DUAL UNION
SELECT '684+685' AS CFOJ, 'Gospodariile taranesti (de fermier) inregistrate cu suprafata terenurilor de 10 ha si peste' AS CFOJ_DENUMIRE,22 AS ORDINE FROM DUAL UNION
SELECT '685+686' AS CFOJ, 'Gospodariile taranesti (de fermier) cu terenuri agricole mai putin 50 ha ' AS CFOJ_DENUMIRE,23 AS ORDINE FROM DUAL UNION
SELECT '690' AS CFOJ, 'Alte intreprinderi (Asociatii de gospodarii taranesti si altele)' AS CFOJ_DENUMIRE,24 AS ORDINE FROM DUAL UNION
SELECT '870' AS CFOJ, 'Institutii de stat' AS CFOJ_DENUMIRE,25 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685+686' AS CFOJ, 'Intreprinderi agricole si gospodarii taranesti (de fermier)' AS CFOJ_DENUMIRE,26 AS ORDINE FROM DUAL UNION
SELECT '965' AS CFOJ, 'Gospodarii auxiliare ale populatiei' AS CFOJ_DENUMIRE,27 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684' AS CFOJ, 'Intreprinderi agricole si GT (de fermier) cu terenuri agricole de 50 ha si peste' AS CFOJ_DENUMIRE,28 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685' AS CFOJ, 'Intreprinderi agricole si GT (de fermier) cu terenuri agricole de 10 ha si peste' AS CFOJ_DENUMIRE,29 AS ORDINE FROM DUAL


  ) TR
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND

  D.FORM IN (43)AND   
  D.CAPITOL IN (397) 
GROUP BY
  TR.CFOJ,
  TR.CFOJ_DENUMIRE,
  TR.ORDINE,
  D.ID_MD,
  D.RIND
--ORDER BY
--  TR.ORDINE,
--  D.RIND
UNION 
SELECT
  TR.CFOJ,
  TR.CFOJ_DENUMIRE,
  TR.ORDINE AS CFOJ_ORDINE,
  9999 AS ID_MD,
  '260' AS RIND,
  COUNT(DISTINCT CASE WHEN TR.CFOJ LIKE '%'||D.CFOJ||'%' THEN D.CUIIO END) AS COL1
FROM
  VW_DATA_ALL D
  CROSS JOIN 
  (
  
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685+686+965' AS CFOJ,'Total categoriile de gospodarii' AS CFOJ_DENUMIRE, 1 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899' AS CFOJ, 'Intreprinderi agricole - total' AS CFOJ_DENUMIRE, 10 AS ORDINE FROM DUAL UNION
SELECT '510+520' AS CFOJ, 'Societati pe actiuni' AS CFOJ_DENUMIRE,11 AS ORDINE FROM DUAL UNION
SELECT '510' AS CFOJ, 'Societati pe actiuni de tip inchis' AS CFOJ_DENUMIRE,12 AS ORDINE FROM DUAL UNION
SELECT '520' AS CFOJ, 'Societati pe actiuni de tip deschis' AS CFOJ_DENUMIRE,13 AS ORDINE FROM DUAL UNION
SELECT '530' AS CFOJ, 'Societati cu raspundere limitata' AS CFOJ_DENUMIRE,14 AS ORDINE FROM DUAL UNION
SELECT '540' AS CFOJ, 'Cooperative agricole de productie' AS CFOJ_DENUMIRE,14.1 AS ORDINE FROM DUAL UNION
SELECT '560' AS CFOJ, 'Alte cooperative (colhozuri-agrofirme+Intreprinderi agricole intergospodaresti)' AS CFOJ_DENUMIRE,15 AS ORDINE FROM DUAL UNION
--SELECT '550' AS CFOJ, 'Cooperative intreprinzator' AS CFOJ_DENUMIRE,16 AS ORDINE FROM DUAL UNION
SELECT '590' AS CFOJ, 'Intreprinderi agricole de stat' AS CFOJ_DENUMIRE,17 AS ORDINE FROM DUAL UNION
SELECT '684+685+686+965' AS CFOJ, 'Sectorul individual' AS CFOJ_DENUMIRE,18 AS ORDINE FROM DUAL UNION
SELECT '684+685+686' AS CFOJ, 'Gospodariile taranesti (de fermier) total' AS CFOJ_DENUMIRE,19 AS ORDINE FROM DUAL UNION
SELECT '684' AS CFOJ, 'Gospodariile taranesti (de fermier) inregistrate cu suprafata terenurilor de 50 ha si peste' AS CFOJ_DENUMIRE,2 AS ORDINE FROM DUAL UNION
SELECT '685' AS CFOJ, 'Gospodariile taranesti (de fermier) cu terenuri agricole de la 10 pina la 50 ha' AS CFOJ_DENUMIRE,20 AS ORDINE FROM DUAL UNION
SELECT '686' AS CFOJ, 'Gospodarii taranesti (de fermier) cu suprafata terenurilor pina la 10 ha' AS CFOJ_DENUMIRE,21 AS ORDINE FROM DUAL UNION
SELECT '684+685' AS CFOJ, 'Gospodariile taranesti (de fermier) inregistrate cu suprafata terenurilor de 10 ha si peste' AS CFOJ_DENUMIRE,22 AS ORDINE FROM DUAL UNION
SELECT '685+686' AS CFOJ, 'Gospodariile taranesti (de fermier) cu terenuri agricole mai putin 50 ha ' AS CFOJ_DENUMIRE,23 AS ORDINE FROM DUAL UNION
SELECT '690' AS CFOJ, 'Alte intreprinderi (Asociatii de gospodarii taranesti si altele)' AS CFOJ_DENUMIRE,24 AS ORDINE FROM DUAL UNION
SELECT '870' AS CFOJ, 'Institutii de stat' AS CFOJ_DENUMIRE,25 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685+686' AS CFOJ, 'Intreprinderi agricole si gospodarii taranesti (de fermier)' AS CFOJ_DENUMIRE,26 AS ORDINE FROM DUAL UNION
SELECT '965' AS CFOJ, 'Gospodarii auxiliare ale populatiei' AS CFOJ_DENUMIRE,27 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684' AS CFOJ, 'Intreprinderi agricole si GT (de fermier) cu terenuri agricole de 50 ha si peste' AS CFOJ_DENUMIRE,28 AS ORDINE FROM DUAL UNION
SELECT '500+510+520+530+540+541+560+580+590+620+690+870+880+890+899+684+685' AS CFOJ, 'Intreprinderi agricole si GT (de fermier) cu terenuri agricole de 10 ha si peste' AS CFOJ_DENUMIRE,29 AS ORDINE FROM DUAL



  ) TR
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND

  D.FORM IN (43)AND   
  D.CAPITOL IN (397) 
GROUP BY
  TR.CFOJ,
  TR.CFOJ_DENUMIRE,
  TR.ORDINE
--ORDER BY
--  TR.CFOJ,
--  TR.CFOJ_DENUMIRE,
--  TR.ORDINE
  ) B ON (A.RIND = B.RIND AND A.CFOJ=B.CFOJ)



ORDER BY
  CFOJ_ORDINE,
  RIND)