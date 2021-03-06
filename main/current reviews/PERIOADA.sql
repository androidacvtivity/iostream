 SELECT 
 PERIOADA, 
 TIP_PERIOADA, 
 ANUL
 
FROM 
 (
SELECT 


CASE 
WHEN P.NUM = 8 THEN P.PERIOADA - 11 
WHEN P.NUM = 7 THEN P.PERIOADA - 10
WHEN P.NUM = 6 THEN P.PERIOADA - 9
WHEN P.NUM = 5 THEN P.PERIOADA - 8
WHEN P.NUM = 4 THEN P.PERIOADA - 7
WHEN P.NUM = 3 THEN P.PERIOADA - 6
WHEN P.NUM = 2 THEN P.PERIOADA - 5
WHEN P.NUM = 1 THEN P.PERIOADA - 4
ELSE  
P.PERIOADA END  PERIOADA,
 
P.NUM, 
P.TIP_PERIOADA, 
P.ANUL
  FROM CIS.MD_PERIOADA  P
       INNER JOIN
       (SELECT P.PERIOADA,
               P.TIP_PERIOADA,
               P.ANUL,
               (CASE

                    WHEN P.NUM = 10 THEN 9
                    WHEN P.NUM = 11 THEN 9
                    WHEN P.NUM = 12 THEN 9
                    ELSE P.NUM
                END)
                   NUM
          FROM CIS.MD_PERIOADA P
         WHERE P.PERIOADA = :pPERIOADA) PP
           ON     P.NUM = PP.NUM
              AND P.TIP_PERIOADA = PP.TIP_PERIOADA
              AND P.ANUL = PP.ANUL) 