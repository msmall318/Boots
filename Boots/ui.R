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
      
      sliderInput("start","Start Year:",
                  min=1950,
                  max=2016,
                  value = 1950),
      
      sliderInput("end","End Year:",
                  min=1951,
                  max=2017,
                  value = 2017),
      
      sliderInput("horizon","Forecast Horizon:",
                  min = 1,
                  max = 20,
                  value = 10)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Plot of the requested variable against mpg ----
      plotOutput("ForecastPlot")
      
    )
  )
)