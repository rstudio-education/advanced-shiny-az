# Load packages ----------------------------------------------------------------
library(shiny)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  selectInput(inputId = "city",
              label = "Select city",
              choices = c("Edinburgh" = "edinburgh", 
                          "Glasgow"   = "glasgow", 
                          "Lausanne"  = "lausanne", 
                          "Zurich"    = "zurich")),
  strong("Selected city"),
  textOutput(outputId = "selected_city")
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  output$selected_city <- renderText(input$city)
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
