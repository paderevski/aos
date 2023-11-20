


chiSquareGOFUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Chi Squared Goodness of Fit Test"),
    tags$p(
      id = "text_chi_gof",
      "Use the Chi-Square Goodness of Fit (GOF) test when you need to determine whether the observed
           frequencies of a categorical variable significantly differ from a set of expected
           frequencies under a specified theoretical distribution.",
      tags$span(
        id = "moreText_chi_gof",
        style = "display: none;",
        "This test is appropriate when
           you're dealing with a single categorical variable and want to compare the observed distribution
           of categories against a theoretically expected distribution. The Chi-Square GOF test is
           particularly useful in situations where you're testing hypotheses about proportions or probabilities
           within categories, such as evaluating whether a dice is fair (each number having equal probability),
           or assessing if the distribution of characteristics in a sample matches a population distribution.
           It's essential that the data is in frequency form (counts of occurrences), and the categories
           are mutually exclusive and exhaustive. Additionally, the test assumes a sufficiently large sample size,
           typically with expected frequencies in each category being at least 5."
      ),
      tags$a(href = "javascript:void(0)", onclick = "showMore('moreText_chi_gof')", "Show More")
    ),
    selectInput(
      ns("column_x"),
      "Choose column of observed frequencies:",
      choices = NULL
    ),
    selectInput(
      ns("column_p"),
      "Choose column of expected frequencies",
      choices = NULL
    ),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):",
                 0.05),
    actionButton(ns("chi_test_button"), "Perform Chi Squared Test"),
    div(style = "padding-top: 12pt;",
        tableOutput(ns("chi_result")), ),
    plotOutput(ns("barplot"))
  )
}
