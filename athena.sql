SELECT
  city,
  AVG("pm2.5") AS avg_pm25
FROM csv_air_quality
GROUP BY city
ORDER BY avg_pm25 DESC
LIMIT 10;



