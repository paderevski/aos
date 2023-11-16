
tTestUI <- function(id) {
    ns <- NS(id)
    fluidPage(
      tags$h3("One Sample T-Test"),
      tags$p("Use this test to compare the measurement from one sample taken from the population to a hypothesized population mean. The T-tests
           rely on the central limit theorem and thus require a large sample size (at least 30 or 50), or
           knowledge that the population distribution is normal. If these conditions are met, then a failing one-sample
          T-test implies that the population mean is different from the hypothesized mean."),
        selectInput(ns("column"), "Choose column for T-test:", choices = NULL),
        numericInput(ns("hypothesized_mean"), 
                     "Hypothesized Mean:", 
                     20),
        numericInput(ns("alpha_level"),
                     "Significance Level (alpha):", 
                     0.05),
        actionButton(ns("ttest_one_sided_button"), "Perform One-Sided t-test"),
        actionButton(ns("ttest_two_sided_button"), "Perform Two-Sided t-test"),
        div(
          style = "padding-top: 12pt;",
          tableOutput(ns("ttest_result")),
        ),
        plotOutput(ns("t_dist_plot")),
    )
}
