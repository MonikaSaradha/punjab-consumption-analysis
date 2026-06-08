# Punjab Consumption Analysis (NSSO Data)

## Overview

Geospatial and statistical analysis of NSSO consumption data to identify district-level consumption patterns in Punjab.

This project explores how consumption varies across districts and uses both statistical and visualization techniques to highlight regional disparities.

---

## Dataset

* NSSO (National Sample Survey Office) Consumption Dataset
* Focus: Punjab (district-level data)
* Includes variables such as:

  * Pulses
  * Milk
  * Potato
  * Sugar
  * Eggs

---

## Objectives

* Analyze variation in consumption across districts
* Identify high and low consumption regions
* Visualize distribution using statistical methods
* Map consumption patterns geographically

---

## Implementation

This project was implemented using both **Python** and **R**:

* **Python (Primary)** – data preprocessing, visualization, and geospatial mapping
* **R (Secondary)** – statistical analysis and validation

Both implementations follow the same analytical workflow using different tools.

---

## Data Preprocessing

* Handled missing values by removing minimal null observations
* Checked for outliers using boxplots
* Aggregated consumption across variables to compute total consumption

---

## Analysis

### Distribution Analysis

* Histogram used to understand variation in consumption across districts

### District-wise Comparison

* Aggregated consumption values compared across districts

### Geospatial Visualization

* District-level consumption mapped to highlight regional patterns
* Visual representation used to identify clusters and disparities

---

## Key Insights

* Significant variation in consumption across districts
* Districts like Ludhiana, Amritsar, and Jalandhar show higher consumption
* Some districts consistently show lower consumption levels
* Clear spatial patterns exist across the state

---

## Tech Stack

* Python (pandas, matplotlib, geopandas)
* R (data analysis and visualization)

---

## Project Structure

* `analysis.ipynb` – Python implementation
* `analysis.R` – R implementation (optional)
* `README.md` – project overview
* `project_report.pdf` – detailed analysis
* `dataset.xlsx` – Punjab dataset
*  District boundary shapefile – sourced from publicly available geospatial datasets
   - Open Government Data (OGD) India
   - Natural Earth
