# COVID-19 Cross-Country Deaths Correlation Analysis
# University of Piraeus — 2021
# Reproduction of Figures 4.11–4.20

library(dplyr)
library(ggplot2)
library(ggthemes)

# 1. Load dataset
data <- read.table(
  file.choose(),
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

# 4. Calculate Spearman correlations and create plots
results <- data.frame(
  Country_1 = character(),
  Country_2 = character(),
  Spearman = numeric()
)

for (i in seq_len(ncol(pairs))) {
  
  a <- pairs[1, i]
  b <- pairs[2, i]
  
  deaths_a <- data %>%
    filter(ΧΩΡΑ == countries[a]) %>%
    pull(ΘΑΝΑΤΟΙ)
  
  deaths_b <- data %>%
    filter(ΧΩΡΑ == countries[b]) %>%
    pull(ΘΑΝΑΤΟΙ)
  
  rho <- cor(deaths_a, deaths_b, method = "spearman")
  
  results <- rbind(
    results,
    data.frame(
      Country_1 = country_names[a],
      Country_2 = country_names[b],
      Spearman = rho
    )
  )
  
  comparison <- data.frame(
    Country_A = deaths_a,
    Country_B = deaths_b
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
        ": Monthly COVID-19 Deaths"
      ),
      x = paste(country_names[a], "- Deaths"),
      y = paste(country_names[b], "- Deaths")
    ) +
    theme_solarized()
  
  print(p)
}

# 5. Display correlation results
print(results)