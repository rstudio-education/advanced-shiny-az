# Load packages ----------------------------------------------------------------
library(shiny)

# Define UI---------------------------------------------------------------------
ui <- fluidPage(
  includeHTML("youtube_thumbnail.html")
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
