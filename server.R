#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

n = 10000

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    r <- 1-(input$ratio+1)/2
    
    b1 <- sqrt(input$varA)/2 + input$meanA
    a1 <- 2*input$meanA - b1
    DistrA <- switch(input$DistributionA, "Gaussian Normal" = rnorm(round(r*n), input$meanA, input$varA), "Exponential" = rexp(round(r*n), max(0.1,1/input$meanA)), "Uniform" = runif(round(r*n),a1,b1))

    b2 <- sqrt(input$varB)/2 + input$meanB
    a2 <- 2*input$meanB - b2
    DistrB <- switch(input$DistributionB, "Gaussian Normal" = rnorm(n-round(r*n), input$meanB, input$varB), "Exponential" = rexp(n-round(r*n), max(0.1,1/input$meanB)), "Uniform" = runif(n-round(r*n),a2,b2))
    
    dat1 <<- data.frame(dens = c(DistrA, DistrB), Distributions = c(rep("a", round(r*n)),rep("b", n-round(r*n))))
    dat2 <<- data.frame(dens = dat1[,1], Distributions = rep("a + b", 2*n))
    dat <<- rbind(dat1,dat2)
    ggplot(dat, aes(x = dens, fill = Distributions)) + geom_density(alpha=0.5) + facet_grid(Distributions ~ .)+ xlab("Values")
  })
  #output$mean <- reactive(mean(dat2[,1]))
})
