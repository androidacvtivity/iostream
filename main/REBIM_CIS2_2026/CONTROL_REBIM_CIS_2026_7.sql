WITH src AS (
  SELECT r.CUIIO, r.CUIIO_VERS
  FROM USER_BANCU.VW_8_2013 l
  JOIN CIS2.CONTROL r
    ON l.CUIIO = r.CUIIO
  WHERE r.PERIOADA = 2014
),
dups AS (                          -- total row duplicates per CUIIO
  SELECT CUIIO, COUNT(*) AS dup_count
  FROM src
  GROUP BY CUIIO
  HAVING COUNT(*) > 1
),
vers AS (                          -- distinct versions per CUIIO for LISTAGG
  SELECT CUIIO,
         LISTAGG(CUIIO_VERS, ',') WITHIN GROUP (ORDER BY CUIIO_VERS) AS versions_present,
         COUNT(*) AS version_count
  FROM (SELECT DISTINCT CUIIO, CUIIO_VERS FROM src)
  GROUP BY CUIIO
)
SELECT d.CUIIO, d.dup_count, v.version_count, v.versions_present
FROM dups d
JOIN vers v ON v.CUIIO = d.CUIIO
ORDER BY d.dup_count DESC, d.CUIIO;
