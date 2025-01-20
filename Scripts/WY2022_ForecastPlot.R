WY2022_ForecastPlot <- function()
{
  # Read and parse data
  filepath <- file.path("C:/Users/zaca1902.AD.001/OneDrive - UCB-O365",
    "CADSWES Research/24-MS and Historic Record",
    "24MS_Analysis_R/Data/Inf_Fcast_WY2022.csv")
  
  data = read.csv(filepath, header = TRUE, skip = 1)
  
  n = nrow(data)-3    # Creates length for Min/Max to prevent data overlap
  
  x = data$MonthsAway
  most = data$Most
  min = data$Min[1:n]
  max = data$Max[1:n]
 
  # Create Initial Plot - with Most Probable Forecast
  xlim = 24
  ylim = 20
  
  plot(x, most, type = "l", xlim = rev(range(x)), ylim = c(0, ylim), 
       col = "forestgreen", lwd = 2, lty = 2, xlab = "", ylab = "", xaxt = "n",
       yaxt = "n")
  title(main = "Water Year 2022 - Lake Powell", 
        xlab = "Months Away from EOWY 2022", 
        ylab = "Unregulated Inflow Volume (MAF)")
  
  # Add Min/Max Prob Forecast points
  points(x[1:n], min, col = "red", pch = "-", cex = 2.5)
  points(x[1:n], max, col = "blue", pch = "-", cex = 2.5)
  
  # Add actual accumulated unregulated inflow volume (maf)
  auiv = 6.084
  abline(h = auiv, col = "black", lwd = 2)
  
  # Add Legend
  legend("topright", legend = c("Maximum Probable", "Most Probable", 
                                "Minimum Probable", "Actual Value"), 
                                col= c("blue","forestgreen","red","black"), 
                                lwd = c(NA, 2, NA, 2), 
                                lty = c(NA, 2, NA, 1),
                                pch = c("-", NA, "-", NA), 
                                pt.cex = c(2.5, NA, 2.5, NA)) 
  
  # Add Axis Labels
  axis(1, at = seq(xlim, 0, by = -1), labels = seq(xlim, 0, by = -1))
  axis(2, at = seq(0, ylim, by = 2), labels = seq(0, ylim, by = 2))
  
  # Add Grid Lines - grid command malfunctioning
  # grid(nx = length(seq(24, 0, by = -2)), ny = length(seq(0, 20, by = 2)), 
  #      col = "gray")
  for (i in 1:xlim)
  {if(i %% 2 == 0){abline(v = i, col = "grey", lty = 3)}}
  for (i in 1:ylim)
  {if(i %% 2 == 0){abline(h = i, col = "grey", lty = 3)}}
  
  # 
}