# Pollution Risk Analytics using AWS

## Project Overview
This project implements a serverless data analytics pipeline on AWS to analyze air pollution risks using two independent data sources:
- Historical air quality data (CSV)
- Real-time air quality data via API (Open-Meteo Air Quality API)

The goal is to demonstrate how cloud-based data pipelines support environmental monitoring, risk detection, and data-driven decision-making at low cost and high scalability.

---

## 1. Stakeholders & Business Value

### Target Stakeholders
- Ministry of Environment  
- Public Health Agencies  
- City Governments / Municipalities  
- Researchers and NGOs  
- Citizens  

### Business Problem
Air pollution causes serious health and environmental problems. Decision-makers often lack integrated historical and real-time data, making it difficult to identify pollution hotspots and react quickly.

### Business Value
- Identification of pollution hotspots
- Health risk assessment using PM2.5 thresholds
- Near real-time monitoring via API ingestion
- Low-cost, serverless AWS architecture
- Scalable solution for city or national deployment

---

## 2. Pipeline Architecture & Costs

### Architecture Overview
```
CSV Dataset ─────────────┐
                          ├─ Amazon S3 (raw)
API (Open-Meteo) → Lambda ─┘
            ↓
        AWS Glue Crawlers
            ↓
        AWS Glue Data Catalog
            ↓
        Amazon Athena
            ↓
        KPI Analysis
```

### AWS Services Used
- Amazon S3 – data lake storage
- AWS Lambda – API ingestion
- AWS Glue – schema discovery and catalog
- Amazon Athena – SQL analytics

### Cost Estimation
| Service | Estimated Monthly Cost |
|------|------------------------|
| Amazon S3 | <$1 |
| AWS Lambda | ~$0 |
| AWS Glue | <$1 |
| Amazon Athena | <$1 |
| **Total** | **~$2–$5/month** |

This supports the business goal of affordable environmental monitoring.

---

## 3. Key Performance Indicators (KPIs)

### KPI 1 – Average PM2.5 by City
Identifies long-term pollution hotspots.

### KPI 2 – High-Risk Days (PM2.5 > 35 µg/m³)
Measures frequency of unhealthy air quality days.

### KPI 3 – Real-Time Pollution Snapshot
Provides current air quality conditions from API data.

### KPI 4 – Data Freshness
Confirms the pipeline is ingesting up-to-date data.

---

## 4. Implementation & Results

### Data Ingestion
- CSV data uploaded to:
  `s3://pollution-risk-analytics-adilet/raw/csv_air_quality/`
- API data ingested via AWS Lambda and stored in:
  `s3://pollution-risk-analytics-adilet/raw/api_air_quality/`

### Data Processing & Querying
- AWS Glue Crawlers create tables in `pollution_risk_db`
- Amazon Athena used for all SQL queries and KPI calculations

### Results Interpretation
- Cities such as Dubai and Mumbai show high average PM2.5 levels
- High-risk days highlight long-term health exposure
- API results confirm real-time monitoring capability
- Data freshness verifies pipeline reliability

---

## 5. Repository & Collaboration
- Documentation written entirely in Markdown
- GitHub repository created and maintained
- Contributors added:
  - szabild@yahoo.com
  - balint.matyus@gmail.com

---

## 6. Slideshow Presentation
A 10-minute presentation was created covering business need, architecture, KPIs, results, and business value, and uploaded to Moodle.

---

## Conclusion
This project demonstrates a scalable, low-cost AWS-based pollution risk analytics solution using both historical and real-time data sources. It provides actionable insights for environmental and public health decision-making.
