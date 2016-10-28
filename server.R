library(shiny)

Bdata<-read.csv("all-data.csv")
predictor<-as.data.frame(Bdata)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  datasetInput <- reactive({
    switch(input$var,
           "All Historic Data" = predictor[,2],
           "Last 7 Days" = predictor[,3],
           "Last Month" = predictor[,4],
           "Last 3 Months" = predictor[,5])
  })
  
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  output$distPlot <- renderPlot({
    color<-switch(input$var,
                  "All Historic Data" = "darkgreen",
                  "Last 7 Days" = "skyblue",
                  "Last Month" = "darkviolet",
                  "Last 3 Months" = "black")
    
    dataset <- datasetInput()
    
#    display<-switch(input$display,
#                    "Guests by Usage Likelihood"= predictor[, 2],
#                    "Guests by Predicted Value"= predictor[,2])
    
#    x <- predictor[, 2]  # Prediction Data
#BINS    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    dataset<-subset(dataset, dataset > input$range[1] & dataset < input$range[2])
    
    # draw the histogram with the specified number of bins
#BINS    hist(x, breaks = bins, col = 'darkgray', border = 'white', main = "Distribution by Likelihood to use Hello Scout", xlab = "Likelihood to Use Hello Scout (%)", ylab = "Number of Guests")
    hist(dataset, col = color, border = 'white', main = "Distribution by Likelihood to use Hello Scout", xlab = "Likelihood to Use Hello Scout (%)", ylab = "Number of Guests")
  })
  
  output$view <- renderText({
    paste("You input", paste(input$range, collapse=''))
  })
})