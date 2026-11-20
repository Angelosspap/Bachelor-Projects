# Life Expectancy Dataset

## Overview

This directory contains the dataset used for the pre-pandemic life expectancy analysis presented in Chapter 5.1 of the original bachelor's thesis (University of Piraeus, 2021).

## Dataset File

**`Life_Expectancy_2005_2019.xlsx`**

The dataset includes life expectancy at birth for five European countries:

- Belgium
- Denmark
- Greece
- Italy
- Finland

The observations cover five reference years: **2005, 2010, 2015, 2018, and 2019**.

## Variables

| Column | Description |
|---|---|
| `ΕΤΟΣ` | Reference year |
| `ΧΩΡΑ` | Country |
| `ΓΥΝΑΙΚΕΣ` | Female life expectancy at birth (years) |
| `ΑΝΔΡΕΣ` | Male life expectancy at birth (years) |
| `ΣΥΝΟΛΟ` | Total life expectancy at birth (years) |

The dataset contains 25 country-year observations.

## Data Source

The values were compiled from **Table 5.1 of the original thesis**, which reports life expectancy statistics sourced from Eurostat.

The Excel file was structured for use in R to reproduce the three comparative visualizations from Chapter 5.1.

## Data Processing

The R script imports the Excel file using `readxl` and converts decimal-comma values into numeric format before generating the visualizations.

No statistical imputation or predictive modeling is performed.

For the analysis, methodology, and results, see the [main README](../README.md).
