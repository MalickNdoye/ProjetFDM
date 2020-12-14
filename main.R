# Title     : Fouille massive de données : FIFA 19
# Objective : TODO
# Created by: noctis
# Created on: 24/11/2020

library("FactoMineR")
library("factoextra")

dataset <- read.csv(file="./archive/data.csv", sep=";")
x <- dataset[1:200,c(1,3,5,7,11,12,13)]
pca = PCA(x,scale.unit = TRUE, ncp=5,graph=TRUE)
pca
#print(res.pca)
#fviz_contrib(acp1, choice = "var", axes = 1, top = 10)
