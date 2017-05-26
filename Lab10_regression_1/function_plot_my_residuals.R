
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




predictor.x <- c(2,5,4,9,12,11,14,3,10,15, 7)
response.y  <- c(2,3,5,7, 9,11,14,1, 2, 4,14)*.95

df <- data.frame(response.y, predictor.x)

par(mfrow = c(1,2))

make.scatterplot(dat = df,
                 one2one = FALSE,
                 add.legend = FALSE)

make.scatterplot(dat = df,
                 one2one = FALSE,
                 add.legend = FALSE)

plot.my.line(intercept = 3,slope = 0.5)

plot.my.residuals(intercept = 3,slope = 0.5)
