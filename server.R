#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

##Preliminaries
GRL_tib <- read_csv("GRL_tib.csv", col_types = cols(group = col_factor()))

shinyServer(function(input, output) {
  output$Plot1 <- renderPlot({
    GRL_tib %>% filter(lambda2 == input$lambda2) %>% ggplot(aes(x=lambda1, y = u, group = team, colour = group)) + geom_line(alpha = 0.6) +
      labs(title = paste0("Estimated u at lambda2 = ", input$lambda2)) + coord_cartesian(ylim=c(0,3)) + scale_color_brewer(palette="Dark2")
  })
  output$Plot2 <- renderPlot({
    GRL_tib %>% filter(lambda1 == input$lambda1) %>% ggplot(aes(x=lambda2, y = u, group = team, colour = group)) + geom_line(alpha = 0.6) +
     labs(title = paste0("Estimated u at lambda1 = ", input$lambda1)) + coord_cartesian(ylim=c(0,3)) + scale_color_brewer(palette="Dark2")
  })
})
