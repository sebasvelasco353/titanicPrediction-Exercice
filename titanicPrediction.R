# Presentado por: Carlos Castilla y Sebastian Velasco

# Importo las librerias necesarias para este ejercicio
library(caret)

# agrego los datasets
train <- read.csv("train.csv")
test <- read.csv("test.csv")

# para ver lo que tiene adentro el dataset (solo para revisar, no es necesario en el codigo)
str(train)


#Quitamos las filas con los na
train <- na.omit(train)
#Quitamos las filas con los na
test <- na.omit(test)


#Pa ver cuantos sobrevivieron en total
table(train[,"Survived"])

#para que sepa que es un categorico no un numero
train$Survived <- as.character(train$Survived)

#Para hacer el training con random Forest
trainingDs_RandomForest <- train(train[, c("Pclass", "Sex", "Age", "SibSp", "Parch", "Fare")], 
                                 train[,"Survived"], method="rf")

#Aqui ya esta lo que predice
predicted <- predict(trainingDs_RandomForest, 
                     newdata = test[, c("Pclass", "Sex", "Age", "SibSp", "Parch", "Fare")])

#to see the results
str(predicted)

#creo el csv pa mandarlo
resultados <- data.frame(PassengerId = test$PassengerId, Survived = predicted)
write.csv(resultados, file = "finished_prediction.csv", row.names = FALSE)
