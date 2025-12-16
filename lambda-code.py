import os
import json
import boto3
import urllib.request
from datetime import datetime, timezone

s3 = boto3.client("s3")

BUCKET = os.environ["BUCKET"]
LAT = float(os.environ.get("LAT", "47.4979"))   # Budapest default
LON = float(os.environ.get("LON", "19.0402"))   # Budapest default

def lambda_handler(event, context):
    # Open-Meteo Air Quality API (CURRENT conditions, no API key)
    url = (
        "https://air-quality-api.open-meteo.com/v1/air-quality"
        f"?latitude={LAT}&longitude={LON}"
        "&current=pm10,pm2_5,ozone,nitrogen_dioxide"
        "&timezone=UTC"
    )

    with urllib.request.urlopen(url, timeout=20) as response:
        payload = json.loads(response.read().decode("utf-8"))

    current = payload.get("current", {})

    record = {
        "timestamp": current.get("time"),
        "latitude": payload.get("latitude"),
        "longitude": payload.get("longitude"),
        "pm10": current.get("pm10"),
        "pm2_5": current.get("pm2_5"),
        "ozone": current.get("ozone"),
        "nitrogen_dioxide": current.get("nitrogen_dioxide"),
        "source": "open-meteo"
    }

    now = datetime.now(timezone.utc)
    s3_key = (
        f"raw/api_air_quality/"
        f"{now.strftime('%Y%m%d')}/"
        f"air_quality_{now.strftime('%H%M%S')}.json"
    )

    s3.put_object(
        Bucket=BUCKET,
        Key=s3_key,
        Body=json.dumps(record).encode("utf-8"),
        ContentType="application/json"
    )

    return {
        "status": "OK",
        "s3_key": s3_key,
        "data": record

    }
