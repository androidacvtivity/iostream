SELECT 
DISTINCT 
D.CUIIO,
D.CUIIO_VERS,
D.T_XML_FORM_ID
        
                          
                          
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
            
            
            WHERE 
            
            D.CUIIO IN (
            41149398,
41277802,
7039301,
41346742,
7039198,
20405029,
41760484,
20284519,
41619622,
41006888,
40748889,
38255487,
37749342,
2048761,
1844272,
40739815,
4493637,
38692070,
15858668,
40507789,
40467280,
40950639,
40549960,
2049890,
41337958,
38750241,
39080340,
39080357,
37015443,
04493554,
7038980

            )
            
            
            AND FORM = 76 AND PERIOADA = 1064