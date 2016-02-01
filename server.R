library(ggplot2)
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)
library(caret)
data(mtcars)

data <- mtcars

shinyServer(
  function(input, output) {
    
    myXY <- reactive({
      paste("mpg ~", "as.integer(", input$x,")")
    })
    
    output$head <- renderPrint({head(data, input$nHead)})
    
    output$summary <- renderPrint({
      predictor <- input$x
      if(predictor == "cyl")
        summary(mtcars$cyl)
      else if(predictor == "disp")
        summary(mtcars$disp)
      else if(predictor == "hp")
        summary(mtcars$hp)
      else if(predictor == "drat")
        summary(mtcars$drat)
      else if(predictor == "wt")
        summary(mtcars$wt)
      else if(predictor == "qsec")
        summary(mtcars$qsec)
      else if(predictor == "vs")
        summary(mtcars$vs)
      else if(predictor == "am")
        summary(mtcars$am)
      else if(predictor == "gear")
        summary(mtcars$gear)
      else if(predictor == "carb")
        summary(mtcars$carb)
      else if(predictor == "mpg")
        summary(mtcars$mpg)
      
    })
    
    
    output$newHist <- renderPlot({
      boxplot(as.formula(myXY()),data=mtcars,xlab=input$x, ylab="Mileage mpg", col = "darkgreen",
              main=paste("MPG Vs. ", toupper(input$x)))
    })
    
    
    myFit <- reactive({
      lm(as.formula(myXY()),data=data)
    })
    
    output$myPlot <- renderPlot ({
      with(mtcars, {plot(as.formula(myXY()),xlab=input$x,ylab="mpg", main=paste("MPG Vs. ", toupper(input$x)))
        abline(myFit(), col="red")
      })
    })
    
      
    
  })