library(tidyverse)

# Making a 9-week moving average function

# Selecting the columns for date, sample site, and ions
# Filtering for date range between May 1986 to January 1995
moving_average <- function(bpr) {
  bpr_ions <- bpr |>
    select(Sample_Date, Sample_ID, K, `NO3-N`, Mg, Ca, `NH4-N`) |>
    filter(Sample_Date >= "1986-05-16" & Sample_Date < "1995-01-03")

  # Initialize a tibble with columns for 9-week windows, sample site, and ions
  result <- tibble(
    window_start = seq(
      ymd(bpr_ions$Sample_Date[1]),
      ymd(bpr_ions$Sample_Date[nrow(bpr_ions)]),
      by = "9 weeks"
    ),
    site = bpr$Sample_ID[1],
    K = NA,
    `NO3-N` = NA,
    Mg = NA,
    Ca = NA,
    `NH4-N` = NA
  )

  # For loop to calculate the mean concentration of each ion at for each 9-week window
  for (i in 1:nrow(result)) {
    # Creates variables for the start and end of window
    w1 <- result$window_start[i]
    w2 <- w1 + 63

    # Logical vector for sample dates within each window
    in_window <- (bpr_ions$Sample_Date >= w1 & bpr_ions$Sample_Date < w2)

    # Indexing the ion concentrations within the window
    k_window <- bpr_ions$K[in_window]
    no3n_window <- bpr_ions$`NO3-N`[in_window]
    mg_window <- bpr_ions$Mg[in_window]
    ca_window <- bpr_ions$Ca[in_window]
    nh4n_window <- bpr_ions$`NH4-N`[in_window]

    # Calculates the mean ion concentration within a 9-week window and stores it
    result$K[i] <- mean(k_window, na.rm = TRUE)
    result$`NO3-N`[i] <- mean(no3n_window, na.rm = TRUE)
    result$Mg[i] <- mean(mg_window, na.rm = TRUE)
    result$Ca[i] <- mean(ca_window, na.rm = TRUE)
    result$`NH4-N`[i] <- mean(nh4n_window, na.rm = TRUE)
  }
  return(result)
}
