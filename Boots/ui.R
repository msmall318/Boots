# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Estimating Global Troop Laydown"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("service", "Service:",
                  c("Air Force",
                    "Army",
                    "Marine Corps",
                    "Navy")),
      selectInput("country", "Country:",
                  unique(Troop_Data$Country)),
      
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
      
      # Output: Plot thing ----
      plotOutput("ForecastPlot"),
      plotOutput("ResidualPlot")
      
    )
  )
)