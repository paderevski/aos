

wTestUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Wilcoxon One Sample Test"),
    tags$p("Use this test to test the location of a distribution. This test does not
           rely on assumed values for the mean or variance of the population nor on the underlying distribution
           being normal. If this test fails, the population distribution can be assumed to not be located
           at the given value (or above/below in the 1-sided case).
           This is a non-parametric alternative to the one-sample T-test."),
    selectInput(ns("column"), "Choose column for Wilcoxon Test:", choices = NULL),
    numericInput(ns("hypothesized_median"),
                 "Hypothesized Location:",
                 0),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):",
                 0.05),
    actionButton(ns("test_one_sided_button"), "Perform One-Sided Test"),
    actionButton(ns("test_two_sided_button"), "Perform Two-Sided Test"),
    verbatimTextOutput(ns("result")),
    tableOutput(ns("test_result")),
  )
}
