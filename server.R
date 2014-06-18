data(iris)
library(shiny)
library(randomForest)
shinyServer(function(input, output){
    
    irisDataInput <- reactive({
        head(iris,as.numeric(input$noOfObs))
    })
    
    output$irisData <- renderDataTable({
        irisDataInput()
        })
    
    kmeansResult <- reactive({
        n <- input$noOfClusters
        kmeansOutput <- kmeans(iris[,-5], n)
        list(kmeansOutput$cluster,kmeansOutput$centers,kmeansOutput)
    })
    
    plotInput <- reactive({
        colSpecie <- kmeansResult()[[1]]
        centerSpecie <- kmeansResult()[[2]]
        nClust <- as.numeric(input$noOfClusters)
        column1 <- as.character(input$xVar)
        column2 <- as.character(input$yVar)
        plot(iris[c(column1, column2)], col = colSpecie)
        points(centerSpecie[,c(column1, column2)], col = 1:nClust,
               pch = 8, cex=2)
    })
    
    output$clustPlot <- renderPlot({
        plotInput()
    })
    
    output$summResult <- renderPrint({
        if(input$showSummary){
            kmeansResult()[[3]]
        }
    })
    
    rfModel <- reactive({
        rf <- randomForest(Species ~ ., data=iris, ntree=100, proximity=TRUE)
        rf
    })
    
    rfInput <- reactive({
        if(input$submitInput >= 0)
            return(isolate({
        inputData <- data.frame(input$Sepal.Length, input$Sepal.Width, input$Petal.Length, input$Petal.Width)
        names(inputData) <- names(iris)[-5]
        rf <- rfModel()
        predict(rf,inputData)
            }))
    })
    
    output$summRFResult <- renderPrint({
        list("Model Call and Summary" = rfModel(),
            "Your Prediction is given below" = rfInput()
            )
    })
    
})