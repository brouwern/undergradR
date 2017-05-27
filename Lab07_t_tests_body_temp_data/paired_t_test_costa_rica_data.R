setwd("~/1_R/AVIARY/2_COSTA_RICA_monitoring_project/C_RICA_FINAL_FILES")

pc <- read.csv("COSTA_RICA_point_counts_NEW_VERSION_October2016.csv")


library(reshape2)


pc.by.month <-dcast(data = pc,
                    formula = spp ~ month,
                    value.var = "count",
                    fun.aggregate = sum)



i.both <- which(pc.by.month$aug > 0 & pc.by.month$jan > 0)

pc.by.month2 <- pc.by.month[i.both, ]

t.test(log(pc.by.month2$aug), log(pc.by.month2$jan), paired = T)
