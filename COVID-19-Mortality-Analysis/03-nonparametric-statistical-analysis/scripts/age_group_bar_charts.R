# COVID-19 Mortality Analysis

# Generates 12 figures:
#   - 6 grouped bar charts (one per age group)
#   - 6 country-specific faceted charts
#
# Countries: Belgium, Denmark, Greece, Italy, Finland
# Period: January 2020 - February 2021 (14 months)
# ============================================================


# ------------------------------------------------------------
# 1. REQUIRED PACKAGES
# ------------------------------------------------------------

# Install once if needed:
# install.packages(c("ggplot2", "ggthemes"))

library(ggplot2)
library(ggthemes)


# ------------------------------------------------------------
# 2. PROJECT DIRECTORIES
# ------------------------------------------------------------

# Run this script from the COVID-19-Mortality-Analysis
# project root directory.

chapter_dir <- "03-nonparametric-statistical-analysis"

data_dir <- file.path(chapter_dir, "data")
figures_dir <- file.path(chapter_dir, "figures")

dir.create(figures_dir, recursive = TRUE, showWarnings = FALSE)


# ------------------------------------------------------------
# 3. AGE GROUP CONFIGURATION
# ------------------------------------------------------------

age_groups <- list(
  list(
    label = "0-15",
    file = "0-15.csv",
    output = "age_0-15",
    y_breaks = c(0, 300, 600, 900)
  ),
  list(
    label = "15-24",
    file = "15-24.csv",
    output = "age_15-24",
    y_breaks = c(0, 1000, 2000, 3000, 4000)
  ),
  list(
    label = "25-49",
    file = "25-49.csv",
    output = "age_25-49",
    y_breaks = c(0, 1000, 2000, 3000)
  ),
  list(
    label = "50-64",
    file = "50-64.csv",
    output = "age_50-64",
    y_breaks = c(0, 1000, 2000, 3000)
  ),
  list(
    label = "65-79",
    file = "65-79.csv",
    output = "age_65-79",
    y_breaks = c(0, 500, 1000, 1500, 2000)
  ),
  list(
    label = "80+",
    file = "80+.csv",
    output = "age_80plus",
    y_breaks = c(0, 1000, 2000, 3000)
  )
)


# ------------------------------------------------------------
# 4. COUNTRY LABELS AND COLORS
# ------------------------------------------------------------

country_order <- c(
  "Belgium",
  "Denmark",
  "Greece",
  "Italy",
  "Finland"
)

country_labels <- c(
  "ΒΕΛΓΙΟ",
  "ΔΑΝΙΑ",
  "ΕΛΛΑΔΑ",
  "ΙΤΑΛΙΑ",
  "ΦΙΝΛΑΝΔΙΑ"
)

country_colors <- c(
  Belgium = "#F8766D",
  Denmark = "#A3A500",
  Greece = "#00BF7D",
  Italy = "#00B0F6",
  Finland = "#E76BF3"
)

greek_colors <- setNames(country_colors, country_labels)


# ------------------------------------------------------------
# 5. DATA LOADING AND VALIDATION
# ------------------------------------------------------------

load_age_data <- function(filename) {
  
  path <- file.path(data_dir, filename)
  
  if (!file.exists(path)) {
    stop("CSV file not found: ", path)
  }
  
  # Original CSV files use semicolon separators.
  data <- read.csv2(
    path,
    stringsAsFactors = FALSE,
    check.names = TRUE
  )
  
  required_columns <- c(
    "months",
    "countries",
    "cases.by.100000"
  )
  
  missing_columns <- setdiff(required_columns, names(data))
  
  if (length(missing_columns) > 0) {
    stop(
      "Missing columns in ", filename, ": ",
      paste(missing_columns, collapse = ", ")
    )
  }
  
  # Convert numeric columns safely.
  # This also handles decimal commas in the original CSVs.
  data$months <- as.numeric(
    sub(",", ".", as.character(data$months), fixed = TRUE)
  )
  
  data$cases.by.100000 <- as.numeric(
    sub(
      ",",
      ".",
      as.character(data$cases.by.100000),
      fixed = TRUE
    )
  )
  
  if (anyNA(data$months) || anyNA(data$cases.by.100000)) {
    stop("Missing or invalid numeric values in: ", filename)
  }
  
  if (!all(data$countries %in% country_order)) {
    stop("Unexpected country name in: ", filename)
  }
  
  # Preserve country order.
  data$countries <- factor(
    data$countries,
    levels = country_order
  )
  
  return(data)
}


# ------------------------------------------------------------
# 6. GROUPED BAR CHART
# ------------------------------------------------------------

create_grouped_chart <- function(data, age_label) {
  
  ggplot(
    data,
    aes(
      x = months,
      y = cases.by.100000,
      fill = countries,
      group = countries
    )
  ) +
    geom_col(
      position = position_dodge(width = 0.9),
      width = 0.8
    ) +
    scale_x_continuous(
      breaks = c(0, 5, 10, 15),
      limits = c(0, 15)
    ) +
    scale_fill_manual(
      values = country_colors,
      breaks = country_order,
      labels = country_labels
    ) +
    labs(
      title = "ΟΜΑΔΟΠΟΙΗΜΕΝΟ ΡΑΒΔΟΓΡΑΜΜΑ",
      subtitle = paste("ΓΙΑ ΤΙΣ ΗΛΙΚΙΕΣ", age_label),
      x = "ΜΗΝΕΣ",
      y = "ΚΡΟΥΣΜΑΤΑ ΑΝΑ ΕΚΑΤΟ ΧΙΛΙΑΔΕΣ",
      fill = "ΧΩΡΕΣ"
    ) +
    theme_solarized()
}


# ------------------------------------------------------------
# 7. COUNTRY-SPECIFIC FACETED CHART
# ------------------------------------------------------------

create_country_chart <- function(data, age_label, y_breaks) {
  
  # Convert country names to Greek for visualization only.
  data$countries <- factor(
    as.character(data$countries),
    levels = country_order,
    labels = country_labels
  )
  
  ggplot(
    data,
    aes(
      x = months,
      y = cases.by.100000,
      fill = countries
    )
  ) +
    geom_col(width = 0.8) +
    geom_line(
      aes(group = countries),
      linewidth = 0.5,
      colour = "black"
    ) +
    geom_point(
      size = 1.5,
      colour = "red"
    ) +
    scale_x_continuous(
      breaks = c(0, 5, 10, 15),
      limits = c(0, 15)
    ) +
    scale_y_continuous(
      breaks = y_breaks
    ) +
    scale_fill_manual(
      values = greek_colors
    ) +
    facet_wrap(
      ~countries,
      ncol = 1
    ) +
    labs(
      title = "ΡΑΒΔΟΓΡΑΜΜΑΤΑ ΚΑΘΕ ΧΩΡΑΣ ΞΕΧΩΡΙΣΤΑ",
      subtitle = paste("ΓΙΑ ΤΙΣ ΗΛΙΚΙΕΣ", age_label),
      x = "ΜΗΝΕΣ",
      y = "ΚΡΟΥΣΜΑΤΑ ΑΝΑ ΕΚΑΤΟ ΧΙΛΙΑΔΕΣ"
    ) +
    theme_solarized() +
    theme(
      legend.position = "none"
    )
}


# ------------------------------------------------------------
# 8. GENERATE AND SAVE ALL 12 FIGURES
# ------------------------------------------------------------

for (group in age_groups) {
  
  cat("\nProcessing age group:", group$label, "\n")
  
  # Load CSV
  data <- load_age_data(group$file)
  
  # Create grouped bar chart
  grouped_plot <- create_grouped_chart(
    data,
    group$label
  )
  
  # Create country-specific chart
  country_plot <- create_country_chart(
    data,
    group$label,
    group$y_breaks
  )
  
  # Save grouped bar chart
  grouped_filename <- file.path(
    figures_dir,
    paste0(group$output, "_grouped_bar_chart.png")
  )
  
  ggsave(
    filename = grouped_filename,
    plot = grouped_plot,
    width = 11,
    height = 6,
    dpi = 300
  )
  
  # Save country-specific chart
  country_filename <- file.path(
    figures_dir,
    paste0(group$output, "_by_country.png")
  )
  
  ggsave(
    filename = country_filename,
    plot = country_plot,
    width = 9,
    height = 12,
    dpi = 300
  )
  
  cat("Saved:", grouped_filename, "\n")
  cat("Saved:", country_filename, "\n")
}

cat("\nAll 12 figures generated successfully!\n")
