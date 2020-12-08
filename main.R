# Title     : Fouille massive de données : FIFA 19
# Objective : TODO
# Created by: noctis
# Created on: 24/11/2020

library("FactoMineR")
library("factoextra")

dataset <- read.csv(file="./archive/data.csv", sep=",")
x <- dataset[1:150,c(5,6,7,8,9,10,11,12)]
acp1 = PCA(x,scale.unit = TRUE, ncp=5,graph=TRUE)
acp1
#fviz_contrib(res.pca, choice = "var", axes = 1, top = 10)
