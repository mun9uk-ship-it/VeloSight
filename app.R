# ==============================================================================
# File Name: app.R
# Application: Interactive Shiny Data Dashboard
# Description: Modern R Shiny dashboard with interactive plots and tables
# ==============================================================================

library(shiny)
library(bslib)
library(ggplot2)
library(plotly)
library(DT)

# ------------------------------------------------------------------------------
# 1. User Interface (UI)
# ------------------------------------------------------------------------------
ui <- page_sidebar(
  theme = bs_theme(bootswatch = "darkly"), # Modern dark theme
  title = "Interactive Data Dashboard 🚀",
  
  sidebar = sidebar(
    title = "Controls",
    sliderInput("hp_range", "Horsepower Range:",
                min = min(mtcars$hp), max = max(mtcars$hp),
                value = c(min(mtcars$hp), max(mtcars$hp))),
    checkboxGroupInput("cyl_select", "Cylinders:",
                       choices = c("4 Cyl" = 4, "6 Cyl" = 6, "8 Cyl" = 8),
                       selected = c(4, 6, 8))
  ),
  
  # KPI Value Boxes
  layout_columns(
    fill = FALSE,
    value_box(
      title = "Total Selected Cars",
      value = textOutput("total_cars"),
      showcase = bsicons::bs_icon("car-front")
    ),
    value_box(
      title = "Average Horsepower",
      value = textOutput("avg_hp"),
      showcase = bsicons::bs_icon("speedometer")
    )
  ),
  
  # Main Display Cards
  layout_columns(
    card(
      card_header("Interactive Plot (Hover over points)"),
      plotlyOutput("interactive_plot")
    ),
    card(
      card_header("Data Table"),
      DTOutput("data_table")
    )
  )
)

# ------------------------------------------------------------------------------
# 2. Server Logic
# ------------------------------------------------------------------------------
server <- function(input, output) {
  
  # Reactive Data Filtering
  filtered_data <- reactive({
    req(input$cyl_select)
    subset(mtcars, 
           hp >= input$hp_range[1] & 
           hp <= input$hp_range[2] & 
           cyl %in% as.numeric(input$cyl_select))
  })
  
  # Render KPI Metrics
  output$total_cars <- renderText({ nrow(filtered_data()) })
  output$avg_hp <- renderText({ 
    if(nrow(filtered_data()) == 0) return("0")
    round(mean(filtered_data()$hp), 1) 
  })
  
  # Render ggplot2 + Plotly Interactive Chart
  output$interactive_plot <- renderPlotly({
    p <- ggplot(filtered_data(), aes(x = wt, y = mpg, color = factor(cyl), 
                                     text = paste("Car:", rownames(filtered_data())))) +
      geom_point(size = 4, alpha = 0.8) +
      geom_smooth(method = "lm", se = FALSE, color = "white", linetype = "dashed") +
      theme_minimal() +
      labs(x = "Weight (1000 lbs)", y = "Miles Per Gallon", color = "Cylinders")
    
    ggplotly(p, tooltip = "text")
  })
  
  # Render Interactive Data Table
  output$data_table <- renderDT({
    datatable(filtered_data()[, c("mpg", "cyl", "hp", "wt")], 
              options = list(pageLength = 5, dom = 'tip'))
  })
}

# ------------------------------------------------------------------------------
# 3. Application Execution
# ------------------------------------------------------------------------------
shinyApp(ui = ui, server = server)
