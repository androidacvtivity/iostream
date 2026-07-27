


CREATE OR REPLACE FORCE VIEW D_ALL_10_2025

AS
                               SELECT 
                                    DISTINCT D.CUIIO 
                               
                               FROM CIS.VW_DATA_ALL D
                               
                               WHERE 
                               D.FORM = 10
                               AND D.PERIOADA = 2014
                               