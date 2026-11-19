data <- read.table(
  "data/All_countries.csv",
  sep = ";",
  dec = ",",
  header = TRUE,
  fileEncoding = "CP1253"
)

library(ggplot2)
library(dplyr)
library(ggthemes)

data %>%
  ggplot(aes(x = ΜΗΝΕΣ, y = ΚΡΟΥΣΜΑΤΑ, colour = ΧΩΡΑ)) +
  geom_point(size = 2) +
  geom_line(aes(group = ΧΩΡΑ), linewidth = 1) +
  facet_wrap(~ ΧΩΡΑ) +
  labs(
    title = "Monthly COVID-19 Cases by Country",
    x = "Month",
    y = "Reported cases",
    colour = "Country"
  ) +
  theme_solarized()
