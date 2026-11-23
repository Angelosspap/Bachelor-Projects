# R Scripts - Life Expectancy Analysis

## Overview

This directory contains the R script used to reproduce the pre-pandemic life expectancy visualizations presented in Chapter 5.1 of the original bachelor's thesis, *The Effect of the Pandemic on Mortality for the Present and the Future* (University of Piraeus, 2021).

## Script

**`COVID19_Life_Expectancy_Analysis.R`**

The script analyzes life expectancy at birth across five European countries: Belgium, Denmark, Greece, Italy, and Finland.

It covers five reference years: **2005, 2010, 2015, 2018, and 2019**.

## Analysis Workflow

The script performs the following operations:

1. Imports the Excel dataset using `readxl`.
2. Converts decimal-comma values into numeric format.
3. Defines a reusable function for creating comparative life expectancy charts.
4. Generates three line charts using `ggplot2` and `ggthemes`:
   - Female life expectancy
   - Male life expectancy
   - Total life expectancy

Each visualization compares the five countries over time.

## Requirements

The following R packages are required:

- `readxl`
- `ggplot2`
- `ggthemes`

Install them using:

```r
install.packages(c("readxl", "ggplot2", "ggthemes"))
```

## How to Run

Set the working directory to the main `05-life-expectancy-analysis` folder and execute:

```r
source("scripts/COVID19_Life_Expectancy_Analysis.R")
```

The script loads the dataset from:

`data/Life_Expectancy_2005_2019.xlsx`

The three generated plots can be viewed in RStudio. The corresponding PNG files are available in the `figures` directory.

## Reproducibility

The script reproduces the descriptive visualization approach of Figures 5.1–5.3 in the original thesis.

It focuses exclusively on pre-pandemic observations (2005–2019) and does not perform predictive modeling or estimate the causal effects of COVID-19.

For the complete analysis, visualizations, and interpretation, see the [main README](../README.md).
