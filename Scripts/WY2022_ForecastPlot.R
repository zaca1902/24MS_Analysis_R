WY2022_ForecastPlot <- function()
{
  # Read and parse data
  filepath <- file.path("C:/Users/zaca1902.AD.001/OneDrive - UCB-O365",
    "CADSWES Research/24-MS and Historic Record",
    "R Directory/Data/Inf_Fcast_WY2022.csv")
  
  data = read.csv(filepath, header = TRUE, skip = 1)
  
  x = data$MonthsAway
  most = data$Most
  min = data$Min
  max = data$Max
 
  # Create Plot area
   
}