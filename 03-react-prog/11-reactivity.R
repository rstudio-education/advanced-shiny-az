# Load packages ----------------------------------------------------------------
library(shiny)
library(tidyverse)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "CSV file"),
      uiOutput("field_chooser_ui")
    ),
    mainPanel(
      plotOutput("plot"),
      verbatimTextOutput("summary")
    )
  )
)

# Define server logic for summarizing selected file ----------------------------
server <- function(input, output, session) {
  
  # Load data ----
  full_data <- reactive({
    read_csv(input$file$datapath)
  })
  
  # Subset for specified columns ---
  subset_data <- reactive({
    full_data() %>%
      select(input$xvar, input$yvar)
  })
  
  # Dynamic UI for variable names based on selected file ---
  output$field_chooser_ui <- renderUI({
    col_names <- names(full_data())
    tagList(
      selectInput("xvar", "X variable", col_names),
      selectInput("yvar", "Y variable", col_names, selected = col_names[2])
    )
  })
  
  # Scatterplot of selected variables ----
  output$plot <- renderPlot({
    ggplot(subset_data(), aes_string(x = input$xvar, y = input$yvar)) +
      geom_point()
  })
  
  # Summary of selected variables ----
  output$summary <- renderPrint({
    summary(subset_data())
  })
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
