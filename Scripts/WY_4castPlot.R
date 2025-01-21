WY_4castPlot <- function(filepath, yr, resname)
{
  # The following code creates a plot of "hind casts" from the 24 Month Study
  # for the accumulated unregulated inflow volume (AUIV) at the end of a water 
  # year for a given reservoir.The format for these plots is derived from
  # Figure 5 of White Paper #7 from the CCRS 
  # (https://qcnr.usu.edu/coloradoriver/files/news/White-Paper-7.pdf).
  
  # Inputs:
  #   filepath: the file path that contains the 24 months of 24-MS data
  #         for projecting the AUIV at the end of the water year of interest.
  #         Data column headers must match the parse section below.
  #   yr: the year of interest for the projections
  #   resname: the reservoir name of interest
  
  # Outputs: Plot of the "hind casts"
  
  # Created by: Zachary Carpenter
  # Created on: 1/21/2025
  
  # CODE: 
  # Read and Parse data
  data = read.csv(filepath, header = TRUE, skip = 1)
  
  n = nrow(data)-4    # Creates length for Min/Max to prevent data overlap
  
  x = data$MonthsAway[1:24]
  most = data$Most[1:24]
  min = data$Min[1:n]
  max = data$Max[1:n]
  auiv = data$Most[length(data$Most)]

  # Create Initial Plot Area
  xlim = 24
  ylim = 20
  
  plot(x, most, type = "n", xlim = rev(c(0,xlim)), ylim = c(0, ylim), xlab = "", 
       ylab = "", xaxt = "n", yaxt = "n", yaxs = "i")
  title(main = paste("Water Year", yr, "- Lake", resname), 
        xlab = "", ylab = "Unregulated Inflow Volume (MAF)")
  
  # Add Grid Lines - grid command malfunctioning
  # grid(nx = length(seq(24, 0, by = -2)), ny = length(seq(0, 20, by = 2)), 
  #      col = "gray")
  for (i in 0:xlim)
  {if(i %% 2 == 0){abline(v = i, col = "grey", lty = 3)}}
  for (i in 1:ylim)
  {if(i %% 2 == 0){abline(h = i, col = "grey", lty = 3)}}
  
  # Add actual accumulated unregulated inflow volume (maf)
  abline(h = auiv, col = "black", lwd = 2)
  
  # Add Most Prob Forecast line
  lines(x, most, lwd = 2, lty = 2, col = "forestgreen")
  
  # Add Min/Max Prob Forecast points
  points(x[1:n], min, col = "red", pch = "-", cex = 2.5)
  points(x[1:n], max, col = "blue", pch = "-", cex = 2.5)
  
  # Add Legend
  legend("topright", legend = c("Maximum Probable", "Most Probable", 
                                "Minimum Probable", "Actual Value"), 
         col= c("blue","forestgreen","red","black"), 
         lwd = c(NA, 2, NA, 2), 
         lty = c(NA, 2, NA, 1),
         pch = c("-", NA, "-", NA), 
         pt.cex = c(2.5, NA, 2.5, NA)) 
  
  # Add Axis Labels (Numerical)
  axis(1, at = seq(xlim, 0, by = -1), labels = seq(xlim, 0, by = -1))
  axis(2, at = seq(0, ylim, by = 2), labels = seq(0, ylim, by = 2))
  
  # Add Axis Labels (Months on X-Axis)
  monthlab = c(month.abb[10:12], month.abb, month.abb[1:10])
  axis(1, at = seq(xlim, 0, by = -1), labels = monthlab, line = 0.8, tick = FALSE)
  
  # Add Axis Lables (Years on X-Axis)
  yearlab = c(yr, yr-1)
  axis(1, at = c(21, 9), labels = yearlab, line = 1.6, tick = FALSE)
}