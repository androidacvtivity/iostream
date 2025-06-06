SELECT 
  x.ENT_NAME,
  x.FISCCOD_FISC,
  x.CUATM,
  x.STREET,
  x.STREET_NR,
  x.CAEM,
  x.CUIIO,
  x.IDNO,
  x.HEAD,
  x.EXECUTOR,
  x.PHONE,
  x.nalogPeriodLetter,
  x.nalogPeriodType,
  x.EMAIL,
  x.YEAR,
  x.TRIM
FROM USER_EREPORTING.F_XML_FORMS f,
     XMLTABLE(
       '/dec/DataSet/Header'
       PASSING XMLTYPE(f.XML)
       COLUMNS
         ENT_NAME           VARCHAR2(100) PATH 'ENT_NAME',
         FISCCOD_FISC       VARCHAR2(20)  PATH 'FISCCOD_FISC',
         CUATM              VARCHAR2(10)  PATH 'CUATM',
         STREET             VARCHAR2(200) PATH 'STREET',
         STREET_NR          VARCHAR2(20)  PATH 'STREET_NR',
         CAEM               VARCHAR2(20)  PATH 'CAEM',
         CUIIO              VARCHAR2(20)  PATH 'CUIIO',
         IDNO               VARCHAR2(20)  PATH 'IDNO',
         HEAD               VARCHAR2(100) PATH 'HEAD',
         EXECUTOR           VARCHAR2(100) PATH 'EXECUTOR',
         PHONE              VARCHAR2(20)  PATH 'PHONE',
         nalogPeriodLetter  VARCHAR2(10)  PATH 'nalogPeriodLetter',
         nalogPeriodType    VARCHAR2(20)  PATH 'nalogPeriodType',
         EMAIL              VARCHAR2(100) PATH 'EMAIL',
         YEAR               VARCHAR2(10)  PATH 'YEAR',
         TRIM               VARCHAR2(10)  PATH 'TRIM'
     ) x
WHERE f.FORMID = 24552628;

