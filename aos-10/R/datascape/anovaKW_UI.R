library(DT)

anovaKWUI <- function(id) {
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
    tags$h3("One-Way Non-parametric (Kruskall-Wallace) ANOVA Test"),
    tags$p("Use this test to"),
    checkboxGroupInput(ns("columns"), "Choose columns to plot:",
                       choices = NULL, 
                       selected = NULL,
                       inline = TRUE),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):", 
                 0.05),
    actionButton(ns("test_button"), "Perform ANOVA-KW Test"),
    DTOutput(ns("test_result")),
  )
}

