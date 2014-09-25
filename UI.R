##get the dataset for the drop-down box
require(TTR)

suppressWarnings(SYMs <- TTR::stockSymbols())
SYMs <- sqldf("select Symbol from SYMs where Exchange='NYSE' and Industry like '%Banks%'")

# Define the overall UI, shamelessly stolen from the shiny gallery

shinyUI(
  
  # Use a fluid Bootstrap layout
  
  fluidPage(
    # Give the page a title
    
    titlePanel("NYSE Banking Stocks - VaR Calculator"),        
    
    # Generate a row with a sidebar
    
    sidebarLayout(
      
      selectInput("Instrument", "Instrument:", choices=SYMs),
      hr(),
    ),      
    
    # Create a spot for the barplot
    
    mainPanel(plotOutput("VaRPlot"), 
              plotOutput("TimeSeries"))
    
    )
  )
