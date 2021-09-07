# Load packages ----------------------------------------------------------------
library(shiny)
library(tidyverse)
library(DT)
library(tools)
load("movies.Rdata")

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  
  # App title ----
  titlePanel("Movie browser"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Inputs: Select variables to plot ----
    sidebarPanel(
      
      # Choose genre ----
      selectInput(inputId = "genre",
                  label = "Select genre:",
                  choices = unique(movies$genre),
                  selected = "Drama",
                  multiple = TRUE),
      
      # Action button ----
      actionButton(inputId = "save_file",
                   label = "Save file"),
      
      hr(),
      
      # Select variable for y-axis ----
      selectInput(inputId = "y", 
                  label = "Y-axis:",
                  choices = c("IMDB rating" = "imdb_rating", 
                              "IMDB number of votes" = "imdb_num_votes", 
                              "Critics Score" = "critics_score", 
                              "Audience Score" = "audience_score", 
                              "Runtime" = "runtime"), 
                  selected = "audience_score"),
      
      # Select variable for x-axis ----
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = c("IMDB rating" = "imdb_rating", 
                              "IMDB number of votes" = "imdb_num_votes", 
                              "Critics Score" = "critics_score", 
                              "Audience Score" = "audience_score", 
                              "Runtime" = "runtime"), 
                  selected = "critics_score"),
      
      # Select variable for color ----
      selectInput(inputId = "z", 
                  label = "Color by:",
                  choices = c("Title Type" = "title_type", 
                              "Genre" = "genre", 
                              "MPAA Rating" = "mpaa_rating", 
                              "Critics Rating" = "critics_rating", 
                              "Audience Rating" = "audience_rating"),
                  selected = "mpaa_rating"),
      
      # Set alpha level ----
      sliderInput(inputId = "alpha", 
                  label = "Alpha:", 
                  min = 0, max = 1, 
                  value = 0.5),
      
      # Set point size ----
      sliderInput(inputId = "size", 
                  label = "Size:", 
                  min = 0, max = 5, 
                  value = 2, step = 0.25),
      
      # Show data table ----
      checkboxInput(inputId = "show_data",
                    label = "Show data table",
                    value = TRUE)
    ),
    
    # Output ----
    mainPanel(

      # Show scatterplot ----
      plotOutput(outputId = "scatterplot"),

      # Show data table ----
      DT::dataTableOutput(outputId = "moviestable")
    )
  )
)

# Define server ----------------------------------------------------------------
server <- function(input, output) {
  
  # Subset movies for selected genres ----
  movies_subset <- reactive({
    movies %>%
      filter(genre %in% input$genre)
  })
  
  # Create scatterplot ----
  output$scatterplot <- renderPlot({
    movies_subset() %>%
      ggplot(aes_string(x = input$x, y = input$y, color = input$z)) +
      geom_point(alpha = input$alpha, size = input$size) +
      labs(x = toTitleCase(str_replace_all(input$x, "_", " ")),
           y = toTitleCase(str_replace_all(input$y, "_", " ")),
           color = toTitleCase(str_replace_all(input$z, "_", " "))) +
      theme_minimal()
  })
  
  # Print data table if checked ----
  output$moviestable <- DT::renderDataTable(
    if(input$show_data){
      DT::datatable(data = movies_subset() %>% select(1:5))
    }
  )
  
  # Save movies_subset when it changes ----
  observeEvent(input$save_file, {
    filename <- paste0("movies-subset", format(Sys.time(), "%Y-%m-%d-%H-%M-%S"), ".csv")
    write_csv(movies_subset(), path = paste0("saved-data/", filename))
  })
}

# Create the app ---------------------------------------------------------------
shinyApp(ui = ui, server = server)
