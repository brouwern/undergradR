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




predictor.x <- c(2,5,4,9,12,11,14)
response.y <- c(2,3,5,7,9,11,14)*.95

df <- data.frame(response.y, predictor.x)

make.scatterplot(dat = df,
                 one2one = FALSE,
                 add.legend = FALSE)

plot.my.line(intercept = 0.1,slope = 0.75)
