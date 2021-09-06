# Load packages ----------------------------------------------------------------
library(shiny)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  selectInput(inputId = "city",
              label = "Select city",
              choices = list("Scotland" = c("Edinburgh" = "edinburgh",
                                            "Glasgow"   = "glasgow"),
                             "Switzerland" = c("Lausanne"  = "lausanne", 
                                               "Zurich"    = "zurich"))),
  strong("Selected city"),
  textOutput(outputId = "selected_city"),
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  output$selected_city <- renderText(input$city)
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
