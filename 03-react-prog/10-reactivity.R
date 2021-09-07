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
  
  rv <- reactiveValues(value = 0)
  
  observeEvent(input$increment, {
    rv$value <- rv$value + 1
  })
  observeEvent(input$decrement, {
    rv$value <- rv$value - 1
  })
  observeEvent(input$reset, {
    rv$value <- 0
  })
  
  output$updated_value <- renderText({
    rv$value
  })
}

# Run the app -------------------------------------------------------
shinyApp(ui, server)
