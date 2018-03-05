server <- function(input, output) {

  # Formula Variable Definitions ----
  # country <- reactive({input$country})
  # service <- reactive({input$service})
  # train <- reactive({input$train})
  # horizon <- reactive({input$horizon})
  # model <- reactive({input$model})
  # horizon <- reactive({input$horizon})
  # aggregate <- reactive({input$aggregate})
  
  output$ARIMAPlot <- renderPlot({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      auto.arima() %>%
      forecast(h=input$horizon) %>%
      autoplot(xlab="Year",ylab="Number of Military Personnel")
  })
  
  output$ARIMAComparisonPlot <- renderPlot({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      auto.arima() %>%
      forecast(h=input$horizon) %>%
      autoplot(xlab="Year",ylab="Number of Military Personnel") +
      autolayer(Troop_Data %>%
                  dplyr::filter(Country==input$country,
                                Branch==input$service,
                                Year %in% seq((input$train[2]+1),
                                              (input$train[2]+input$horizon),
                                              1)) %$%
                  zoo(Interpolated,Year) %>% as.ts())
  })

  output$ETSPlot <- renderPlot({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      ets() %>%
      forecast(h=input$horizon) %>%
      autoplot(xlab="Year",ylab="Number of Military Personnel")
  })
  
  output$ETSComparisonPlot <- renderPlot({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      ets() %>%
      forecast(h=input$horizon) %>%
      autoplot(xlab="Year",ylab="Number of Military Personnel") +
      autolayer(Troop_Data %>%
                  dplyr::filter(Country==input$country,
                                Branch==input$service,
                                Year %in% seq((input$train[2]+1),
                                              (input$train[2]+input$horizon),
                                              1)) %$%
                  zoo(Interpolated,Year) %>% as.ts())
  })
  
  output$ETSsummary <- renderPrint({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      ets() %>%
      forecast(h=input$horizon) %>%
      summary()
  })
  
  output$ARIMAsummary <- renderPrint({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      auto.arima() %>%
      forecast(h=input$horizon) %>%
      summary()
  })
  
  output$`ETS Residuals` <- renderPlot({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      ets() %>%
      checkresiduals()
  })
  
  output$`ARIMA Residuals` <- renderPlot({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      auto.arima() %>% 
      checkresiduals
  })
  
  output$`ARIMA Comparison Accuracy` <- renderPrint({
    Troop_Data %>%
      dplyr::filter(Country==input$country,
                    Branch==input$service,
                    Year %in% seq(input$train[1],
                                  input$train[2],
                                  1)) %$%
      zoo(Interpolated,Year) %>%
      auto.arima() %>%
      forecast(h=input$horizon) %>% 
      accuracy(.,Troop_Data %>%
                 dplyr::filter(Country==input$country,
                               Branch==input$service,
                               Year %in% seq((input$train[2]+1),
                                             (input$train[2]+input$horizon),
                                             1)) %$%
                 zoo(Interpolated,Year))
  })
}