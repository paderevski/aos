library(DT)

anovaKWServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
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
    
    perform_anova <- function(df, column_names) {
      # Check if the column names exist in the dataframe
      if (!all(column_names %in% names(df))) {
        stop("One or more specified columns do not exist in the dataframe.")
      }
      
      # Create a new dataframe for ANOVA analysis
      anova_df <- data.frame(value = numeric(), group = factor())
      
      # Loop through column names and add data to the anova_df
      for (col in column_names) {
        temp_df <- data.frame(value = df[[col]], group = factor(col))
        temp_df <- na.omit(temp_df)  # Remove NA values
        anova_df <- rbind(anova_df, temp_df)
      }
      
      # Perform ANOVA
      anova_result <- kruskal.test(value ~ group, data = anova_df)
      return(anova_result)
    }
    
    # Function to perform ANOVA test and show results
    perform_test <- function() {
      cat("performtest\n")
      req(data())
      req(input$columns)
      cat('t2\n')      
      if (is.null(input$columns) || length(input$columns) < 2) {
        output$test_result <-
          renderPrint({
            "Please provide at least two columns to perform a test."
          })
        return()
      }
      
      alpha <-
        input$alpha_level  # Get the alpha level from the input
      
      test <-
        perform_anova(df = data(), column_names = input$columns)

      # Display the test results

      output$testResultTable <- renderDT({
        # Extracting the test statistic and p-value
        data_frame <- data.frame(
          Test_Statistic = test$statistic,
          P_Value = test$p.value
        )
        
        # Round the p-value for better display
        data_frame$P_Value <- round(data_frame$P_Value, 4)
        
        # Convert to datatable
        datatable(data_frame, rownames = FALSE, options = list(
          paging = FALSE,
          searching = FALSE,
          ordering = FALSE
        ))
      })

    }
    
    
    # Observe test button click
    observeEvent(input$test_button, {
      perform_test()
    })
    
    #-----------------------------------------------------------------------
    
  })
}
