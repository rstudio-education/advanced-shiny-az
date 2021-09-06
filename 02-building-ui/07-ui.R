# Load packages ----------------------------------------------------------------
library(shiny)
library(ggplot2)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  titlePanel("Linked brushing"),
  plotOutput("plot", brush = "brush"),
  tableOutput("detail")
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  output$plot <- renderPlot({
    ggplot(mtcars, aes(x = hp, y = mpg)) +
      geom_point()
  })
  
  output$detail <- renderTable({
    brushed <- brushedPoints(mtcars, input$brush)
    validate(need(nrow(brushed) > 0, "Click and drag to select data points"))
    brushed[, c("mpg", "cyl", "disp", "hp", "wt")]
  }, rownames = TRUE)
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
