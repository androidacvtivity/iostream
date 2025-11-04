CREATE OR REPLACE FORCE VIEW VW_1_11
AS 

SELECT
        DISTINCT D.CUIIO,
    --    D.RIND,
        NVAL(SUM(D.COL1)) AS COL1,
        NVAL(SUM(D.COL2)) AS COL2
      FROM 
        CIS2.VW_DATA_ALL D
      WHERE
        D.PERIOADA IN (2013) AND
        D.FORM IN (48) AND 
        D.CAPITOL = 1040 AND CAPITOL_VERS = 2013 AND 
        D.RIND IN ('1.11.1','1.11.2','1.11.3') AND
        D.CAEM2 NOT LIKE 'A%'
        -- AND NVAL(D.COL1) = 1
   GROUP BY
     D.CUIIO
    -- D.RIND
        
        
        HAVING 
        SUM(NVAL(D.COL1)) >= 1
        


ORDER BY
D.CUIIO


--Numarul de CUIIO care au cel putin un rand completat pe COL1 din randurile RIND IN ('1.11.1','1.11.2','1.11.3') - este 204 

--Numarul de CUIIO care au cel putin un rand completat pe COL1 sau COL2 sau COL3  din randurile RIND IN ('1.12.1','1.12.2','1.12.3','1.12.4','1.12.5','1.12.6','1.12.7','1.12.8','1.12.9')  - este 258


-- Validarea daca exista cel putin un rand  ('1.11.1','1.11.2','1.11.3') pe col1 trebuie sa existe cel putin un rand ('1.12.1','1.12.2','1.12.3','1.12.4','1.12.5','1.12.6','1.12.7','1.12.8','1.12.9')  pe una di coloane COL1 sau COL2 sau COL3 ? 