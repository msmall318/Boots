# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Estimating Global Troop Laydown"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("country", "Country:",
                  unique(Troop_Data$Country)),
      selectInput("service", "Service:",
                  c("Air Force",
                    "Army",
                    "Marine Corps",
                    "Navy")),
      sliderInput("train","End Year:",
                  min=1951,
                  max=2017,
                  value = c(1950,2017),
                  sep=""),
      
      numericInput("horizon","Forecast Horizon:",
                  value = 1),
      radioButtons("model",label="Model:",
                   choices=list("ARIMA"=1,"ETS"=2),
                   selected=1),
      
      radioButtons("aggregate",label="Aggregate or Disaggregate:",
                   choices=list("Aggregate"=1,"Disaggregate"=2),
                   selected=2)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
    #   # Output: Plot forecasts
    #   plotOutput("ARIMAPlot"),
    #   plotOutput("ETSPlot")
    # ),
    tabsetPanel(type = "tabs",
                tabPanel("Plots",
                         plotOutput("ARIMAPlot"),
                         plotOutput("ETSPlot")
                         ),
                tabPanel("ETS Summary",  verbatimTextOutput("ETSsummary")
                         ),
                tabPanel("ARIMA Summary", verbatimTextOutput("ARIMAsummary")
                         ),
                tabPanel("Residual Plots", plotOutput("ETS Residuals"), plotOutput("ARIMA Residuals")
                        )
    )
  )
)
)