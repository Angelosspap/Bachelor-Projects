# Cross-Country COVID-19 Correlation Analysis

**University of Piraeus | Academic Group Project | 2021**

## Overview

This analysis investigates the relationships between monthly COVID-19 cases and deaths across five European countries during the early stages of the pandemic.

The objective is to assess whether countries experienced similar patterns in reported infections and mortality, using **Spearman's rank correlation coefficient** to quantify the strength and direction of these relationships.

The analysis focuses on:

- Greece
- Italy
- Denmark
- Belgium
- Finland

All 10 unique country pairs are examined separately for COVID-19 cases and deaths, producing **20 pairwise correlation analyses and 20 scatter plots**.

This section reproduces the analyses presented in Chapter 4, Sections 4.2 and 4.3, of the original university project.

---

## 1. Dataset

The analysis uses monthly COVID-19 data covering **February 2020 to February 2021**.

| Property | Description |
|---|---|
| Dataset | `All_countries.csv` |
| Countries | 5 |
| Time period | February 2020 - February 2021 |
| Observations | 65 |
| Monthly observations per country | 13 |
| Original variables | 7 |
| Main variables used | Country, month, reported cases, reported deaths |

The original dataset contains Greek column names and uses a semicolon (`;`) as the field separator and a comma (`,`) as the decimal separator.

The dataset is available in [`data/All_countries.csv`](data/All_countries.csv).

### Variables used

- **Country (`ΧΩΡΑ`):** Identifies the country.
- **Month (`ΜΗΝΕΣ`):** Identifies the observation period.
- **Cases (`ΚΡΟΥΣΜΑΤΑ`):** Monthly reported COVID-19 cases.
- **Deaths (`ΘΑΝΑΤΟΙ`):** Monthly reported COVID-19 deaths.

The analysis uses monthly counts rather than cumulative totals or population-adjusted rates.

---

## 2. Methodology

### Spearman's Rank Correlation

Spearman's rank correlation coefficient (ρ) is a non-parametric measure of the strength and direction of a monotonic relationship between two variables.

Unlike Pearson's correlation coefficient, Spearman's correlation operates on ranked observations and does not require the relationship to be linear.

Its values range from -1 to +1:

| Spearman ρ | Interpretation |
|---|---|
| +1 | Perfect positive monotonic relationship |
| Close to +1 | Strong positive monotonic relationship |
| Close to 0 | Weak or no monotonic relationship |
| Close to -1 | Strong negative monotonic relationship |
| -1 | Perfect negative monotonic relationship |

The method was used in the original project to compare monthly pandemic patterns between countries.

### Analytical Procedure

The analysis follows these steps:

1. Load the COVID-19 dataset into R.
2. Extract monthly observations for each country.
3. Construct all 10 unique country pairs.
4. Calculate Spearman's correlation coefficient for monthly cases.
5. Repeat the calculations for monthly deaths.
6. Generate scatter plots for each country pair.
7. Compare the results to identify similarities and differences in pandemic patterns.

All calculations were performed using R.

---

## 3. Cross-Country Correlations: COVID-19 Cases

This analysis examines the association between monthly reported COVID-19 cases across the five countries.

### Results

| Country Pair | Spearman ρ |
|---|---:|
| Greece - Italy | 0.879 |
| Greece - Denmark | 0.890 |
| Greece - Belgium | 0.912 |
| Greece - Finland | 0.813 |
| Italy - Denmark | 0.929 |
| Italy - Belgium | 0.890 |
| Italy - Finland | 0.912 |
| Denmark - Belgium | **0.945** |
| Denmark - Finland | 0.896 |
| Belgium - Finland | 0.841 |

*Values rounded to three decimal places from the R calculations.*

### Key Findings

All 10 country pairs exhibit strong positive rank correlations in monthly reported cases.

The strongest association is observed between **Denmark and Belgium (ρ = 0.945)**, followed by Italy and Denmark (ρ = 0.929).

The lowest correlation is observed between Greece and Finland (ρ = 0.813), although this still represents a substantial positive association.

These findings suggest that the countries experienced broadly similar temporal patterns in reported COVID-19 cases during the observation period.

However, correlation does not establish that countries experienced identical infection levels or that one country's pandemic trajectory influenced another.

### Scatter Plots — Cases

The following figures reproduce the pairwise comparisons presented in Figures 4.1-4.10 of the original report.

| Original Figure | Country Pair | Visualization |
|---|---|---|
| 4.1 | Greece - Italy | [View plot](figures/cases/greece_vs_italy_cases.png) |
| 4.2 | Greece - Denmark | [View plot](figures/cases/greece_vs_denmark_cases.png) |
| 4.3 | Greece - Belgium | [View plot](figures/cases/greece_vs_belgium_cases.png) |
| 4.4 | Greece - Finland | [View plot](figures/cases/greece_vs_finland_cases.png) |
| 4.5 | Italy - Denmark | [View plot](figures/cases/italy_vs_denmark_cases.png) |
| 4.6 | Italy - Belgium | [View plot](figures/cases/italy_vs_belgium_cases.png) |
| 4.7 | Italy - Finland | [View plot](figures/cases/italy_vs_finland_cases.png) |
| 4.8 | Denmark - Belgium | [View plot](figures/cases/denmark_vs_belgium_cases.png) |
| 4.9 | Denmark - Finland | [View plot](figures/cases/denmark_vs_finland_cases.png) |
| 4.10 | Belgium - Finland | [View plot](figures/cases/belgium_vs_finland_cases.png) |

All visualizations are available in the [`figures/cases/`](figures/cases/) directory.

---

## 4. Cross-Country Correlations: COVID-19 Deaths

The second analysis examines whether monthly COVID-19 mortality patterns were similarly associated across the five countries.

### Results

| Country Pair | Spearman ρ |
|---|---:|
| Greece - Italy | 0.747 |
| Greece - Denmark | 0.748 |
| Greece - Belgium | 0.687 |
| Greece - Finland | 0.637 |
| Italy - Denmark | 0.922 |
| Italy - Belgium | 0.890 |
| Italy - Finland | 0.896 |
| Denmark - Belgium | 0.820 |
| Denmark - Finland | **0.960** |
| Belgium - Finland | 0.857 |

*Values rounded to three decimal places from the R calculations.*

### Key Findings

All 10 country pairs exhibit positive correlations in monthly COVID-19 deaths.

The strongest association is observed between **Denmark and Finland (ρ = 0.960)**, indicating a particularly strong similarity in the ranking of their monthly mortality counts.

Italy and Denmark also demonstrate a strong positive association (ρ = 0.922).

The weakest association is observed between Greece and Finland (ρ = 0.637).

Compared with the cases analysis, mortality correlations exhibit a wider range of values, suggesting greater variation in the relationships between countries' reported monthly deaths.

### Scatter Plots — Deaths

The following figures reproduce the comparisons presented in Figures 4.11-4.20 of the original report.

| Original Figure | Country Pair | Visualization |
|---|---|---|
| 4.11 | Greece - Italy | [View plot](figures/deaths/greece_vs_italy_deaths.png) |
| 4.12 | Greece - Denmark | [View plot](figures/deaths/greece_vs_denmark_deaths.png) |
| 4.13 | Greece - Belgium | [View plot](figures/deaths/greece_vs_belgium_deaths.png) |
| 4.14 | Greece - Finland | [View plot](figures/deaths/greece_vs_finland_deaths.png) |
| 4.15 | Italy - Denmark | [View plot](figures/deaths/italy_vs_denmark_deaths.png) |
| 4.16 | Italy - Belgium | [View plot](figures/deaths/italy_vs_belgium_deaths.png) |
| 4.17 | Italy - Finland | [View plot](figures/deaths/italy_vs_finland_deaths.png) |
| 4.18 | Denmark - Belgium | [View plot](figures/deaths/denmark_vs_belgium_deaths.png) |
| 4.19 | Denmark - Finland | [View plot](figures/deaths/denmark_vs_finland_deaths.png) |
| 4.20 | Belgium - Finland | [View plot](figures/deaths/belgium_vs_finland_deaths.png) |

All visualizations are available in the [`figures/deaths/`](figures/deaths/) directory.

---

## 5. Comparison of Cases and Deaths

Comparing the two analyses provides additional insight into the relationships between pandemic indicators across countries.

| Metric | Cases | Deaths |
|---|---:|---:|
| Number of country pairs | 10 | 10 |
| Highest Spearman correlation | 0.945 | 0.960 |
| Lowest Spearman correlation | 0.813 | 0.637 |
| Mean pairwise Spearman correlation | 0.881 | 0.816 |
| Strongest country pair | Denmark - Belgium | Denmark - Finland |
| Weakest country pair | Greece - Finland | Greece - Finland |

### Main Observations

**1. Positive associations across all country pairs**

Every country pair shows a positive Spearman correlation for both cases and deaths.

**2. Cases exhibit more consistently high correlations**

Case correlations range from 0.813 to 0.945, whereas death correlations range from 0.637 to 0.960.

**3. Different country pairs lead the two analyses**

Denmark and Belgium have the highest case correlation, while Denmark and Finland have the highest death correlation.

**4. Mortality patterns show greater variation**

The wider range of mortality correlations indicates that the similarity of monthly death rankings varies more substantially across country pairs than the similarity of monthly case rankings.

These results are descriptive and should not be interpreted as evidence of causality.

---

## 6. Project Structure

```text
04-cross-country-correlations/
│
├── README.md
│
├── data/
│   ├── README.md
│   └── All_countries.csv
│
├── scripts/
│   ├── README.md
│   ├── COVID19_Cross_Country_Cases_Correlation.R
│   └── COVID19_Cross_Country_Deaths_Correlation.R
│
└── figures/
    ├── cases/
    │   ├── README.md
    │   └── 10 scatter plots (.png)
    │
    └── deaths/
        ├── README.md
        └── 10 scatter plots (.png)
```

---

## 7. Reproducibility

The analysis can be reproduced using the provided dataset and R scripts.

### Requirements

- R
- RStudio (recommended)
- R packages:
  - `dplyr`
  - `ggplot2`
  - `ggthemes`

Install the required packages:

```r
install.packages(c("dplyr", "ggplot2", "ggthemes"))
```

### Running the Analysis

1. Download or clone the repository.
2. Open the `04-cross-country-correlations` directory in RStudio.
3. Set this directory as the working directory.
4. Run the appropriate R script.

For cases:

```r
source("scripts/COVID19_Cross_Country_Cases_Correlation.R")
```

For deaths:

```r
source("scripts/COVID19_Cross_Country_Deaths_Correlation.R")
```

Both scripts read the dataset from:

```r
"data/All_countries.csv"
```

They calculate the 10 pairwise Spearman correlations for the corresponding variable and generate scatter plots.

The PNG files included in this repository are saved reproductions of the original analyses.

---

## 8. Limitations

Several limitations should be considered when interpreting these findings.

**Limited observation period:** The dataset contains only 13 monthly observations per country, covering the early pandemic period.

**Small sample size:** Each pairwise correlation is calculated using 13 observations, limiting the stability of the estimates.

**Population differences:** The analysis uses absolute monthly counts rather than rates adjusted for population size.

**Reporting differences:** Testing strategies, reporting practices, and definitions may differ across countries.

**Temporal dependence:** Consecutive monthly observations are not necessarily independent. Shared pandemic waves and broader time trends may contribute to positive correlations.

**No lag analysis:** Correlations are calculated for corresponding months without evaluating possible time delays between countries.

**No causal interpretation:** A high correlation does not establish a causal relationship or demonstrate that the countries implemented similarly effective pandemic responses.

These limitations are particularly important when comparing countries with different population sizes and pandemic reporting systems.

---

## 9. Conclusion

This analysis demonstrates how non-parametric correlation methods can be applied to compare COVID-19 trends across countries.

The results reveal consistently positive associations in reported monthly cases and deaths, while also highlighting differences in the strength of these relationships.

The strongest case correlation is observed between Denmark and Belgium (ρ = 0.945), whereas Denmark and Finland exhibit the strongest mortality correlation (ρ = 0.960).

The findings illustrate the usefulness of Spearman's correlation for exploratory comparisons of epidemiological data, while emphasizing the importance of considering sample size, reporting differences, temporal dependence, and population characteristics.

---

## 10. Academic Context

This analysis is part of a **2021 academic group project at the University of Piraeus**, examining the impact of the COVID-19 pandemic on mortality and related demographic indicators.

The repository organizes and reproduces selected analyses from the original project using R, with the aim of improving accessibility, documentation, and reproducibility.

**Tools and techniques:** R, dplyr, ggplot2, ggthemes, exploratory data analysis, Spearman rank correlation, data visualization, cross-country comparisons.
