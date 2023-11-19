
chiSquareIndyServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    outputVisible <- reactiveVal(FALSE)
    
    observe({
      if (!is.null(data()) && ncol(data()) > 0) {
        # Filter to include only numeric columns
        numeric_columns <-
          names(data())[sapply(data(), is.numeric)]
        # Update the select input with names of numeric columns
        updateCheckboxGroupInput(session, "columns", choices = numeric_columns)
      } else {
        updateCheckboxGroupInput(session, "columns", choices = NULL)
      }
    })
    
    # Function to perform test
    perform_chi_test <- function() {
      req(data())
      req(input$columns)
      df <- data()
      column_names <- input$columns
      
      # Check if the column names exist in the dataframe
      if (!all(column_names %in% names(data()))) {
        stop("One or more specified columns do not exist in the dataframe.")
      }
      
      for (col in column_names) {
        if (length(df[[col]]) < 1) {
          stop("Column lengths must be non-zero")
        }
      }
      
      for (col in column_names) {
        if (length(na.omit(df[[col]])) != length(na.omit(df[[column_names[1]]]))) {
          stop("Column lengths must be identical")
        }
      }
      # Create a new dataframe
      chi_df <- data.frame(value = numeric())
      
      browser()
      
      # Loop through column names and add data to the anova_df
      for (col in column_names) {
        temp_df <- data.frame(value = df[[col]])
        temp_df <- na.omit(temp_df)  # Remove NA values
        chi_df <- rbind(chi_df, temp_df)
      }
      
      alpha <- input$alpha_level  # Get the alpha level from the input
      
      # Perform the test
    
      chi_test <- chisq.test(chi_df)
      
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
    }
    
    # Observe one-sided t-test button click
    observeEvent(input$chi_test_button, {
      perform_chi_test()
    })
    #-----------------------------------------------------------------------
    
  })
}
