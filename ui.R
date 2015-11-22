library(shiny)

# ui.R

shinyUI(fluidPage(
        titlePanel("Fun with Regression"),
        
        sidebarLayout(
                sidebarPanel( 
                        helpText("In Linear Regression, the line used to fit the data is created by minimizing the distances between each point and the line. Thankfully modern-day computing does this for us, but back in the stone-age users had to just guess at the line that best fit their data! Use the sliders to fit the Regression line to the data."),
                        sliderInput("slope",
                                    label = "Change the Slope:",
                                    min = -10, max = 10, step = 0.1, value = 0)
                        
                        
                        ,sliderInput("intercept",
                                    label = "Change the Intercept:",
                                    min = 0, max = 40, step = 0.1, value = 20)
                        ,textOutput("results")
                ),
                mainPanel("The Plot", 
                          plotOutput("plot"))
        )
))