library(shiny)
require(ggplot2)

data(mtcars)

cars.data <- mtcars

lm.fit <- lm(mpg ~ wt, data = cars.data)

true.intercept <- round(lm.fit$coefficients[1],1)
true.slope <- round(lm.fit$coefficients[2],1)

shinyServer(
        function(input, output) {
                
                g <- ggplot(data = cars.data, aes(x = wt, y = mpg))
                g <- g + geom_point() + geom_abline(intercept = 37.3, slope = -5.3, color = "grey", size = 1)
                
              output$plot <- renderPlot({
                      g <- g + geom_abline(slope = as.numeric(input$slope), intercept = as.numeric(input$intercept), color = "steelblue", size = 1.5)
                      g
              })
              
              output$results <- renderText({
                      if (input$slope == true.slope & input$intercept == true.intercept) {
                              print("Great job! You found the optimal line!")
                      } else {
                              print("Keep trying...")
                      }
              })
              
              
                
        }
)