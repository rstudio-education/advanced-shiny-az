# Load packages ----------------------------------------------------------------
library(shiny)
library(dplyr)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  selectInput("am", "Select transmission",
              choices = c("Automatic" = 0,
                          "Manual"    = 1)),
  br(),
  h4(textOutput("table_header")),
  DT::dataTableOutput("table"),
  br() # so the bottom of table doesn't touch bottom of app
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  
  output$table_header <- renderText({
    am_character <- ifelse(input$am == 0, "Automatic", "Manual")
    paste(am_character, "cars in the mtcars dataset:")
  })
  
  output$table <- DT::renderDataTable({
    mtcars %>% 
      rownames_to_column(var = "make_model") %>%
      filter(am == input$am)
  },
  options = list(dom = "t", pageLength = -1, ordering = FALSE),
  rownames = FALSE
  )
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
