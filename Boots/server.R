 
  #Load the Data ----
  Troop_Data <- readRDS("~/Boots/Boots/data/Troop_Data2.rds")
  library(shiny)
  library(magrittr)
  library(ggplot2)
  library(forecast)
  library(zoo)
 
  #Define server logic ----
  
  server <- function(input, output) {

  # Formula Variable Definitions ----
  output$country <- reactive({input$country})
  service <- reactive({input$service})
  train <- reactive({input$train})
  horizon <- reactive({input$horizon})
  model <- reactive({input$model})
  horizon <- reactive({input$horizon})
  aggregate <- reactive({input$aggregate})

  # Return the formula text for printing as a caption ----
  # output$caption <- renderText({
  #  formulaText()
  # })

    #Generate a plot 
  # output$SummaryPlot <- renderPlot({
  #  Troop_Data %>% dplyr::filter(Country==input$country,Branch==input$service,Year %in% seq(input$train[1],input$train[2],1)) %>% ggplot2::ggplot(data=.,aes(Year,Interpolated))+geom_line()
  # })
  
  output$ResidualPlot <- renderPlot({
    Troop_Data %>% dplyr::filter(Country==input$country,Branch==input$service,Year %in% seq(input$train[1],input$train[2],1)) %>% ggplot2::ggplot(data=.,aes(Year,Interpolated))+geom_line()
  })
  
  output$ForecastPlot <- renderPlot({
    autoplot(forecast(zoo(x=Troop_Data %>%
                            dplyr::filter(Country==input$country,
                                          Branch==input$service,
                                          Year %in% seq(input$train[1],
                                                        input$train[2],
                                                        1)) %>%
                            dplyr::select(Interpolated),
                          order.by=index(Troop_Data %>%
                            dplyr::filter(Country==input$country,
                                          Branch==input$service,
                                          Year %in% seq(input$train[1],
                                                        input$train[2],
                                                        1)) %>% 
                            dplyr::select(Year))),h=input$horizon))
  })
  
}