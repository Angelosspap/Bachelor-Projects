# COVID-19 Correlation Analysis
# University of Piraeus — 2021
# Reproduction of Figures 4.21–4.25 and Table 4.3

library(dplyr)
library(ggplot2)
library(ggthemes)

# 1. Load monthly COVID-19 data
data <- read.table(
  file.choose(),
  sep = ";",
  dec = ",",
  header = TRUE,
  fileEncoding = "CP1253"
)

# 2. Calculate Spearman correlations
# Monthly cases vs monthly deaths, separately for each country
correlation_results <- data %>%
  group_by(ΧΩΡΑ) %>%
  summarise(
    spearman = cor(ΚΡΟΥΣΜΑΤΑ, ΘΑΝΑΤΟΙ, method = "spearman"),
    .groups = "drop"
  )

print(correlation_results)

# 3. Reproduce Figures 4.21–4.25
countries <- c(
  "ΕΛΛΑΔΑ", "ΙΤΑΛΙΑ", "ΔΑΝΙΑ", "ΒΕΛΓΙΟ", "ΦΙΝΛΑΝΔΙΑ"
)

country_names <- c(
  "Greece", "Italy", "Denmark", "Belgium", "Finland"
)

for (i in seq_along(countries)) {
  
  plot_data <- data %>%
    filter(ΧΩΡΑ == countries[i])
  
  p <- ggplot(
    plot_data,
    aes(x = ΚΡΟΥΣΜΑΤΑ, y = ΘΑΝΑΤΟΙ)
  ) +
    geom_point(size = 2, colour = "black") +
    labs(
      title = paste(country_names[i], ": COVID-19 Cases vs Deaths"),
      x = "Cases",
      y = "Deaths"
    ) +
    theme_solarized()
  
  print(p)
}