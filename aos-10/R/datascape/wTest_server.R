wTestServer <- function(id, loaded_data) {
  moduleServer(id, function(input, output, session) {
    observe({
      if (!is.null(loaded_data()) && ncol(loaded_data()) > 0) {
        # Filter to include only numeric columns
        numeric_columns <-
          names(loaded_data())[sapply(loaded_data(), is.numeric)]
        # Update the select input with names of numeric columns
        updateSelectInput(session, "column", choices = numeric_columns)
      } else {
        updateSelectInput(session, "column", choices = NULL)
      }
      
    })
    
    # Function to perform wilcoxon test and plot
    perform_test <- function(one_sided = FALSE) {
      req(loaded_data())
      req(input$column)
      num_vector <- loaded_data()[[input$column]]
      num_vector <- na.omit(num_vector)
      
      if (is.null(num_vector) || length(num_vector) < 2) {
        output$ttest_result <-
          renderPrint({
            "Please provide at least two numbers to perform a t-test."
          })
        return()
      }
      
      hypothesized_median <- input$hypothesized_median
      alpha <-
        input$alpha_level  # Get the alpha level from the input
      
      # Perform the test
      alternative <- if (one_sided) {
        if (median(num_vector) > hypothesized_median)
          "greater"
        else
          "less"
      } else {
        "two.sided"
      }
      
      cat("alpha = ", alpha, "mu = ", hypothesized_median, "\n")
      displayResults <- function(test) {
        # Display the test results
        output$test_result <- renderTable({
          results <- data.frame(
            Description = c(
              "Statistic",
              "P-Value",
              "Confidence Interval Lower",
              "Confidence Interval Upper",
              "Sample Median",
              "Hypothesized Median",
              "Test Result"
            ),
            Value = c(
              test$statistic,
              test$p.value,
              test$conf.int[1],
              test$conf.int[2],
              median(num_vector),
              hypothesized_median,
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
      tryCatch({
        # Example t.test, replace with your actual test
        test <-
          wilcox.test(
            num_vector,
            mu = hypothesized_median,
            alternative = alternative,
            conf.level = 1 - alpha,
            conf.int = TRUE
          )
        displayResults(test)
      }, error = function(e) {
        # Display error message in a notification
        showNotification(toString(e$message), type = "error")
      })
      
      
      
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
