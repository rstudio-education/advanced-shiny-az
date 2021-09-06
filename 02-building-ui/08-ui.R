# Load packages ----------------------------------------------------------------
library(shiny)
library(ggplot2)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  titlePanel("Linked brushing"),
  fluidRow(
    column(5,
      plotOutput("plot", brush = "brush")
    ),
    column(7,
      tableOutput("detail")
    )
  )
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  
  output$detail <- renderTable({
    brushed <- brushedPoints(mtcars, input$brush)
    validate(need(nrow(brushed) > 0, "Click and drag to select data points"))
    brushed[, c("mpg", "cyl", "disp", "hp", "wt")]
  }, rownames = TRUE)
  
  output$plot <- renderPlot({
    ggplot(mtcars, aes(x = hp, y = mpg)) +
      geom_point()
  })
  
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
