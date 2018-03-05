# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Predicting Global Disposition of U.S. Military Personnel via Open-Source, Unclassified Means"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      "R Shiny Application",
      # Input: Selector for variable to plot against mpg ----
      selectInput("country", "Country:",
                  unique(Troop_Data$Country)),
      selectInput("service", "Service:",
                  c("Air Force",
                    "Army",
                    "Marine Corps",
                    "Navy",
                    "All Services")),
      sliderInput("train","Model Training Years:",
                  min=1951,
                  max=2017,
                  value = c(1950,2017),
                  sep=""),
      
      numericInput("horizon","Forecast Horizon (Years):",
                  value = 5)#,
      # radioButtons("model",label="Model:",
      #              choices=list("ARIMA"=1,"ETS"=2),
      #              selected=1),
      # 
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
    #   # Output: Plot forecasts
    #   plotOutput("ARIMAPlot"),
    #   plotOutput("ETSPlot")
    # ),
    tabsetPanel(type = "tabs",
                tabPanel("Plots",            plotOutput("ARIMAPlot"),
                                             plotOutput("ETSPlot")),
                #tabPanel("Comparison Plots", plotOutput("ARIMAComparisonPlot"),
                #                             plotOutput("ETSComparisonPlot")),
                tabPanel("ARIMA Summary",    verbatimTextOutput("ARIMAsummary")),
                tabPanel("ETS Summary",      verbatimTextOutput("ETSsummary")),
                tabPanel("Residual Plots",   plotOutput("ARIMA Residuals"),
                                             plotOutput("ETS Residuals"))
                #tabPanel("ARIMA Accuracy",   verbatimTextOutput("ARIMA Comparison Accuracy"))
    )
  )
)
)