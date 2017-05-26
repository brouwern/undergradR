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