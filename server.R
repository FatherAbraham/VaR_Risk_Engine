
shinyServer(function(input, output){
 
  

  
  # Fill in the spot we created for a plot
  
  output$VaRPlot<-renderPlot({
    begin <- Sys.Date() - 252 ## doesn't actually get 252 entries so the logic here needs improving
    end <- Sys.Date()   ## we can just use the last(dataset, 252) function, once we have a large enough dataset
    
    ##next few lines can probably be optimized?
    
    tickers <- getSymbols(input$Instrument, from = begin, to = end, auto.assign = TRUE)
    
    dataset <- Ad(get(tickers[1]))
    dataset <- dataset[,1]
    returns <- Return.calculate(dataset, method=c("simple"))
    
    chart.Histogram(returns, methods = c("add.risk"))
   
  })

})
