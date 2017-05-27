#"Wed Sep 14 23:50:33 2016"

#This code creates csv files with randomly selected sets of 10 or 100 genes 
#lengths.  Gene data are presented by Whitlock and Schulter in chapter 4
#and data are from their website.
#
#I gave everyone their own gene data to cut and paste into R 
#to calcualte mean, sd etc on.


# load gene length data from Whitlock and Schulter 2nd ed
gene.length <- read.csv(file = "chap04e1HumanGeneLengths.csv")


#Remove 26 largest as per W&S 4.1, pg 97, 2nd ed
i.order <- order(gene.length$geneLength,decreasing = T)

gene.length2 <- gene.length$geneLength[i.order][-c(1:26)]




# Ten genes for each person
prefix <- "my.genes10 <- c("
suffix <- ")"


df.out <- vector()
for(i in 1:45){
  my.genes10 <- sample(gene.length2, size = 10, replace = FALSE)
  
  genes.i <- paste(my.genes10, collapse = ",")
  
  df.out[i] <- paste(prefix,genes.i,suffix)
  
}


write.csv(df.out, file = "ten_genes_for_each_person.csv")







# 100 genes for each person
prefix <- "my.genes100 <- c("
suffix <- ")"


df.out <- vector()
for(i in 1:45){
  my.genes100 <- sample(gene.length2, size = 100, replace = FALSE)
  
  genes.i <- paste(my.genes100, collapse = ",")
  
  df.out[i] <- paste(prefix,genes.i,suffix)
  
}


write.csv(df.out, file = "one_hundred_genes_for_each_person.csv")
