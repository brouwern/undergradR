# Function plot2means() by Nathan L. Brouwer
# This function takes 2 means values and
# 2 standard error values and makes
# a plot wiht means and error bars
#
# It accepts arguements also for the labels 
# of the categories (categories = )
# the x axis label (x.axis.label = ).
# and the y axis label (y.axis.label = )
# the x and y axis label arguements are used instead
# of R's standard xlab and ylab

# means = 2 mean values calcualted from raw data
# se = 2 standard error
# categories = 2 categorical / factors that group the data
# x.axis.label = what should be plotted on the x axis
# y.axis.label = what should be plotted on the y axis


#### The function STARTS here ####
plot2means <- function(means,
                       se,
                       groups = 2,
                       categories = c("Group 1","Group 2"),
                       x.axis.label = "x axis",
                       y.axis.label = "y axis",
                       axis.adjust = 0){
  
  # reset plot window
  par(mfrow = c(1,1), 
      mar = c(3.5,3,2,1))
  
  # calculate values for plotting limits                 
  y.max <- max(means+2*se) +                    
    max(means+2*se)*axis.adjust
  y.min <- min(means-2*se) - 
    max(means+2*se)*axis.adjust
  
  if(groups == 2){ x.values <- c(0.25, 0.5)}
  
  
  
  #Plot means
  plot(means ~ x.values,
       xlim = c(0.2,0.55),
       ylim = c(y.min,y.max),
       xaxt = "n",
       xlab = "",
       ylab = "",
       cex = 1.25,
       pch = 16)
  
  axis(side = 1, 
       at = x.values,
       labels = categories,
  )
  
  #Plot upper error bar 
  lwd. <- 2
  arrows(y0 = means,
         x0 = x.values,
         y1 = means+2*se,
         x1 = x.values,
         length = 0,
         lwd = lwd.)
  
  #Plot lower error bar
  arrows(y0 = means,
         x0 = x.values,
         y1 = means-2*se,
         x1 = x.values,
         length = 0,
         lwd = lwd.) 
  
  mtext(text = x.axis.label,side = 1,line = 1.75)
  mtext(text = y.axis.label,side = 2,line = 1.95)
  mtext(text = "Error bars = 95% CI",side = 3,line = 0,adj = 0)
  
}

#### The function ENDS here ####