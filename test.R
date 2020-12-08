# Title     : TODO
# Objective : TODO
# Created by: noctis
# Created on: 08/12/2020

library("FactoMineR")
library("factoextra")

donnee <- read.csv(file="./archive/data.csv", sep=",")
data(donnee)
head(donnee)
donnee.active <- donnee[1:23, 1:10]
#head(decathlon2.active[, 1:6], 4)
res.pca <- PCA(donnee.active, graph = TRUE)
print(res.pca)