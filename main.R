# Title     : Fouille massive de données : FIFA 19
# Objective : TODO
# Created by: noctis
# Created on: 24/11/2020

library("FactoMineR")
library("ggplot2")
library("factoextra")
library("gplots")

dataset <- read.csv(file="./archive/data.csv", sep=";")
x <- dataset[1:100,c(3,5,7,11,12,13)]
acp_fonction <- function(x) {
  pca = PCA(x,scale.unit = TRUE, ncp=5,graph=TRUE)
  pca
}

acp_fonction(x)
#fviz_contrib(acp1, choice = "var", axes = 1, top = 10)

dataset2 <- dataset[1:100,c(9,10)]
head(dataset2)
y <- table(dataset[,9],dataset[,10])
print(y)
# 1. convertir les données en tant que table
# <- as.table(as.matrix (y))
# 2. Graphique
balloonplot(t (y), main = "Poste et origine", xlab = "", ylab = "",
            label = TRUE, show.margins = FALSE)
