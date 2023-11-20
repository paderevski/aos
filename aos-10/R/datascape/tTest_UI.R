

tTestUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("One Sample T-Test"),
    tags$p(
      id = "text_one_sample_t",
      "The one-sample T-test is a powerful tool for hypothesis testing when the population mean is unknown. This statistical method is used to determine if the mean of a single sample significantly deviates from a hypothesized mean, often based on a theoretical or historical standard.",
      tags$a(href = "javascript:void(0)", onclick = "showMore('moreText_one_sample_t')", "Show More"),
      tags$span(
        id = "moreText_one_sample_t",
        style = "display: none;",
        "Ideal for small sample sizes, especially less than 30, and requiring normally distributed data, the test calculates its statistic by comparing the sample mean to the hypothesized mean, adjusting for the standard error. It's particularly valuable when the population standard deviation is not known, allowing researchers to test if observed sample differences are statistically significant or likely due to random chance."
      )
    )
    ,
    
    selectInput(ns("column"), "Choose column for T-test:", choices = NULL),
    numericInput(ns("hypothesized_mean"),
                 "Hypothesized Mean:",
                 20),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):",
                 0.05),
    actionButton(ns("ttest_one_sided_button"), "Perform One-Sided t-test"),
    actionButton(ns("ttest_two_sided_button"), "Perform Two-Sided t-test"),
    div(style = "padding-top: 12pt;",
        tableOutput(ns("ttest_result")),),
    plotOutput(ns("t_dist_plot")),
  )
}
