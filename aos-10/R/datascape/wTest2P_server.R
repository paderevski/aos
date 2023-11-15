wTest2PServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    observe({
      if (!is.null(data()) && ncol(data()) > 0) {
        # Filter to include only numeric columns
        numeric_columns <-
          names(data())[sapply(data(), is.numeric)]
        # Update the select input with names of numeric columns
        updateSelectInput(session, "column_x", choices = numeric_columns)
        updateSelectInput(session, "column_y", choices = numeric_columns)
      } else {
        updateSelectInput(session, "column_x", choices = NULL)
        updateSelectInput(session, "column_y", choices = NULL)
      }
      
    })
    
    # Function to perform wilcoxon test and plot
    perform_test <- function(one_sided = FALSE) {
      req(data())
      req(input$column_x)
      req(input$column_y)
      num_vector_x <- data()[[input$column_x]]
      num_vector_x <- na.omit(num_vector_x)
      num_vector_y <- data()[[input$column_y]]
      num_vector_y <- na.omit(num_vector_y)
      
      if (is.null(num_vector_x) || length(num_vector_x) < 2) {
        output$test_result <-
          renderPrint({
            "Please provide at least two numbers to perform a test."
          })
        return()
      }
      if (is.null(num_vector_y) || length(num_vector_y) < 2) {
        output$test_result <-
          renderPrint({
            "Please provide at least two numbers to perform a test."
          })
        return()
      }
      if (length(num_vector_x) != length(num_vector_y)) {
        output$test_result <-
          renderPrint({
            "Input vectors not the same length."
          })
        return()
      }
      alpha <-
        input$alpha_level  # Get the alpha level from the input
      
      # Perform the test
      alternative <- if (one_sided) {
        if (median(num_vector_x) > median(num_vector_y))
          "greater"
        else
          "less"
      } else {
        "two.sided"
      }
      
      test <-
        wilcox.test(
          num_vector_x,
          num_vector_y,
          alternative = alternative,
          conf.level = 1 - alpha,
          conf.int = TRUE,
          paired = TRUE
        )
      
      # Display the test results
      output$test_result <- renderTable({
        results <- data.frame(
          Description = c(
            "P-Value",
            "Confidence Interval Lower",
            "Confidence Interval Upper",
            "Sample Median X",
            "Sample Median Y",
            "Test Result"
          ),
          Value = c(
            test$p.value,
            test$conf.int[1],
            test$conf.int[2],
            median(num_vector_x),
            median(num_vector_y),
            ifelse(
              test$p.value < alpha,
              "Reject Null Hypothesis: Difference is significant",
              "Fail to Reject Null Hypothesis: Difference is not significant"
            )
          )
        )
        results
      }, align = 'l', rownames = FALSE)
    }
    
    # Observe one-sided test button click
    observeEvent(input$test_one_sided_button, {
      perform_test(TRUE)
    })
    
    # Observe two-sided t-test button click
    observeEvent(input$test_two_sided_button, {
      perform_test(FALSE)
    })
    #-----------------------------------------------------------------------
    
  })
}
