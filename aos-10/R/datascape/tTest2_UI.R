
tTest2UI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Two Sample T-Test"),
    tags$p(
      id = "text_two_sample_t",
      "The two-sample T-test is an essential statistical tool for comparing the means of two independent groups, especially in hypothesis testing scenarios. This test is used when you want to determine whether there is a significant difference between the means of two groups, which could be from different populations or under different conditions.",
      tags$a(href = "javascript:void(0)", onclick = "showMore('moreText_two_sample_t')", "Show More"),
      tags$span(
        id = "moreText_two_sample_t",
        style = "display: none;",
        "Suitable for smaller sample sizes and assuming normally distributed data, the two-sample T-test evaluates whether the observed differences in sample means are statistically significant or could have occurred by random chance. This test is particularly useful in experiments and studies where comparing the effects of different treatments or conditions on a variable is crucial.",
      ),
      tags$h4("This test assumes the following:"),
        tags$ul(
          tags$li("The two groups are independent of each other."),
          tags$li("The data in both groups are normally distributed."),
          tags$li("The variances of the two groups are equal (homogeneity of variance)."),
          tags$li("The sample size is small (typically less than 30 for each group).")
        )

    )
    ,
    selectInput(ns("column_x"), "Choose column for T-test:", choices = NULL),
    selectInput(ns("column_y"), "Choose column for T-test:", choices = NULL),
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
