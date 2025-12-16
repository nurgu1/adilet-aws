SELECT
  city,
  AVG("pm2.5") AS avg_pm25
FROM csv_air_quality
GROUP BY city
ORDER BY avg_pm25 DESC
LIMIT 10;

SELECT
    timestamp,
    pm2_5,
    pm10,
    ozone,
    nitrogen_dioxide
FROM "20251214"
ORDER BY timestamp DESC
LIMIT 10;


SELECT
    city,
    COUNT(*) AS high_risk_days
FROM csv_air_quality
WHERE "pm2.5" > 35
GROUP BY city
ORDER BY high_risk_days DESC
LIMIT 10;


SELECT
  c.city,
  CAST(c.date AS date) AS dt,
  c."pm2.5" AS historical_pm25,
  a.pm2_5   AS realtime_pm25,
  c.pm10    AS historical_pm10,
  a.pm10    AS realtime_pm10,
  c.no2     AS historical_no2,
  a.nitrogen_dioxide AS realtime_no2
FROM csv_air_quality c
LEFT JOIN api_air_quality_view a
  ON CAST(c.date AS date) = a.dt
WHERE c.city IN ('Dubai', 'Mumbai', 'Tokyo')
ORDER BY CAST(c.date AS date) DESC
LIMIT 20;


