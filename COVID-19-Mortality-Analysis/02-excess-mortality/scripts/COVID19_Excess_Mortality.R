# COVID-19 Excess Mortality Analysis
# Comparison of five European countries
# Reproduction of Figure 2.31

library(ggplot2)
library(dplyr)
library(ggthemes)

# Load data
excess_data <- read.table(
  file.choose(),
  sep = ";",
  dec = ",",
  header = TRUE,
  fileEncoding = "CP1253"
)

# Visualize excess mortality by country
excess_data %>%
  ggplot(aes(
    x = ΜΗΝΕΣ,
    y = ΥΠΕΡΒΑΛΟΥΣΑ.ΘΝΗΣΙΜΟΤΗΤΑ,
    colour = ΧΩΡΑ
  )) +
  geom_line(aes(group = ΧΩΡΑ), linewidth = 1) +
  geom_point(size = 2) +
  facet_wrap(~ ΧΩΡΑ) +
  geom_hline(yintercept = 0, linetype = "dashed", colour = "grey50") +
  labs(
    title = "Monthly Excess Mortality by Country",
    x = "Month",
    y = "Excess mortality (%)",
    colour = "Country"
  ) +
  theme_solarized()