# Presentado por: Carlos Castilla y Sebastian Velasco

# Importo las librerias necesarias para este ejercicio
library(ggplot2)
library(lattice)
library(caret)
library(e1071)
library(knitr)

# agrego los datasets
train <- read.csv("train.csv")
test <- read.csv("test.csv")

# para ver lo que tiene adentro el dataset (solo para revisar, no es necesario en el codigo)
str(train)

# plot y cantidades para saber cuantos murieron y cuantos sobrevivieron
# 0 es murio y 1 es sobrevivio
ggplot(train, aes(as.factor(Survived), fill = as.factor(Survived))) + geom_bar() +
  labs(title = "Cantidad de sobrevivientes en el titanic", x = "Muere o Vive", y = "# de Personas",
       fill = "0 Muere, 1 Vive")

# Base line
# Se crea una columna donde pondremos la prediccion (en este caso, todos mueren)
train$Prediction <- 0

# Ahora sacamos la confusion matrix de el dataset de training y miramos cual es la accuracy
confusionMatrix(train$Prediction, train$Survived)

# ahora tenemos que ver la distribucion por sexo de personas sobrevivientes.
ggplot(train, aes(Sex, fill = Survived)) + geom_bar() + 
  labs(title = "distribucion por sexo de personas sobrevivientes.", 
       x = "Sexo" , y = "# de personas")

# Sobrevivientes distribucion de vive o muere dependiendo del sexo
ggplot(train, aes(as.factor(Survived), fill = as.factor(Survived))) + 
  geom_bar() + facet_grid(. ~ Sex) + labs(title = "Sobrevivientes distribucion dependiendo del sexo", 
                                          x = "Sobrevivientes por sexo", y = "# de personas", 
                                          fill = "Muere o vive")

# y ahora vemos los porcentajes de personas de los dos sexos respecto a cuantos sobrevivieron
prop.table(table(train$Sex, train$Survived))

