library(DT)
library(FSA)

anovaKWServer <- function(id, loaded_data) {
  moduleServer(id, function(input, output, session) {
    
    outputVisible <- reactiveVal(FALSE)
    
    observe({
      if (!is.null(loaded_data()) && ncol(loaded_data()) > 0) {
        # Filter to include only numeric columns
        numeric_columns <-
          names(loaded_data())[sapply(loaded_data(), is.numeric)]
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
    
    perform_dunn <- function(df, column_names) {
      # Check if the column names exist in the dataframe
      if (!all(column_names %in% names(df))) {
        stop("One or more specified columns do not exist in the dataframe.")
      }
      
      # Create a new dataframe for ANOVA analysis
      dunn_df <- data.frame(value = numeric(), group = factor())
      
      # Loop through column names and add data to the anova_df
      for (col in column_names) {
        temp_df <- data.frame(value = df[[col]], group = factor(col))
        temp_df <- na.omit(temp_df)  # Remove NA values
        dunn_df <- rbind(dunn_df, temp_df)
      }
      
      # Perform ANOVA
      dunn_result <- dunnTest(value ~ group, data = dunn_df)
      return(dunn_result)
    }
    
    # Function to perform ANOVA test and show results
    perform_test <- function() {
      req(loaded_data())
      req(input$columns)
      
      if (is.null(input$columns) || length(input$columns) < 3) {
        outputVisible(FALSE)
        output$test_result <- NULL
        output$test_conclusion <-
          renderText({
            "Please provide at least three columns to perform a test."
          })
        output$dunn_result <- NULL
        return()
      }
      
      alpha <-
        input$alpha_level  # Get the alpha level from the input
      
      test <-
        perform_anova(df = loaded_data(), column_names = input$columns)

      # Display the test results
      
      output$tableATitle <- renderUI({
        if(outputVisible()) {
          tags$h4("ANOVA Table", style = "text-align: left; padding-top: 12pt;")
        }
      })
      
      output$test_result <- renderDT({
        req(df)  # Ensure df is available
        # Extracting the test statistic and p-value
        data_frame <- data.frame(
          Test_Statistic = test$statistic,
          P_Value = test$p.value
        )
        
        # Convert to datatable
        datatableObject <- datatable(data_frame, rownames = FALSE, options = list(
          paging = FALSE,
          searching = FALSE,
          ordering = FALSE,
          info = FALSE
        ))
        
        datatableObject <- datatableObject %>%
          formatSignif(columns = 2, digits=4) %>%
          formatRound(columns = 1, digits = 3)
        
        # Return the datatable object
        datatableObject
      })
      
      output$test_conclusion <- renderUI({
        if (test$p.value < alpha) {
          HTML("<b>Conclusion:</b> Reject null hypothesis: Not all distributions are identical")
        } else {
          HTML("<b>Conclusion:</b> Fail to reject null hypothesis: Insufficient evidence to 
                conclude that distributions differ")
        }
      }) 
      
      output$tableBTitle <- renderUI({
        if(outputVisible()) {
          tags$h4("Dunn Test Results", style = "text-align: left;")
        }
      })
      
      output$dunn_result <- renderDT({
        req(test)
        req(df)
        dunn_result = perform_dunn(df = loaded_data(), column_names = input$columns)
        dunn_df = as.data.frame(dunn_result[[2]])
        
        datatableObject <- datatable(dunn_df, options = list(
          paging = FALSE,
          searching = FALSE,
          ordering = FALSE,
          info = FALSE
        ))
        
        datatableObject <- datatableObject %>%
          formatSignif(columns = 3:4, digits=4) %>%
          formatRound(columns = 2, digits = 3)
        
        datatableObject
      })

    }
    
    
    # Observe test button click
    observeEvent(input$test_button, {
      outputVisible(TRUE)
      perform_test()
    })
    
    #-----------------------------------------------------------------------
    
  })
}
