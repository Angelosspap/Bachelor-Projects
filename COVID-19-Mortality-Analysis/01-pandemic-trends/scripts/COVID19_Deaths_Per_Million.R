# Monthly COVID-19 deaths per million inhabitants
# Comparison of five European countries

library(ggplot2)
library(dplyr)
library(ggthemes)

# Load the dataset
# Run this script with the working directory set to 01-pandemic-trends

data_million <- read.table(
  "data/All_countries by million.csv",
  sep = ";",
  dec = ",",
  header = TRUE,
  fileEncoding = "CP1253"
)

# Plot monthly deaths per million inhabitants

data_million %>%
  ggplot(aes(x = ΜΗΝΕΣ, y = ΘΑΝΑΤΟΙ, colour = ΧΩΡΑ)) +
  geom_point(size = 2) +
  geom_line(aes(group = ΧΩΡΑ), linewidth = 1) +
  facet_wrap(~ ΧΩΡΑ) +
  labs(
    title = "Monthly COVID-19 Deaths per Million by Country",
    x = "Month",
    y = "Deaths per million",
    colour = "Country"
  ) +
  theme_solarized()
