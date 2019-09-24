#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Sepal Width and Petal Width "),
  
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderSepalLength","What is Sepal Length?", 4, 8, step = 0.1, value = 5.5),
       sliderInput("sliderPetalLength", "What is Petal Length?", 0, 7 , step = .005, value = 4),
       checkboxInput("Model1", "Show/Hide Prediction Model 1", value = TRUE),
       checkboxInput("Model2", "Show/Hide Prediction Model 2", value = TRUE )
    ),
    
    
    mainPanel(
       h3("Predicted Sepal Width "),
       plotOutput("Plot1"),
       h3("Predicted Petal Width"),
       plotOutput("Plot2"),
       h3("Predicted Sepal Width from Model 1 :"),
       textOutput("Prediction1"),
       h3("Predicted Petal Width from Model 2 :"),
       textOutput("Prediction2")
    )
  )
))
