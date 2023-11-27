
chiSquareGOFServer <- function(id, loaded_data) {
  moduleServer(id, function(input, output, session) {
    observe({
      if (!is.null(loaded_data()) && ncol(loaded_data()) > 0) {
        # Filter to include only numeric columns
        numeric_columns <- names(loaded_data())[sapply(loaded_data(), is.numeric)]
        # Update the select input with names of numeric columns
        updateSelectInput(session, "column_x", choices = numeric_columns)
        updateSelectInput(session, "column_p", choices = numeric_columns)
      } else {
        updateSelectInput(session, "column_x", choices = NULL)
        updateSelectInput(session, "column_p", choices = NULL)
      }
      
    })
    
    # Function to perform test
    perform_chi_test <- function() {
      req(loaded_data())
      req(input$column_x)
      req(input$column_p)
      num_vector_x <- loaded_data()[[input$column_x]]
      num_vector_p <- loaded_data()[[input$column_p]]
      num_vector_x <- na.omit(num_vector_x)
      num_vector_p <- na.omit(num_vector_p)
      cat("x\n", num_vector_x)
      
      if (is.null(num_vector_x) || length(num_vector_x) < 2) {
        output$ttest_result <- renderPrint({ "Please provide at least two numbers to perform a chi-squared test." })
        return()
      }
      if (is.null(num_vector_p) || length(num_vector_p) < 2) {
        output$ttest_result <- renderPrint({ "Please provide at least two numbers to perform a chi-squared test." })
        return()
      }
      if (length(num_vector_x) != length(num_vector_p)) {
        output$ttest_result <- renderPrint({ "Unequal vector lengths. Unable to perform test." })
        return()
      }
      alpha <- input$alpha_level  # Get the alpha level from the input
      
      # Perform the test
    
      chi_test <- chisq.test(x = num_vector_x, p=num_vector_p, rescale.p = TRUE)
      
      # Display the test results
      output$chi_result <- renderTable({
        results <- data.frame(
          Description = c("X-squared Statistic", "Degrees of Freedom", "P-Value", "Test Result"),
          Value = c(chi_test$statistic, chi_test$parameter, chi_test$p.value, 
                    ifelse(chi_test$p.value < alpha, "Reject Null Hypothesis: Difference is significant", 
                           "Fail to Reject Null Hypothesis: Difference is not significant"))
        )
        results
      }, align = 'l', rownames = FALSE)
      
      output$barplot <- renderPlot({
        M <- as.table(rbind(num_vector_x, num_vector_p))
        cat("p\n", num_vector_p)
        
       # dimnames(M) <- list(gender = c("F", "M"),
        #                    party = c("Democrat","Independent", "Republican"))
        
        barplot(M, beside = TRUE)
      })
    }
    
    # Observe one-sided t-test button click
    observeEvent(input$chi_test_button, {
      perform_chi_test()
    })
    #-----------------------------------------------------------------------
    
  })
}
