library(shiny)
library(ggplot2)
library(dplyr)

# Load Data
load("data/df.rda")

# Prepare Dropdown Choices
emotion_choices <- c(levels(df$Emotion), "All Emotions")
fear_choices <- c(as.character(sort(unique(df$Fear_During))), "All Levels")
strategy_choices <- c(levels(df$Strategy), "Both")

# UI
ui <- fluidPage(
  titlePanel("Fright Night Emotional Reactions"),
  sidebarLayout(
    sidebarPanel(
      selectInput("emotion_select", "Choose an Emotion:", choices = emotion_choices, selected = "All Emotions"),
      selectInput("fear_select", "Choose Fear Level (1-5):", choices = fear_choices, selected = "All Levels"),
      selectInput("strategy_select", "Choose Regulation Strategy:", choices = strategy_choices, selected = "Both")
    ),
    mainPanel(
      plotOutput("emotionPlot")
    )
  )
)

# Server
server <- function(input, output) {
  
  output$emotionPlot <- renderPlot({
    
    plot_data <- df
    
    if (input$emotion_select != "All Emotions") {
      plot_data <- filter(plot_data, Emotion == input$emotion_select)
    }
    if (input$fear_select != "All Levels") {
      plot_data <- filter(plot_data, Fear_During == as.numeric(input$fear_select))
    }
    if (input$strategy_select != "Both") {
      plot_data <- filter(plot_data, Strategy == input$strategy_select)
    }
    
    ggplot(plot_data, aes(x = Emo.Extent_z, y = Reg.Extent_z, color = Emotion)) +
      geom_point(size = 3, alpha = 0.7) +
      stat_smooth(method = "lm", se = FALSE) +
      labs(title = "Emotional Intensity vs. Regulation Effort",
           subtitle = "Filtered by Emotion, Fear Level, and Regulation Strategy",
           x = "Z-Scored Emotional Intensity",
           y = "Z-Scored Regulation Effort",
           color = "Emotion") +
      theme_minimal()
  })
}

# Run
shinyApp(ui = ui, server = server)
