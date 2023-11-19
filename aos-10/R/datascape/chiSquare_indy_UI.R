
chiSquareIndyUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Chi Squared Goodness of Fit Test"),
    tags$p("Use the Chi-Square Test of Independence when you aim to assess whether there is a significant association between two categorical variables. This test is particularly useful when your data are categorized along two different dimensions, and you need to explore if the distribution in one category is influenced by the distribution in another. For instance, it can be used to evaluate whether educational level (such as high school, undergraduate, graduate) is related to a preference for a specific type of leisure activity (such as reading, sports, gaming). It's also applicable in situations like determining if there's a relationship between job sectors (technology, healthcare, education) and employee satisfaction levels (satisfied, neutral, unsatisfied). The data should be organized in a contingency table where frequencies reflect the counts in each category combination. The test requires that these categories are mutually exclusive, each observation is independent, and the sample size is sufficiently large, generally with at least 5 expected counts in each cell of the table. The Chi-Square Test of Independence is a robust, non-parametric method that is invaluable for investigating relationships between categorical variables in various research contexts."),
    checkboxGroupInput(ns("columns"), "Choose columns to analyze:",
                       choices = NULL, 
                       selected = NULL,
                       inline = TRUE),
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
