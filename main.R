# Title     : Fouille massive de données : FIFA 19
# Objective : TODO
# Created by: noctis
# Created on: 24/11/2020

library("FactoMineR")
library("ggplot2")
library("factoextra")
library("gplots")
library("dplyr")
library("tidyr")

dataset <- read.csv(file="./archive/data.csv", sep=";")
x <- dataset[1:100,c(3,5,7,11,12,13)]
acp_fonction <- function(x) {
  pca = PCA(x,scale.unit = TRUE, ncp=5,graph=TRUE)
  pca
}

acp_fonction(x)
#fviz_contrib(acp1, choice = "var", axes = 1, top = 10)

dataset2 <- dataset[1:100,c(8,9)]
head(dataset2)
y <- table(dataset[,8],dataset[,9])
chi_test <- chisq.test(y)
print(y)
chi_test
# 1. convertir les données en tant que table
# <- as.table(as.matrix (y))
# 2. Graphique
balloonplot(t (y), main = "Distributions des postes occupés et les pieds favoris des joueurs", xlab = "", ylab = "",
            label = TRUE, show.margins = FALSE)
res.ca <- CA (dataset, ncp = 5, graph = TRUE)
print(res.ca)
fviz_screeplot (res.ca, addlabels = TRUE)

data <- dataset[1:100,c(1:13)] %>% group_by(`Nationality`) %>% summarise(
  ID=mean(`ID`),
  Age=mean(`Age`),
  Overall=mean(`Overall`),
  Club=mean(`Club`),
  Value=mean(`Value`),
  Position=mean(`Position`)
)

position_type <- function(Position) {
  case_when(
    #Defender
    Position == "SW" | Positon == "RWB" | Positon == "LWB" |
    Positon == "RB" | Positon == "LB" | Positon == "CB" ~ 
      "Defender"
    #Midfielder
    Positon == "DM" | Positon == "LM" | Positon == "RM" |
    Positon == "RW" | Positon == "LW" | Positon == "AM" ~ 
      "Midfielder"
    #Striker
    Positon == "CF" | Positon == "RF" | Positon == "RL" |
    Positon == "ST" ~ 
      "Forward"
    
    TRUE                      ~ "other"
  )
}

dataACM <- data[,c(1:6,9)] %>% 
  mutate( Position <- position_type(Position))
dataACM
