
chiSquareGOFUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Chi Squared Goodness of Fit Test"),
    tags$p("Use this test to ...."),
    selectInput(ns("column_x"), "Choose column of observed frequencies:", choices = NULL),
    selectInput(ns("column_p"), "Choose column of expected frequencies", choices = NULL),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):", 
                 0.05),
    actionButton(ns("chi_test_button"), "Perform Chi Squared Test"),
    div(
      style = "padding-top: 12pt;",
      tableOutput(ns("chi_result")),
    ),
    plotOutput(ns("barplot"))
  )
}
