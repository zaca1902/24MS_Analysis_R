plotcallfor22_23_24 <- function(fp22, fp23, fp24, width = 1200, height = 800, res = 150)
{

  #Specify Plot Size
  
  # Plots for WY2022
  png("C:/Users/zachh/OneDrive/CADSWES/24MS_Analysis_R/24MS_Analysis_R/Plot Images/WY2022_PlotCall_NoWYpt.png", width = width, height = height, res = res)
  WY_4castPlot(fp22, 2022, wypt = FALSE)
  dev.off()
  
  png("C:/Users/zachh/OneDrive/CADSWES/24MS_Analysis_R/24MS_Analysis_R/Plot Images/WY2022_PlotCall.png", width = width, height = height, res = res)
  WY_4castPlot(fp22, 2022)
  dev.off()
  
  # Plots for WY2023
  png("C:/Users/zachh/OneDrive/CADSWES/24MS_Analysis_R/24MS_Analysis_R/Plot Images/WY2023_PlotCall_NoWYpt.png", width = width, height = height, res = res)
  WY_4castPlot(fp23, 2023, wypt = FALSE)
  dev.off()
  
  png("C:/Users/zachh/OneDrive/CADSWES/24MS_Analysis_R/24MS_Analysis_R/Plot Images/WY2023_PlotCall.png", width = width, height = height, res = res)
  WY_4castPlot(fp23, 2023)
  dev.off()
  
  # Plots for WY2024
  png("C:/Users/zachh/OneDrive/CADSWES/24MS_Analysis_R/24MS_Analysis_R/Plot Images/WY2024_PlotCall_NoWYpt.png", width = width, height = height, res = res)
  WY_4castPlot(fp24, 2024, wypt = FALSE)
  dev.off()
  
  png("C:/Users/zachh/OneDrive/CADSWES/24MS_Analysis_R/24MS_Analysis_R/Plot Images/WY2024_PlotCall.png", width = width, height = height, res = res)
  WY_4castPlot(fp24, 2024)
  dev.off()
}