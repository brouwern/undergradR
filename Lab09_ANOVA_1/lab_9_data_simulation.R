

n <- 10
means <- c(603,620,770)
SEs   <- c(106,121,280)
SDs   <- SEs*sqrt(5)

#SDs   <- rep(min(SDs)*0.5,3)
SDs    <- SDs*0.5
SDs    <- rep(mean(SDs),3)
mass.Hi.Hi <- rnorm(n = n,mean = means[1], sd=SDs[1])
mass.Hi.Lo  <- rnorm(n = n,mean = means[2], sd=SDs[2])
mass.Lo.Hi  <- rnorm(n = n,mean = means[3], sd=SDs[3])


cat()


df.mass <- data.frame(mass.g = c(mass.Hi.Hi,
                                 mass.Hi.Lo,
                                 mass.Lo.Hi),
                      diet = c(rep("Hi.Hi",n),
                               rep("Hi.Lo",n),
                               rep("Lo.Hi",n)))

save(df.mass, file = "simulate_antler_mass.RData")
library(sciplot)



cat(df.mass$mass,sep = ",")
print(df.mass$diet,sep = ",")






n <- 10
means <- c(98,99,103)
SEs   <- c(5,8,15)
SDs   <- SEs*sqrt(5)

#SDs   <- rep(min(SDs)*0.5,3)
#SDs    <- SDs*0.5
SDs    <- rep(mean(SDs),3)
circum.Hi.Hi <- rnorm(n = n,mean = means[1], sd=SDs[1])
circum.Hi.Lo  <- rnorm(n = n,mean = means[2], sd=SDs[2])
circum.Lo.Hi  <- rnorm(n = n,mean = means[3], sd=SDs[3])



df.circum <- data.frame(circum.mm = c(circum.Hi.Hi,
                                      circum.Hi.Lo,
                                      circum.Lo.Hi),
                        diet = c(rep("Hi.Hi",n),
                                 rep("Hi.Lo",n),
                                 rep("Lo.Hi",n)))

save(df.circum, file = "simulate_antler_circum.RData")
library(sciplot)




lineplot.CI(response = df.circum$circum.mm,
            x.factor = df.circum$diet)


cat(df.circum$circum,sep = ",")
print(df.circum$diet,sep = ",")



























### ANTLER BEAM LENGTH

n <- 10
means <- c(422,424,419)
SEs   <- c(31,27,42)
SDs   <- SEs*sqrt(5)

#SDs   <- rep(min(SDs)*0.5,3)
#SDs    <- SDs*0.5
SDs    <- rep(mean(SDs),3)
beam.Hi.Hi <- rnorm(n = n,mean = means[1], sd=SDs[1])
beam.Hi.Lo  <- rnorm(n = n,mean = means[2], sd=SDs[2])
beam.Lo.Hi  <- rnorm(n = n,mean = means[3], sd=SDs[3])



df.beam <- data.frame(beam.mm = c(beam.Hi.Hi,
                                  beam.Hi.Lo,
                                  beam.Lo.Hi),
                      diet = c(rep("Hi.Hi",n),
                               rep("Hi.Lo",n),
                               rep("Lo.Hi",n)))

save(df.beam, file = "simulate_antler_beam.RData")
library(sciplot)




lineplot.CI(response = df.beam$beam.mm,
            x.factor = df.beam$diet)


cat(df.beam$beam,sep = ",")











###  ANTLER SPREAD in CM
n <- 10
means <- c(318,380,362)
SEs   <- c(16,34,25)
SDs   <- SEs*sqrt(5)

#SDs   <- rep(min(SDs)*0.5,3)
#SDs    <- SDs*0.5
SDs    <- rep(mean(SDs),3)
spread.Hi.Hi <- rnorm(n = n,mean = means[1], sd=SDs[1])
spread.Hi.Lo  <- rnorm(n = n,mean = means[2], sd=SDs[2])
spread.Lo.Hi  <- rnorm(n = n,mean = means[3], sd=SDs[3])



df.spread <- data.frame(spread.mm = c(spread.Hi.Hi,
                                      spread.Hi.Lo,
                                      spread.Lo.Hi),
                        diet = c(rep("Hi.Hi",n),
                                 rep("Hi.Lo",n),
                                 rep("Lo.Hi",n)))

save(df.spread, file = "simulate_antler_spread.RData")
library(sciplot)




lineplot.CI(response = df.spread$spread.mm,
            x.factor = df.spread$diet)


cat(df.spread$spread,sep = ",")











n <- 10
means <- c(318,380,362)
SEs   <- c(16,34,25)
SDs   <- SEs*sqrt(5)

#SDs   <- rep(min(SDs)*0.5,3)
#SDs    <- SDs*0.5
SDs    <- rep(mean(SDs),3)
spread.Hi.Hi <- rnorm(n = n,mean = means[1], sd=SDs[1])
spread.Hi.Lo  <- rnorm(n = n,mean = means[2], sd=SDs[2])
spread.Lo.Hi  <- rnorm(n = n,mean = means[3], sd=SDs[3])



df.spread <- data.frame(spread.mm = c(spread.Hi.Hi,
                                      spread.Hi.Lo,
                                      spread.Lo.Hi),
                        diet = c(rep("Hi.Hi",n),
                                 rep("Hi.Lo",n),
                                 rep("Lo.Hi",n)))

save(df.spread, file = "simulate_antler_spread.RData")
library(sciplot)




lineplot.CI(response = df.spread$spread.mm,
            x.factor = df.spread$diet)


cat(df.spread$spread,sep = ",")























lineplot.CI(response = df.mass$mass.g,
            x.factor = df.mass$diet)

m.mass.null <- lm(mass.g ~ 1, data = df.mass)
m.mass.alt  <- lm(mass.g ~ diet, data = df.mass)

m.aov <- aov(mass.g ~ diet, data = df.mass)
m.anova <-  anova(m.aov)
m.anova$"Mean Sq"[2] #21322.94


function(m.null, m.alt){
  MS.E <- anova(m.null, m.alt)$"RSS"[2]/
          anova(m.null, m.alt)$"Res.Df"[2]
  SE.pooled <- sqrt(MS.E*(1/n.control + 1/n.knees))

}


pairwise.t.test( df.mass$mass.g,
                 df.mass$diet,
                 p.adjust.method = "none")

pairwise.t.test( df.mass$mass.g,
                 df.mass$diet,
                 pool.sd = F,
                 p.adjust.method = "none")


i.use <- which(df.mass$diet != "Hi.Hi")
i.use <- which(df.mass$diet != "Hi.Lo")

t.test(mass.g ~ diet, data = df.mass[i.use,],subset = )






plot(TukeyHSD(aov(mass.g ~ diet, data = df.mass)))

oneway.test
TukeyHSD # on aov() object





