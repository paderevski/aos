

chiSquareIndyUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Chi-Square Test of Independence"),
    tags$p(
      id="text_chi_indy",
      "Use this test when you aim to assess whether there is a significant association between two categorical variables.",
      tags$span(
        id = "moreText_chi_indy",
        style = "display: none;",
        "This test is particularly useful when your data are categorized along two different dimensions, and you need to explore 
      if the distribution in one category is influenced by the distribution in another. For instance, it can be used to evaluate 
      whether educational level (such as high school, undergraduate, graduate) is related to a preference for a specific type of 
      leisure activity (such as reading, sports, gaming). It's also applicable in situations like determining if there's a 
      relationship between job sectors (technology, healthcare, education) and employee satisfaction levels (satisfied, neutral, unsatisfied). 
      The data should be organized in a contingency table where frequencies reflect the counts in each category combination. The test 
      requires that these categories are mutually exclusive, each observation is independent, and the sample size is sufficiently large, 
      generally with at least 5 expected counts in each cell of the table. The Chi-Square Test of Independence is a robust, 
      non-parametric method that is invaluable for investigating relationships between categorical variables in various research contexts."
      ),
      tags$a(href = "javascript:void(0)", onclick = "showMore('moreText_chi_indy')", "Show More")
    ),
    checkboxGroupInput(
      ns("columns"),
      "Choose columns to analyze:",
      choices = NULL,
      selected = NULL,
      inline = TRUE
    ),
    numericInput(ns("alpha_level"),
                 "Significance Level (alpha):",
                 0.05),
    actionButton(ns("chi_test_button"), "Perform Chi Squared Test"),
    div(style = "padding-top: 12pt;",
        tableOutput(ns("chi_result")),),
    plotOutput(ns("barplot"))
  )
}

library(shiny)

ui <- fluidPage(
  tags$head(tags$script(
    HTML(
      "
            function showMore() {
                var moreText = document.getElementById('moreText');
                var linkText = document.querySelector('#text > a');

                if (moreText.style.display === 'none') {
                    moreText.style.display = 'inline';
                    linkText.innerHTML = 'Show Less';
                } else {
                    moreText.style.display = 'none';
                    linkText.innerHTML = 'Show More';
                }
            }
        "
    )
  )),
  tags$p(
    id = "text",
    "Your long paragraph text goes here. Up to the point you want initially visible.",
    tags$span(
      id = "moreText",
      style = "display: none;",
      "The rest of your paragraph text that you want to initially hide goes here."
    ),
    tags$a(href = "javascript:void(0)", onclick = "showMore()", "Show More")
  )
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
