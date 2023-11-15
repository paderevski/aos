
wTest2UI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Mann-Whitney (Wilcoxon) Two Sample Test"),
    tags$p("Use this test to compare two samples from one population. You
           do not know the population mean or standard deviation, nor can you assume normality of the
           underlying distribution. If this test fails you can assume the
           two samples come from populations with different distributions.
           This is a non-parametric equivalent to the 2-sample T-test."),
    selectInput(ns("column_x"), "Choose X column for Mann Whitney test:", choices = NULL),
    selectInput(ns("column_y"), "Choose Y column for Mann Whitney test:", choices = NULL),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):", 
                 0.05),
    actionButton(ns("test_one_sided_button"), "Perform One-Sided Test"),
    actionButton(ns("test_two_sided_button"), "Perform Two-Sided Test"),
    verbatimTextOutput(ns("result")),
    tableOutput(ns("test_result")),
  )
}
