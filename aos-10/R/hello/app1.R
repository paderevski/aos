library(shiny)

# Define the UI
ui <- fluidPage(
  titlePanel("T-Test Application"),
  
  # Tabbed set to separate one-sample and two-sample t-tests
  tabsetPanel(
    # One-sample t-test tab
    tabPanel("One-Sample t-test",
             sidebarLayout(
               sidebarPanel(
                 textAreaInput("numbers_one", "Enter numbers (separated by space, comma, or newline):", ""),
                 numericInput("hypothesized_mean_one", "Hypothesized Mean:", 0),
                 actionButton("one_sample_ttest", "Perform One-Sample t-test")
               ),
               mainPanel(
                 verbatimTextOutput("one_sample_results"),
                 plotOutput("one_sample_plot")
               )
             )
    ),
    # Two-sample t-test tab
    tabPanel("Two-Sample t-test",
             sidebarLayout(
               sidebarPanel(
                 textAreaInput("numbers_two_sample1", "Group 1 numbers (separated by space, comma, or newline):", ""),
                 textAreaInput("numbers_two_sample2", "Group 2 numbers (separated by space, comma, or newline):", ""),
                 actionButton("two_sample_ttest", "Perform Two-Sample t-test")
               ),
               mainPanel(
                 verbatimTextOutput("two_sample_results"),
                 plotOutput("two_sample_plot")
               )
             )
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Helper function to parse numbers from text input
  parse_numbers <- function(input_text) {
    # Remove non-numeric except comma, minus and period
    cleaned_input <- gsub("[^0-9\\,\\.\\-\\n]", "", input_text)
    # Split the input by commas, spaces, newline (\n) and carriage return (\r) characters
    num_vector <- as.numeric(unlist(strsplit(cleaned_input, "[,\\s]+")))
    na.omit(num_vector) # Remove NA values due to empty strings
  }
  
  # Observe event for one-sample t-test
  observeEvent(input$one_sample_ttest, {
    # Parse numbers
    data <- parse_numbers(input$numbers_one)
    # Perform the t-test
    t_test_result <- t.test(data, mu = input$hypothesized_mean_one)
    output$one_sample_results <- renderPrint({ t_test_result })
    output$one_sample_plot <- renderPlot({
      # Plot details will be similar to the previous one-sample t-test plot code
    })
  })
  
  # Observe event for two-sample t-test
  observeEvent(input$two_sample_ttest, {
    # Parse numbers for both groups
    data1 <- parse_numbers(input$numbers_two_sample1)
    data2 <- parse_numbers(input$numbers_two_sample2)
    # Perform the t-test
    t_test_result <- t.test(data1, data2)
    output$two_sample_results <- renderPrint({ t_test_result })
    output$two_sample_plot <- renderPlot({
      # Plot details will be similar to the previous two-sample t-test plot code
    })
  })
  
}

# Create Shiny app object
shinyApp(ui = ui, server = server)
