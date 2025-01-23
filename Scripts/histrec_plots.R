histrecplots <- function(newrec_file, oldrec_file)
{
  # Read data from files
  new = read.csv(newrec_file, header = TRUE, skip = 2)
  old = read.csv(oldrec_file, header = TRUE, skip = 2)

  # Parse data set and convert to MAF from KAF
  new_med = new$Med[1:12]/1000
  new_25 = new$Min25[1:12]/1000
  new_75 = new$Max75[1:12]/1000
  new_tot_med = new$Med[13]/1000
  new_tot_25 = new$Min25[13]/1000
  new_tot_75 = new$Max75[13]/1000
  
  old_med = old$Med[1:12]/1000
  old_25 = old$Min25[1:12]/1000
  old_75 = old$Max75[1:12]/1000
  old_tot_med = old$Med[13]/1000
  old_tot_25 = old$Min25[13]/1000
  old_tot_75 = old$Max75[13]/1000
  
  # Data binds for plotting commands
  oldvals = rbind(old_25, old_med, old_75)
  newvals = rbind(new_25, new_med, new_75)
  
  oldtot = rbind(old_tot_25, old_tot_med, old_tot_75)
  newtot = rbind(new_tot_25, new_tot_med, new_tot_75)
  
  totvals = rbind(oldtot, newtot)
  
  # Old Record Bar Chart
  barplot(oldvals, beside = TRUE, names.arg = month.abb, 
          col = NA, ylim = c(0,4),
          main = "1981-2010 Monthly Unregulated Inflow to Lake Powell",
          xlab = "", ylab = "Unregulated Inflow Volume (MAF)")
  
  abline(h = 0, col = "black")
  abline(h = seq(0.5, 4, by = 0.5), col = "lightgray")
  
  barplot(oldvals, beside = TRUE, names.arg = month.abb, 
          col = c("blue", "forestgreen", "red"),
          legend.text = c("25th %-ile", "Median", "75th %-ile"), add = TRUE)
  
  # New Record Bar Chart
  barplot(newvals, beside = TRUE, names.arg = month.abb, 
          col = NA, ylim = c(0,4),
          main = "1991-2020 Monthly Unregulated Inflow to Lake Powell",
          xlab = "", ylab = "Unregulated Inflow Volume (MAF)")
  
  abline(h = 0, col = "black")
  abline(h = seq(0.5, 4, by = 0.5), col = "lightgray")
  
  barplot(newvals, beside = TRUE, names.arg = month.abb, 
          col = c("blue", "forestgreen", "red"),
          legend.text = c("25th %-ile", "Median", "75th %-ile"), add = TRUE)
  
  # Total Comparison Bar Chart
  barplot(totvals, beside = TRUE, names.arg = NA, 
          col = NA, ylim = c(0,18), width = c(0.5,0.5,0.5), 
          space = c(0.2,0.2,0.2, 1,0.2,0.2),
          main = "Comparison of Records for Total Unregulated Inflow Volume",
          xlab = "", ylab = "Unregulated Inflow Volume (MAF)")
  
  abline(h = 0, col = "black")
  abline(h = seq(1, 18, by = 1), col = "lightgray")
  
  compnames = c(NA, "Old Record", NA, NA, "New Record", NA)
  barplot(totvals, beside = TRUE, names.arg = compnames,
          col = c("blue", "forestgreen", "red"), width = c(0.5,0.5,0.5), 
          space = c(0.2,0.2,0.2, 1,0.2,0.2),
          legend.text = c("25th %-ile", "Median", "75th %-ile"), add = TRUE)
  
  barpos <- barplot(totvals, beside = TRUE, names.arg = compnames,
                    col = c("blue", "forestgreen", "red"), 
                    width = c(0.5,0.5,0.5), 
                    space = c(0.2,0.2,0.2, 1,0.2,0.2),
                    legend.text = c("25th %-ile", "Median", "75th %-ile"), 
                    add = TRUE)
  
  text(x = barpos, y = totvals+0.6, labels = totvals, col = "black")
}