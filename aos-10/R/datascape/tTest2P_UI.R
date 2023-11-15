
tTest2PUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Paired T-Test"),
    tags$p("Use this test to compare measurements from one sample taken at two points in time. The T-tests
           rely on the central limit theorem and thus require a large sample size (at least 30 or 50), or
           knowledge that the population distribution is normal. If these conditions are met, then a failing paired
          T-test implies that the two sample means are different and an underlying effect is being observed."),
    selectInput(ns("column_x"), "Choose column for T-test:", choices = NULL),
    selectInput(ns("column_y"), "Choose column for T-test:", choices = NULL),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):", 
                 0.05),
    actionButton(ns("ttest_one_sided_button"), "Perform One-Sided t-test"),
    actionButton(ns("ttest_two_sided_button"), "Perform Two-Sided t-test"),
    verbatimTextOutput(ns("result")),
    tableOutput(ns("ttest_result")),
    plotOutput(ns("t_dist_plot")),
  )
}
