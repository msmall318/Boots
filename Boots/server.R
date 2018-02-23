 #Data pre-processing ----
 #Tweak the "am" variable to have nicer factor labels -- since this
 #doesn't rely on any user inputs, we can do this once at startup
 #and then use the value throughout the lifetime of the app
Troop_Data <- readRDS(file="Troop_Data.rds")

 #Define server logic to plot various variables against mpg ----
server <- function(input, output) {

  # Compute the formula text ----
   #This is in a reactive expression since it is shared by the
   #output$caption and output$mpgPlot functions
  country <- reactive({input$country})
  service <- reactive({input$service})
  start <- reactive({input$start})
  end <- reactive({input$end})
  horizon <- reactive({input$horizon})

   #Return the formula text for printing as a caption ----
  output$caption <- renderText({
   formulaText()
  })

    #Generate a plot of the requested variable against mpg ----
    #and only exclude outliers if requested
 output$ForecastPlot <- renderPlot({
   Troop_Data %>% dplyr::filter(Country==country,Branch==service) %>% ggplot(data=.,aes(Year,Interpolated))+geom_line()
  })

}