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


# 1. convertir les données en tant que table
dt <- as.table(as.matrix (x))
# 2. Graphique
mosaic-plot(t (dt), main = "dataset", xlab = "", ylab = "",
            label = FALSE, show.margins = FALSE)
