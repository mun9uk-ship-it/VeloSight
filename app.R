# ==============================================================================
# File Name: app.R
# Application: DataScope — Universal Interactive Data Explorer
# Description: Upload any CSV, inspect data quality, optionally clean missing
#              values, and explore the result through dynamic filters, an
#              interactive plot, and a searchable data table. Falls back to
#              the built-in mtcars dataset as a live demo when no file is
#              uploaded yet.
# ==============================================================================

library(shiny)
library(bslib)
library(ggplot2)
library(plotly)
library(DT)
library(bsicons)

# ------------------------------------------------------------------------------
# Helper functions
# ------------------------------------------------------------------------------

# Build a per-column data quality summary table
build_quality_report <- function(df) {
  n_row <- nrow(df)
  data.frame(
    Column          = names(df),
    Type            = sapply(df, function(x) class(x)[1]),
    Missing_Count   = sapply(df, function(x) sum(is.na(x))),
    Missing_Percent = paste0(round(100 * sapply(df, function(x) sum(is.na(x))) / n_row, 1), "%"),
    Unique_Values   = sapply(df, function(x) length(unique(x))),
    row.names = NULL,
    stringsAsFactors = FALSE
  )
}

# Apply a missing-data handling strategy to a data frame
clean_missing_data <- function(df, strategy) {
  if (strategy == "remove") {
    return(df[complete.cases(df), ])
  }

  if (strategy == "impute") {
    for (col in names(df)) {
      if (is.numeric(df[[col]])) {
        df[[col]][is.na(df[[col]])] <- mean(df[[col]], na.rm = TRUE)
      } else {
        if (any(is.na(df[[col]]))) {
          mode_val <- names(sort(table(df[[col]]), decreasing = TRUE))[1]
          df[[col]][is.na(df[[col]])] <- mode_val
        }
      }
    }
    return(df)
  }

  df # strategy == "none"
}

# ------------------------------------------------------------------------------
# 1. User Interface (UI)
# ------------------------------------------------------------------------------
ui <- page_sidebar(
  theme = bs_theme(bootswatch = "darkly"),
  title = "DataScope — Universal Data Explorer 🚀",

  sidebar = sidebar(
    title = "Data Controls",
    width = 340,

    fileInput("uploaded_file", "📂 Upload CSV File", accept = ".csv"),
    helpText("No file yet? The demo below uses the built-in mtcars dataset."),

    hr(),
    h5("🧹 Data Cleaning"),
    radioButtons(
      "missing_strategy", "Handle missing values:",
      choices = c(
        "Keep as is"                          = "none",
        "Remove rows with missing values"     = "remove",
        "Fill numeric = mean, text = mode"    = "impute"
      ),
      selected = "none"
    ),
    actionButton("apply_cleaning", "Apply Cleaning", class = "btn-warning w-100"),
    br(), br(),
    actionButton("reset_data", "Reset to Original", class = "btn-outline-light w-100"),
    br(), br(),
    downloadButton("download_original", "Download Original File", class = "btn-outline-light w-100"),

    hr(),
    h5("🎚️ Dynamic Filters"),
    uiOutput("dynamic_filters")
  ),

  # KPI Value Boxes
  layout_columns(
    fill = FALSE,
    value_box(
      title = "Filtered Rows",
      value = textOutput("total_rows"),
      showcase = bs_icon("table")
    ),
    value_box(
      title = "Columns",
      value = textOutput("total_cols"),
      showcase = bs_icon("layout-three-columns")
    ),
    value_box(
      title = "Missing Values Remaining",
      value = textOutput("missing_remaining"),
      showcase = bs_icon("exclamation-triangle")
    )
  ),

  tabsetPanel(
    tabPanel(
      "📊 Dashboard",
      br(),
      layout_columns(
        card(
          card_header("Chart Options"),
          uiOutput("axis_selectors")
        )
      ),
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
    ),
    tabPanel(
      "🔍 Data Quality Report",
      br(),
      card(
        card_header("Column-by-Column Summary"),
        DTOutput("quality_report")
      ),
      card(
        card_header("Duplicate Rows"),
        textOutput("dup_count")
      ),
      card(
        card_header("Summary Statistics"),
        verbatimTextOutput("summary_stats")
      )
    )
  )
)

# ------------------------------------------------------------------------------
# 2. Server Logic
# ------------------------------------------------------------------------------
server <- function(input, output, session) {

  # rv$original always holds the untouched uploaded (or demo) data.
  # rv$cleaned holds the working copy that cleaning/filters operate on.
  rv <- reactiveValues(original = mtcars, cleaned = mtcars)

  # --- Handle file upload -----------------------------------------------------
  observeEvent(input$uploaded_file, {
    req(input$uploaded_file)

    df <- tryCatch(
      read.csv(input$uploaded_file$datapath, stringsAsFactors = FALSE),
      error = function(e) NULL
    )

    if (is.null(df)) {
      showNotification("Could not read this file. Please upload a valid CSV.", type = "error")
      return(NULL)
    }

    rv$original <- df
    rv$cleaned  <- df
    showNotification("File uploaded successfully ✅", type = "message")
  })

  # --- Apply / reset cleaning --------------------------------------------------
  observeEvent(input$apply_cleaning, {
    rv$cleaned <- clean_missing_data(rv$original, input$missing_strategy)
    showNotification("Cleaning applied ✅", type = "message")
  })

  observeEvent(input$reset_data, {
    rv$cleaned <- rv$original
    updateRadioButtons(session, "missing_strategy", selected = "none")
    showNotification("Data reset to original ↩️", type = "message")
  })

  # --- Download the untouched original file -----------------------------------
  output$download_original <- downloadHandler(
    filename = function() "original_data.csv",
    content  = function(file) write.csv(rv$original, file, row.names = FALSE)
  )

  # --- Dynamic filters, generated from the current dataset's columns ----------
  output$dynamic_filters <- renderUI({
    df <- rv$cleaned
    req(df)

    filter_inputs <- lapply(names(df), function(col) {
      col_data <- df[[col]]
      input_id <- paste0("filter_", col)

      if (is.numeric(col_data)) {
        rng <- range(col_data, na.rm = TRUE)
        sliderInput(input_id, col, min = rng[1], max = rng[2], value = rng)
      } else {
        choices <- unique(na.omit(col_data))
        if (length(choices) >= 1 && length(choices) <= 15) {
          checkboxGroupInput(input_id, col, choices = choices, selected = choices)
        } else {
          NULL # skip free-text / high-cardinality columns
        }
      }
    })

    do.call(tagList, filter_inputs)
  })

  # --- Axis / color pickers for the plot, generated from column types ---------
  output$axis_selectors <- renderUI({
    df <- rv$cleaned
    req(df)

    numeric_cols <- names(df)[sapply(df, is.numeric)]
    # Treat text columns AND low-cardinality numeric columns (e.g. "cyl" with
    # only 3 distinct values) as usable grouping/coloring variables.
    is_cat_like <- sapply(df, function(x) !is.numeric(x) || length(unique(x)) <= 10)
    cat_cols <- names(df)[is_cat_like]

    if (length(numeric_cols) < 2) {
      return(helpText("Need at least two numeric columns to plot."))
    }

    layout_columns(
      selectInput("x_axis", "X Axis:", choices = numeric_cols, selected = numeric_cols[1]),
      selectInput("y_axis", "Y Axis:", choices = numeric_cols,
                  selected = numeric_cols[min(2, length(numeric_cols))]),
      selectInput("color_by", "Color By:", choices = c("None", cat_cols), selected = "None")
    )
  })

  # --- Apply dynamic filters to produce the working dataset -------------------
  filtered_data <- reactive({
    df <- rv$cleaned
    req(df)

    for (col in names(df)) {
      input_id <- paste0("filter_", col)
      val <- input[[input_id]]
      if (is.null(val)) next

      if (is.numeric(df[[col]])) {
        idx <- which(df[[col]] >= val[1] & df[[col]] <= val[2])
      } else {
        idx <- which(df[[col]] %in% val)
      }
      df <- df[idx, , drop = FALSE]
    }

    df
  })

  # --- KPI outputs --------------------------------------------------------------
  output$total_rows <- renderText({ nrow(filtered_data()) })
  output$total_cols  <- renderText({ ncol(filtered_data()) })
  output$missing_remaining <- renderText({ sum(is.na(filtered_data())) })

  # --- Interactive plot ---------------------------------------------------------
  output$interactive_plot <- renderPlotly({
    df <- filtered_data()
    req(input$x_axis, input$y_axis)
    req(nrow(df) > 0)

    p <- ggplot(df, aes(x = .data[[input$x_axis]], y = .data[[input$y_axis]]))

    if (!is.null(input$color_by) && input$color_by != "None") {
      color_col <- input$color_by
      if (is.numeric(df[[color_col]])) {
        p <- p + aes(color = factor(.data[[color_col]]))
      } else {
        p <- p + aes(color = .data[[color_col]])
      }
    }

    p <- p +
      geom_point(size = 3.5, alpha = 0.85) +
      theme_minimal() +
      labs(x = input$x_axis, y = input$y_axis, color = input$color_by)

    ggplotly(p)
  })

  # --- Data table -----------------------------------------------------------
  output$data_table <- renderDT({
    datatable(filtered_data(), options = list(pageLength = 8, scrollX = TRUE))
  })

  # --- Data quality report tab ------------------------------------------------
  output$quality_report <- renderDT({
    df <- rv$cleaned
    req(df)
    datatable(build_quality_report(df), options = list(dom = 't', pageLength = 25), rownames = FALSE)
  })

  output$dup_count <- renderText({
    paste("Duplicate rows:", sum(duplicated(rv$cleaned)))
  })

  output$summary_stats <- renderPrint({
    summary(rv$cleaned)
  })
}

# ------------------------------------------------------------------------------
# 3. Application Execution
# ------------------------------------------------------------------------------
shinyApp(ui = ui, server = server)
