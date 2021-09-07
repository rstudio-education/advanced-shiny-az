# Load packages ----------------------------------------------------------------
library(shiny)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  actionButton("increment", "Increment"),
  actionButton("decrement", "Decrement"),
  actionButton("reset", "Reset"),
  h5("Value:"),
  textOutput("updated_value")
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  output$updated_value <- renderText({
    0
  })
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
