
wTest2PUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Wilcoxon Paired Test"),
    tags$p("Use this test to compare two samples from one population gathered at two points in time. You
           do not know the population mean or standard deviation, nor can you assume normality of the
           underlying distribution. This is a non-parametric equivalent to the paired T-test."),
    selectInput(ns("column_x"), "Choose X column for Paired Wilcoxon test:", choices = NULL),
    selectInput(ns("column_y"), "Choose Y column for Paired Wilcoxon test:", choices = NULL),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):", 
                 0.05),
    actionButton(ns("test_one_sided_button"), "Perform One-Sided Test"),
    actionButton(ns("test_two_sided_button"), "Perform Two-Sided Test"),
    verbatimTextOutput(ns("result")),
    tableOutput(ns("test_result")),
  )
}
