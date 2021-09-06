# Load packages ----------------------------------------------------------------
library(shiny)
library(tidyverse)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  selectInput("am", "Select transmission (0 = automatic, 1 = manual):",
              choices = unique(mtcars$am),
              width = "100%"),
  br(),
  textOutput("summary")
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  
  output$summary <- renderText({
    am_mean <- mtcars %>% 
      filter(am == input$am) %>% 
      summarise(mean(mpg)) %>% 
      pull() %>%
      round(2)
    am_character <- ifelse(input$am == 0, "automatic", "manual")
    paste("Average mileage of", am_character, "cars is", am_mean, "miles/gallon.")
  })
  
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
