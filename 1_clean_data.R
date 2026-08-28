# Loading package and moving average function

library(tidyverse)
source("R/moving-average.R")

# Loading in raw data

BQ1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
BQ2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
BQ3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
RMP <- read_csv("data/RioMameyesPuenteRoto.csv")


# Binding the four data frames
bpr_ions <- bind_rows(BQ1, BQ2, BQ3, BQ3, RMP)

# Calculating moving average for ion concentrations at each site

bq1_result <- moving_average(BQ1)
bq2_result <- moving_average(BQ2)
bq3_result <- moving_average(BQ3)
rmp_result <- moving_average(RMP)

# Binding the four data frames
bpr <- bind_rows(bq1_result, bq2_result, bq3_result, rmp_result)

# Pivoting to long tidy form for visualization

bpr_long <- bpr |>
  pivot_longer(
    cols = c(K, `NO3-N`, Mg, Ca, `NH4-N`),
    names_to = "Ion",
    values_to = "Concentration (mg/L)"
  )

write_csv(bpr_long, "output/bpr_ma_long.csv")
