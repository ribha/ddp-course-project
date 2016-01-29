library(shiny)
library(shinythemes)

fluidPage(theme = shinytheme("spacelab"),
        pageWithSidebar(
  headerPanel("Wage Prediction using Multiple Linear Regression"),
  sidebarPanel(
    numericInput(inputId="age", label=h3("Enter Age (years)"), value=35, min=18, max=90, step=1),
    selectInput("jobclass", label = h3("Select Job Class"), 
                choices = list("Industrial" = "1. Industrial", "Information" = "2. Information"),
                selected = "1. Industrial"),
    selectInput("education", label = h3("Select Education"), 
                choices = list("< HS Grad" = "1. < HS Grad", "HS Grad" = "2. HS Grad",
                              "Some College" = "3. Some College", "College Grad" = "4. College Grad"
                              , "Advanced Degree" = "5. Advanced Degree"),
                selected = "4. College Grad"),
    selectInput("health", label = h3("Select Health Level"), 
                choices = list("<=Good" = "1. <=Good", ">=Very Good" = "2. >=Very Good"),
                selected = "2. >=Very Good")
  ),
  mainPanel(
      p(h4('About the application')),
      p('Welcome to the wage prediction application built for the course "Developing Data Product" on Coursera.
        This application uses the Wage dataset from ISLR R package. 
        The data set contains wage and other data for a group of', strong('3000 male workers in the Mid-Atlantic region'),'from 2003-2009.
        This applications fits a linear regression model on this data to predict wage given 4 input variables.
        These input variables are age, education, jobclass and health.')
        ,
      p('So get started! The selected values section below will refresh as soon as you change the input parameters on the left.
        Click on the "Predict my wage!" button to see the predicted wage for your new input selection. 
        '),
      p(h4('Selected Values')),
      textOutput('age'),
      textOutput('education'),
      textOutput('jobclass'),
      textOutput('health'),
      br(),
      p(h4('Predicted Wage Value')),
      actionButton("submit", "Predict my wage!"),
      textOutput('prediction')
  )
))