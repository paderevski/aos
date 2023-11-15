library(DT)

anovaOneServer <- function(id, data) {
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
      anova_result <- aov(value ~ group, data = anova_df)
      return(anova_result)
    }
    
    convert_anova_to_df <- function(anova_result) {
      anova_summary <- summary(anova_result, digits = 10)
      summary_df <- data.frame(
        Term = rownames(anova_summary[[1]]),
        Df = anova_summary[[1]]$Df,
        Sum_Sq = anova_summary[[1]]$`Sum Sq`,
        Mean_Sq = anova_summary[[1]]$`Mean Sq`,
        F_value = anova_summary[[1]]$`F value`,
        Pr_F = anova_summary[[1]]$`Pr(>F)`,
        row.names = NULL
      )
      summary_df$Df <- round(summary_df$Df, 2)
      summary_df$Sum_Sq <- round(summary_df$Sum_Sq, 2)
      summary_df$Mean_Sq <- round(summary_df$Mean_Sq, 2)
      summary_df$F_value <- round(summary_df$F_value, 2)
      summary_df$Pr_F <- round(summary_df$Pr_F, 6)  # Adjust decimal places as needed
      
      summary_df
    }
    
    
    # Function to perform ANOVA test and show results
    perform_test <- function() {
      req(data())
      req(input$columns)
      
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
      sa <- summary(test)
      df <- as.data.frame(sa[[1]])
      p_value = df$`Pr(>F)`[1] 
      
      # Display the test results

      output$test_result <- renderDT({
        # Assuming 'df' is your data frame
        req(df)  # Ensure df is available
        
        # Create a DT::datatable object
        datatableObject <- datatable(df, options = list(
          paging = FALSE,
          searching = FALSE,
          ordering = FALSE
        ))

        datatableObject <- datatableObject %>%
            formatSignif(columns = 5, digits=4)
        datatableObject <- datatableObject %>%
            formatRound(columns=2:4, digits = 2)
        
        # Return the datatable object
        datatableObject
      })
     
      output$test_conclusion <- renderText({
        if (p_value < alpha) {
          "Reject null hypothesis: Not all population means are identical"
        } else {
          "Fail to reject null hypothesis: Insufficient evidence to conclude that population means differ"
        }
      }) 
    }
    
    
    # Observe test button click
    observeEvent(input$test_button, {
      perform_test()
    })
    
    #-----------------------------------------------------------------------
    
  })
}
