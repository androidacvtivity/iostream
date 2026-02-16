SELECT FC.CUIIO,
       FC.CUIIO_VERS,
       R.CUATM,
       R.IDNO   
              FROM(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             --and FC.FORM_VERS = 1004 
             
             ) FC  INNER JOIN CIS2.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
             
             
             WHERE
             --------------------------
             --FC.CUIIO_VERS = 1064
            

 
             
             FC.CUIIO LIKE :pCUIIO||'%'


AND 
FC.FORM IN (:pFORM)

ORDER BY 
FC.CUIIO


 ;
 
 
 --- 1847603
 
 select DISTINCT 
 CUIIO,
 CUIIO_VERS,
 MAX(DATA_REG) DATA_REG,
 SUM(COL1)  COL1,
 SUM(COL2)  COL2,
 SUM(COL3)  COL3,
 SUM(COL4)  COL4,
 SUM(COL5)  COL5,
 SUM(COL6)  COL6,
 SUM(COL7)  COL7,
 SUM(COL8)  COL8 
 
 from USER_EREPORTING.DATA_ALL
 
 WHERE
 
 
 PERIOADA IN (:pPERIOADA)
             and CUIIO LIKE :pCUIIO||'%'


AND 

FORM  IN (:pFORM)

 
GROUP BY
 CUIIO,
 CUIIO_VERS
 
 ORDER BY 
 CUIIO

;



select DISTINCT 
 CUIIO,
 CUIIO_VERS
-- MAX(USER_NAME)   USER_NAME
 
 from USER_EREPORTING.DATA_ALL_PRIMIT
 
 WHERE
 
 PERIOADA IN (:pPERIOADA)
             and CUIIO LIKE :pCUIIO||'%'


AND 

FORM IN (:pFORM);

-------------------------------------------ss
select DISTINCT 
 CUIIO,
 CUIIO_VERS,
 CUATM,
 USER_NAME 
 
 from CIS2.VW_DATA_ALL
 
 WHERE
 
 PERIOADA IN (:pPERIOADA)
             and CUIIO LIKE :pCUIIO||'%'


AND 

FORM IN (:pFORM);

 --41301386