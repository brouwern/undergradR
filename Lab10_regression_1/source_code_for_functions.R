
predictor.x <- c(2,5,4,9,12,11,14)
response.y <- c(2,3,5,7,9,11,14)*1.5

df <- data.frame(response.y, predictor.x)



calculate.residuals <- function(intercept, 
                                slope,
                                predictor.x = "predictor.x",
                                response.y = "response.y",
                                dat = df){
  predict.y <- function(dat,predictor.x,
                        intercept,slope){
    intercept + slope*dat[,predictor.x]}
  
  y.hat <- predict.y(dat,
                     predictor.x,
                     intercept, slope)
  
  e.round <- round(dat[,response.y]-y.hat,1)
  
  out <- list('residuals (aka errors)' = e.round,
              'sum of residuals' = sum(e.round),
              'sum of residuals' = sum(e.round^2))
  
  return(out)
  
}





plot.my.residuals <- function(intercept, 
                              slope,
                              predictor.x = "predictor.x",
                              response.y = "response.y",
                              dat = df){
  
  predict.y <- function(dat,
                        predictor.x,
                        intercept,
                        slope){
    intercept + slope*dat[,predictor.x]}
  
  y.hat <- predict.y(dat,
                     predictor.x,
                     intercept, slope)
  
  segments(x0 = dat[,predictor.x], 
           x1 =dat[,predictor.x],
           y0 = dat[,response.y], 
           y1 = y.hat)
}




# Function to plot line on scatterplot
# from defined intercept and slope
plot.my.line <- function(intercept = 0,
                         slope=0,
                         dat = df,
                         predictor.x = "predictor.x",
                         response.y = "predictor.x"
){
  
  #Set min and max
  ylim. <- c(0,max(c(dat[,"predictor.x"],
                     dat[, "response.y"]))+3)
  xlim. <-  ylim. <- round(ylim.)
  
  ylim.[1] <- -2.75
  
  
  #function defning line
  predict.y <- function(x){intercept + slope*x}
  
  #plot line
  curve(expr = predict.y,
        from = xlim.[1],to = xlim.[2], add = T)
  
  if(intercept == 0 & slope == 0){
    print("You did not change the intercept & slope")
  }
  
}






make.scatterplot <- function(dat = df,
                             predictor.x = "predictor.x",
                             response.y = "response.y",
                             one2one = TRUE,
                             add.legend = TRUE){
  
  #Set min and max
  ylim. <- c(0,max(c(dat[,predictor.x],
                     dat[, response.y]))+3)
  xlim. <-  ylim. <- round(ylim.)
  
  ylim.[1] <- -2.75
  
  #plot data
  plot(dat[, response.y] ~ dat[,predictor.x],
       xlim = xlim., 
       ylim = ylim.,
       pch = 18, cex = 1,bty = "n",axes=FALSE,
       xlab = "",ylab = "")
  
  #remove axes
  axis(side = 1, line = NA, col = "white")
  axis(side = 2, line = NA, col = "white")
  
  #add Grid lines
  abline(h = xlim.[1]:xlim.[2], col = "lightgrey")
  abline(v = ylim.[1]:ylim.[2], col = "lightgrey")
  
  #add x and y axes manually
  abline(v = 0)
  abline(h = 0)
  
  #add points over grid lines
  points(dat[, response.y] ~ dat[, predictor.x],
         xlim = xlim., 
         ylim = ylim.,
         pch = 18, 
         cex = 1.25,
         xlab = "",
         ylab = "")
  
  # re-label axes
  mtext(text = "predictor.x", side = 1,2, cex = 1.25)
  mtext(text = "response.y", side = 2,2, cex = 1.25)
  
  #x axis rugplot
  segments(x0 = dat[, predictor.x],
           x1 = dat[, predictor.x],
           y0 = 0,
           y1 = 1/2)
  
  #y axis rugplot
  segments(y0 = dat[, response.y], 
           y1 = dat[, response.y],
           x0 = 0,
           x1 = 1/2)
  
  #add 1:1 line
  if(one2one == TRUE){
    # 1:1 line
    abline(a = 0, b = 1, col = 2, lty = 2)
  }
  
  
  # Add legend
  if(add.legend == TRUE){
    legend("topleft",
           legend = "Line w/ slope = 1",
           col = c(2),
           lty = c(2),
           cex = 0.75)
  }
}



