library(shiny)

histogramApp <- function() {
  ui <- fluidPage(
    titlePanel("Build a histogram with a module"),
    wellPanel(
      histogramUI("hist1"),
    )
  ),
  server <- function(input, output, session) {
    histogramServer("hist1")
  }
  shinyApp(ui, server)
}

histogramApp()
