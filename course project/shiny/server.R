library(shiny)
library(ISLR);
library(caret);
set.seed(333)
data(Wage); Wage <- subset(Wage,select=-c(logwage))

inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7, list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
modFit<- train(wage ~ age + jobclass + education + health,
               method = "lm",data=training)
finMod <- modFit$finalModel

shinyServer(
  function(input, output) {
    output$age <- renderText({ paste("Age: ", input$age) })
    output$education <- renderText({ paste("Education: ", input$education) })
    output$jobclass <- renderText({ paste("Jobclass: ", input$jobclass) })
    output$health <- renderText({ paste("Health: ", input$health) })
    Data = eventReactive(input$submit,{
      if (input$submit > 0) {
        df <- data.frame(age=input$age, education=input$education, jobclass=input$jobclass, health=input$health)
        return(list(df=df))
      }
      
      
    })
    
    output$prediction <- renderPrint({
      if (is.null(Data())) {return()}
      prediction <- predict(modFit,Data()$df)
      round(prediction) 
  })
    
  }

)