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



