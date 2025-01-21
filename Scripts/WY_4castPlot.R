WY_4castPlot <- function(data, yr, resname, auiv)
{
  # The following code creates a plot of "hind casts" from the 24 Month Study
  # for the accumulated unregulated inflow volume (AUIV) at the end of a water 
  # year for a given reservoir.The format for these plots is derived from
  # Figure 5 of White Paper #7 from the CCRS 
  # (https://qcnr.usu.edu/coloradoriver/files/news/White-Paper-7.pdf).
  
  # Inputs:
  #   data: the file path/data file that contains the 24 months of 24-MS data
  #         for projecting the AUIV at the end of the water year of interest.
  #   yr: the year of interest for the projections
  #   resname: the reservoir name of interest
  #   auiv: the actual value for the AUIV at the end of the WY of interest
  
  # Outputs: Plot of the "hind casts"
  
  # Created by: Zachary Carpenter
  # Created on: 1/21/2025
  
  n = nrow(data)-3    # Creates length for Min/Max to prevent data overlap
  
  x = data$MonthsAway
  most = data$Most
  min = data$Min[1:n]
  max = data$Max[1:n]
  
  # Create Initial Plot Area
  xlim = 24
  ylim = 20
  
  plot(x, most, type = "n", xlim = rev(c(0,xlim)), ylim = c(0, ylim), xlab = "", 
       ylab = "", xaxt = "n", yaxt = "n", yaxs = "i")
  title(main = paste("Water Year ", yr, "- Lake ", resname), 
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
}