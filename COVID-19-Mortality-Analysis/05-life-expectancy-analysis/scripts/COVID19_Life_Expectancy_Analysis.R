# COVID-19 Life Expectancy Analysis
# Five European countries, 2005–2019

library(readxl)
library(ggplot2)
library(ggthemes)

# Load data
life_data <- read_excel("data/Life_Expectancy_2005_2019.xlsx")

# Convert decimal commas to numeric values
life_data$ΓΥΝΑΙΚΕΣ <- as.numeric(
  sub(",", ".", life_data$ΓΥΝΑΙΚΕΣ)
)

life_data$ΑΝΔΡΕΣ <- as.numeric(
  sub(",", ".", life_data$ΑΝΔΡΕΣ)
)

life_data$ΣΥΝΟΛΟ <- as.numeric(
  sub(",", ".", life_data$ΣΥΝΟΛΟ)
)

# Function to generate a life expectancy plot
plot_life_expectancy <- function(data, variable, title, y_label) {
  
  ggplot(
    data,
    aes(
      x = ΕΤΟΣ,
      y = .data[[variable]],
      color = ΧΩΡΑ,
      group = ΧΩΡΑ
    )
  ) +
    geom_line(linewidth = 0.7) +
    geom_point(size = 1.7) +
    scale_x_continuous(
      breaks = c(2008, 2012, 2016)
    ) +
    labs(
      title = title,
      x = "ΕΤΟΣ",
      y = y_label,
      color = "ΧΩΡΑ"
    ) +
    guides(
      color = guide_legend(
        override.aes = list(
          linetype = 0,
          shape = 16,
          size = 2
        )
      )
    ) +
    theme_solarized()
}

# Figure 5.1: Female Life Expectancy
female_plot <- plot_life_expectancy(
  life_data,
  "ΓΥΝΑΙΚΕΣ",
  "ΠΡΟΣΔΟΚΙΜΟ ΖΩΗΣ ΓΥΝΑΙΚΩΝ",
  "Female Life Expectancy"
)

print(female_plot)

# Figure 5.2: Male Life Expectancy
male_plot <- plot_life_expectancy(
  life_data,
  "ΑΝΔΡΕΣ",
  "ΠΡΟΣΔΟΚΙΜΟ ΖΩΗΣ ΑΝΔΡΩΝ",
  "Male Life Expectancy"
)

print(male_plot)

# Figure 5.3: Total Life Expectancy
total_plot <- plot_life_expectancy(
  life_data,
  "ΣΥΝΟΛΟ",
  "ΣΥΝΟΛΙΚΟ ΠΡΟΣΔΟΚΙΜΟ ΖΩΗΣ",
  "Total Life Expectancy"
)

print(total_plot)