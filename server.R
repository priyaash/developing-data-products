#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
  model1<- lm( Sepal.Width ~ Sepal.Length, data = iris)
  model2<- lm( Petal.Width ~ Petal.Length, data = iris)
  
  model1pred<- reactive({
    Sepal.LengthInput<- input$sliderSepalLength
    predict(model1, newdata = data.frame(Sepal.Length = Sepal.LengthInput))
  })
  
  model2pred<- reactive({
    Petal.LengthInput<- input$sliderPetalLength
    predict(model2, newdata = data.frame(Petal.Length = Petal.LengthInput))
  })
   
  output$Plot1 <- renderPlot({
    
   Sepal.LengthInput<- input$sliderSepalLength
   
   plot(iris$Sepal.Length, iris$Sepal.Width, xlab = "Sepal Length", 
        ylab = "Seapl Width", bty = "n",pch = 16, xlim = c(3, 8), ylim = c(2, 5))
   if(input$Model1){
     abline(model1, col = "red", lwd = 2)
   }
   
          
   points(Sepal.LengthInput, model1pred(), col = "black", pch = 16, cex = 2)
  })
  
  output$Prediction1<- renderText({
    model1pred()
  })
  
  output$Plot2<- renderPlot({
    Petal.LengthInput<- input$sliderPetalLength
    plot(iris$Petal.Length, iris$Petal.Width, xlab = "Petal Length",
         ylab = "Petal Width", pch = 16, xlim = c(0,8), ylim = c(0,4))
    if(input$Model2){
      abline(model2, col = "blue", lwd = 2)
    }
    points(Petal.LengthInput, model2pred(), col = "black", pch = 16, cex = 2)
  })
  
 
  
  output$Prediction2<- renderText({
    model2pred()
  })
})
