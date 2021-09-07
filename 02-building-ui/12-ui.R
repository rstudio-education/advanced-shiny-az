# Load packages ----------------------------------------------------------------
library(shiny)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  div(class = "thumbnail",
    div(class = "embed-responsive embed-responsive-16by9",
      tags$iframe(class = "embed-responsive-item", 
                  src = "https://www.youtube.com/embed/hou0lU8WMgo", 
                  allowfullscreen = NULL)
    ),
    div(class = "caption",
      h3("You are technically correct"),
      div("The best kind of correct!")
    )
  )
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
