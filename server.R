library(shiny); library(caret); library(lattice); library(datasets)
library(ggplot2); library(graphics); library(grDevices); library(methods)
library(randomForest); library(stats); library(utils); library(shinyapps)

irisPrediction <- function(id1,id2,id3,id4,id5){
    data(iris)
    testing <- data.frame(id1,id2,id3,id4)
    names(testing) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
    if (length(id5)>=2){
    modelFit <- train(x=iris[,c(id5)],y=iris[,"Species"],method="rf")
    prediction <- prediction <- predict(modelFit,testing)
    return(prediction)
    } else{
        return("please provide at least two predictors")
    }
}
irisAccuracy <- function(id5){
    set.seed(821)
    inTrain <- createDataPartition(y=iris$Species,p=0.7,list=FALSE)
    training <- iris[inTrain,]
    testing <- iris[-inTrain,]
    if (length(id5)>=2){
    modelFit <- train(x=training[,c(id5)],y=training[,"Species"],method="rf")
    prediction <- predict(modelFit,testing)
    acc <- sum(prediction==testing$Species)/length(prediction)
    return(acc)
    } else{
        return("please provide at least two predictors")
    }
}
shinyServer(
    function(input, output) {
        output$oid1 <- renderPrint({input$id5})
        output$oid2 <- renderPrint({irisPrediction(input$id1,input$id2,input$id3,input$id4,input$id5)})
        output$oid3 <- renderPrint({irisAccuracy(input$id5)})
    }
)