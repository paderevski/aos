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
    tags$p("Use this test to compare multiple populations when you are unable to assume
           the underlying population is normal, or if your sample size is small (much less than 30).
           The null hypothesis is that all distributions are located in the same place. If this
           test rejects, further analysis is needed to determine which sample differs from the others.
           You should be careful if sample sizes differ because this can expose you to errors
           when the population variances are not known to be the same."),
    checkboxGroupInput(ns("columns"), "Choose columns to analyze:",
                       choices = NULL, 
                       selected = NULL,
                       inline = TRUE),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):", 
                 0.05,
                 width="100pt"),
    actionButton(ns("test_button"), "Perform ANOVA-KW Test"),
    DTOutput(ns("test_result")),
    tags$br(),
    uiOutput(ns("test_conclusion")),
    tags$hr(),
    DTOutput(ns("dunn_result"))
  )
}

