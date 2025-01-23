histrecplots <- function(newrec_file, oldrec_file)
{
  # Read data from files
  new = read.csv(newrec_file, header = TRUE, skip = 2)
  old = read.csv(oldrec_file, header = TRUE, skip = 2)
  
  # Parse data set
  new_med = new$Med
  new_25 = new$Min25
  new_75 = new$Max75
  
  old_med = old$Med
  old_25 = old$Min25
  old_75 = old$Max75
  
  
}