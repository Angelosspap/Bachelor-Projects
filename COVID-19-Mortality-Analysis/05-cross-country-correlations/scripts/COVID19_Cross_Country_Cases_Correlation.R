# COVID-19 Cross-Country Cases Correlation Analysis
# University of Piraeus — 2021
# Reproduction of Figures 4.1–4.10

library(dplyr)
library(ggplot2)
library(ggthemes)

# 1. Load dataset
data <- read.table(
  "data/All_countries.csv",
  sep = ";",
  dec = ",",
  header = TRUE,
  fileEncoding = "CP1253"
)

# 2. Define countries
countries <- c(
  "ΕΛΛΑΔΑ", "ΙΤΑΛΙΑ", "ΔΑΝΙΑ",
  "ΒΕΛΓΙΟ", "ΦΙΝΛΑΝΔΙΑ"
)

country_names <- c(
  "Greece", "Italy", "Denmark",
  "Belgium", "Finland"
)

# 3. Generate all 10 unique country pairs
pairs <- combn(seq_along(countries), 2)

# 4. Calculate correlations and reproduce scatter plots
results <- data.frame(
  Country_1 = character(),
  Country_2 = character(),
  Spearman = numeric()
)

for (i in seq_len(ncol(pairs))) {
  
  a <- pairs[1, i]
  b <- pairs[2, i]
  
  cases_a <- data %>%
    filter(ΧΩΡΑ == countries[a]) %>%
    pull(ΚΡΟΥΣΜΑΤΑ)
  
  cases_b <- data %>%
    filter(ΧΩΡΑ == countries[b]) %>%
    pull(ΚΡΟΥΣΜΑΤΑ)
  
  rho <- cor(cases_a, cases_b, method = "spearman")
  
  results <- rbind(
    results,
    data.frame(
      Country_1 = country_names[a],
      Country_2 = country_names[b],
      Spearman = rho
    )
  )
  
  comparison <- data.frame(
    Country_A = cases_a,
    Country_B = cases_b
  )
  
  p <- ggplot(
    comparison,
    aes(x = Country_A, y = Country_B)
  ) +
    geom_point(size = 2, colour = "black") +
    labs(
      title = paste(
        country_names[a], "vs",
        country_names[b],
        ": Monthly COVID-19 Cases"
      ),
      x = paste(country_names[a], "- Cases"),
      y = paste(country_names[b], "- Cases")
    ) +
    theme_solarized()
  
  print(p)
}

# 5. Display correlation results
print(results)
