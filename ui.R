

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Pooling Propability Distributions"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        selectInput("DistributionA", 
                label = "Choose first propability distribution",
                choices = c("Gaussian Normal", "Exponential", "Uniform"), selected = "Gaussian Normal"),
        sliderInput("meanA", "Mean of distribution A:", min = -10, max = 10, value = 0),
        sliderInput("varA", "Variance of distribution A:", min = 1, max = 10, value = 1),
        
        sliderInput("ratio", "Balance between distributions", min = -1, max = 1, value = 0, step = 0.1),
        
        selectInput("DistributionB", 
               label = "Choose second propability distribution",
               choices = c("Gaussian Normal", "Exponential", "Uniform"), selected = "Gaussian Normal"),
        sliderInput("meanB", "Mean of distribution B:", min = -10, max = 10, value = 0),
        sliderInput("varB", "Variance of distribution B:", min = 1, max = 10, value = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")#,
       #textOutput("mean")
    )
  )
))
