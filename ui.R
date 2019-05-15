#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Estimated u of Group Ranking Lasso"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      checkboxInput("p1", "u by lambda1", TRUE),
      checkboxInput("p2", "u by lambda2", FALSE),
      sliderInput("lambda1",
                  "lambda1: ",
                  min = 0.0,
                  max = 5.0,
                  value = 0,
                  step = 0.5,
                  animate = animationOptions(interval = 1000, loop = FALSE)
                  ),
      sliderInput("lambda2",
                  "lambda2: ",
                  min = 0.0,
                  max = 0.5,
                  value = 0.00,
                  step = 0.02,
                  animate = animationOptions(interval = 1000, loop = FALSE)
      )
    ),
    # Show a plot of the generated distribution
    mainPanel(
      conditionalPanel("input.p1", plotOutput("Plot1")),
      conditionalPanel("input.p2", plotOutput("Plot2"))
    )
  )
))
