library(DT)

anovaOneUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$head(
      tags$style(HTML("
            .shiny-table th, .shiny-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            .shiny-table th {
                background-color: #f2f2f2;
            }
            .shiny-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }
        "))
    ),
    tags$h3("One-Way ANOVA Test"),
    tags$p("Use this test to compare multiple distributions and determine if the population means
            are all identical. If this test fails, then there is strong evidence that one of the
            population means is different from the others. In order to determine which one is
            different, further analysis is required, such as with a Tukey test."),
    checkboxGroupInput(ns("columns"), "Choose columns to analyze:",
                       choices = NULL, 
                       selected = NULL,
                       inline = TRUE),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha < 1):", 
                 0.05,
                 min = 0,
                 max = 1,
                 step = 0,
                 width = "100pt"),
    actionButton(ns("test_button"), "Perform ANOVA Test"),
    DTOutput(ns("test_result")),
    tags$br(),
    textOutput(ns("test_conclusion")),
    tags$hr(),
    DTOutput(ns("tukey_result")),
  )
}

