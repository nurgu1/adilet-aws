# Pollution Risk Analytics on AWS

## Project Overview
This project implements a serverless data pipeline on Amazon Web Services (AWS) to analyze air pollution risk by combining **historical emissions data** with **near real-time air quality measurements**. The goal is to support environmental decision-making by identifying pollution hotspots, monitoring exposure trends, and enabling timely public health responses.

The solution integrates publicly available datasets, processes them using AWS-native services, and enables analytical queries through a scalable, low-cost architecture.

---

## Stakeholders & Business Value

### Target Stakeholders
- Ministry of Environment and environmental regulators
- Public health authorities
- City and regional governments
- Researchers and policy analysts
- Citizens and non-governmental organizations (NGOs)

### Business Value
- Faster identification of pollution hotspots
- Improved monitoring of population exposure to air pollutants
- Evidence-based environmental policy and enforcement
- Low-cost, scalable analytics infrastructure
- Transparent and reproducible environmental data analysis

---

## Data Sources

### 1. Real-Time Air Quality Data (OpenAQ)
- Source: OpenAQ API
- Format: JSON
- Pollutants: PM2.5, PM10, NO₂, O₃, CO
- Frequency: Near real-time
- Use: Detection of current pollution levels and short-term risk

Official documentation:  
https://docs.openaq.org/

### 2. Historical Emissions Data (EPA NEI)
- Source: U.S. Environmental Protection Agency (EPA)
- Dataset: National Emissions Inventory (NEI)
- Format: CSV
- Level: Facility-level annual emissions
- Use: Identification of long-term pollution drivers

Official download page:  
https://www.epa.gov/air-emissions-inventories/national-emissions-inventory-nei

---

## Pipeline Architecture

### Architecture Overview
The project follows a serverless data lake architecture:

1. **Data Ingestion**
   - OpenAQ data is retrieved using AWS Lambda via public API calls
   - EPA NEI CSV data is uploaded to Amazon S3

2. **Storage**
   - Amazon S3 acts as the raw and curated data lake

3. **Processing & Transformation**
   - AWS Glue Crawlers infer schemas
   - AWS Glue ETL jobs clean, normalize, and join datasets

4. **Analytics**
   - Amazon Athena performs SQL-based analytical queries
   - (Optional) Amazon QuickSight visualizes trends and hotspots

---

## AWS Services Used

| Service | Purpose |
|------|--------|
| Amazon S3 | Raw and curated data storage |
| AWS Lambda | OpenAQ API ingestion |
| AWS Glue | Data cataloging and ETL |
| Amazon Athena | SQL analytics |
| Amazon QuickSight | Visualization (optional) |
| AWS IAM | Security and access control |

---

## Cost Estimation (Monthly)

| Service | Estimated Cost (USD) |
|------|---------------------|
| Amazon S3 | $0.50 |
| AWS Lambda | $0.20 |
| AWS Glue Crawlers | $0.45 |
| AWS Glue ETL Jobs | $4.40 |
| Amazon Athena | $0.50 |
| Amazon QuickSight | $9.00 |
| **Total** | **≈ $15–16** |

This cost-efficient design supports continuous monitoring with minimal fixed expenses.

---

## Key Performance Indicators (KPIs)

1. **Alert Latency**  
   Time between pollutant measurement ingestion and data availability for analysis.

2. **High-Risk Exposure Days**  
   Number of days where pollutant levels exceed health-based thresholds.

3. **Hotspot Detection Rate**  
   Count of cities or regions classified as high-risk within a given period.

4. **Data Freshness**  
   Time since the most recent air quality measurement ingestion.

---

## Implementation Summary

- OpenAQ data is ingested automatically using AWS Lambda and stored as raw JSON in S3
- EPA NEI emissions data is uploaded as CSV to S3
- AWS Glue Crawlers build the data catalog
- AWS Glue ETL jobs normalize schemas and join datasets by city and time period
- Amazon Athena enables analytical queries such as hotspot detection and trend analysis

---

## Results & Interpretation

The integrated dataset enables:
- Identification of cities with consistently high pollution levels
- Comparison of historical emission patterns with current air quality
- Prioritization of high-risk locations for regulatory or public health action

The solution demonstrates how cloud-based analytics can support environmental monitoring and decision-making at low cost.

---

## Limitations & Future Improvements

### Limitations
- Emissions data is annual and not real-time
- Risk scoring is a simplified proxy
- Geographical matching is based on city-level aggregation

### Future Improvements
- Integration of meteorological data (wind, temperature)
- Advanced geospatial joins (geohash or H3)
- Automated alerts using Amazon SNS
- Infrastructure as Code (Terraform or AWS CDK)


