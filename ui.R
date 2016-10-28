library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("San Francisco Arrivals Next 5 Days"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("Filters for all arriving guests"),
      
#      sliderInput("bins",
#                  "Number of bins:",
#                  min = 1,
#                  max = 50,
#                  value = 30)
#    ),
    
#    radioButtons("display",
#             label = "Display",
#             choices = list("Guests by Usage Likelihood", "Guests by Predicted Value"),
#             selected = "Guests by Usage Likelihood"),

    sliderInput("range", 
                label = "Likelihood to Use Hello Scout (%):",
                min = 0, max = 100, value = c(20, 100)),
 
#sliderInput("bins",
#            "Number of bins:",
#            min = 1,
#            max = 50,
#            value = 30),
 
#  sliderInput("value-range", 
#              label = "Gross Booking Predictor ($$):",
#              min = 1, max = 75, value = c(1, 75)),

    selectInput("var", 
                label = "Compare arrivals with",
                choices = list("All Historic Data", "Last 7 Days",
                               "Last Month", "Last 3 Months"),
                selected = "All Historic Data")
),

    # Show a plot of the generated distribution
    mainPanel(
      #tableOutput("view"),
      plotOutput("distPlot"),
      verbatimTextOutput("summary")
    )
  )
))