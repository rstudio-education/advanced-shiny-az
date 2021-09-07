# Load packages ----------------------------------------------------------------
library(shiny)
library(cranlogs)
library(tidyverse)
library(lubridate)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput("packages", "Package names (comma separated)")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  
  # Parses comma-separated string into a proper vector ----
  packages <- reactive({
    strsplit(input$packages, " *, *")[[1]]
  })
  
  # Daily downloads ----
  daily_downloads <- reactive({
    cranlogs::cran_downloads(
      packages = packages(),
      from = "2018-01-01", to = "2019-11-15"
    )
  })
  
  # Weekly downloads ----
  weekly_downloads <- reactive({
    daily_downloads() %>% 
      mutate(date = ceiling_date(date, "week")) %>%
      group_by(date, package) %>%
      summarise(count = sum(count))
  })
  
  # Plot weekly downloads, plus trendline ----
  output$plot <- renderPlot({
    ggplot(weekly_downloads(), aes(date, count, color = package)) +
      geom_line() +
      geom_smooth()
  })
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
