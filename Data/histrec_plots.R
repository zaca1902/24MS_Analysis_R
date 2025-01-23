histrecplots <- function(newrec_file, oldrec_file)
{
  # Read data from files
  new = read.csv(newrec_file, header = TRUE, skip = 2)
  old = read.csv(oldrec_file, header = TRUE, skip = 2)
  
  # Parse data set
  month = new$month
  new_med = new$Med[2:13]
  new_25 = new$Min25[2:13]
  new_75 = new$Max75[2:13]
  
  old_med = old$Med[2:13]
  old_25 = old$Min25[2:13]
  old_75 = old$Max75[2:13]
  
  # Old Record Bar Chart
  
  # New Record Bar Chart
  
  # Median Comparison Bar Chart
  
  # 25th %-ile Comparison Bar Chart
  
  # 75th %-ile Comparison Bar Chart
}