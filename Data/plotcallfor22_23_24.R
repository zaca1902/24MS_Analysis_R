plotcallfor22_23_24 <- function(fp22, fp23, fp24)
{
  source("WY_4castPlot.R")

  # Plots for WY2022
  WY_4castPlot(fp22, 2022, wypt = FALSE)
  WY_4castPlot(fp22, 2022)
  
  # Plots for WY2023
  WY_4castPlot(fp23, 2023, wypt = FALSE)
  WY_4castPlot(fp23, 2023)
  
  # Plots for WY2024
  WY_4castPlot(fp24, 2024, wypt = FALSE)
  WY_4castPlot(fp24, 2024)
  
}