

data(iris)

head(iris)


plot(Sepal.Length ~ Sepal.Width, data = iris)
scatter.smooth(iris$Sepal.Width, iris$Sepal.Length)
iris.lm <- lm(Sepal.Length ~ Sepal.Width, data = iris)

summary(iris.lm)
coef(iris.lm)

#intercept significant, slope not

plot(Sepal.Length ~ Sepal.Width, data = iris)
abline(iris.lm, col = 2)


#look at normality of residuals
resids <- resid(iris.lm)
hist(resids)

#diagnostics
plot(iris.lm)






plot(Petal.Length ~ Petal.Width, data = iris)
scatter.smooth(iris$Petal.Width, iris$Petal.Length)
iris.lm2 <- lm(Petal.Length ~ Petal.Width, data = iris)

summary(iris.lm2)
coef(iris.lm2)

#intercept and slope sig


plot(Petal.Length ~ Petal.Width, data = iris)
abline(iris.lm2, col = 2)

#look at normality of residuals
resids <- resid(iris.lm2)
hist(resids)


#diagnostics
plot(iris.lm)



