library(ggplot2)
library(reshape2)

dataGraphServer <- function(id, loaded_data) {
  moduleServer(id, function(input, output, session) {
    ns <- NS(id)
    # Using observeEvent to listen for changes in 'data'
    output$status <- renderText({"No valid data found"})
    
    observeEvent(loaded_data(), {
      # Print debugging information
      cat("observeEvent triggered at", Sys.time(), "\n")
      cat("Contents of loaded_data():\n")
      
      # Safely print a portion of loaded_data() to avoid console flooding
      if (!is.null(loaded_data()) && nrow(loaded_data()) > 0) {
        print(head(loaded_data(), n = 5))  # Adjust 'n' as needed
        cat("Total rows in data:", nrow(loaded_data()), "\n")
        cat("Total columns in data:", ncol(loaded_data()), "\n")
      } else {
        cat("Data is NULL or empty.\n")
      }
      
      if (!is.null(loaded_data()) && ncol(loaded_data()) > 0) {
        # Filter to include only numeric columns
        numeric_columns <- names(loaded_data())[sapply(loaded_data(), is.numeric)]
        # Update the select input with names of numeric columns
        updateCheckboxGroupInput(session, "columns", choices = numeric_columns)
        output$status <- renderText({""})
      } else {
        updateCheckboxGroupInput(session, "columns", choices = NULL)
        output$status <- renderText({"No valid data found"})
      }
    }, ignoreNULL = FALSE)
    
    # output$plot1 <- renderPlot({
    #   req(data())
    #   req(input$columns)
    #   # selected_col <- data()[[input$column]]
    #   if (length(input$columns) >= 1 &&
    #       length(input$columns) <= 3) {
    #     # Histogram with Sturges method
    #     ggplot(data()) +
    #       lapply(input$columns, function(col) {
    #         geom_histogram(
    #           aes_string(x = col, fill = as.factor(col), group = as.factor(col)),
    #           breaks = pretty(
    #             range(na.omit(data()[[col]])),
    #             n = nclass.Sturges(na.omit(data()[[col]])),
    #             min.n = 1
    #           ),
    #           alpha = 0.5
    #         )
    #       }) +
    #       theme_light() +
    #       labs(fill = "Columns")  + # Set the legend title for 'fill'
    #       scale_fill_manual(values = c("blue", "red", "green")) +  # Colors for different series
    #       ggtitle("Histograms") + 
    #       theme(axis.text = element_text(size = 12)) +  # Increase the font size of axis text
    #       labs(x = input$column)  # Set the x-axis label to the column name
    #   }
    # })
    
    
    output$plot1 <- renderPlot({
      req(loaded_data())
      req(input$columns)
      
      if (length(input$columns) >= 1 && length(input$columns) <= 3) {
        # Reshape data to long format
        long_data <- melt(loaded_data(), measure.vars = input$columns)
        
        # Create a named vector of colors
        colors <- c("blue", "red", "green")
        names(colors) <- input$columns
        
        # Create histograms with variable number of bins and different colors
        ggplot(long_data, aes(x = value, fill = variable)) +
          geom_histogram(bins = nclass.Sturges(long_data$value), alpha = 0.4,
                         width = 0.2) +
          scale_fill_manual(values = colors) +  # Apply the colors
          facet_wrap(~ variable) +
          theme_light() +
          labs(title = "Side-by-Side Histograms with Variable Bins", x = "Value", y = "Count")
      }
    })
    
    
    output$plot2 <- renderPlot({
      req(loaded_data())
      req(input$columns)
      if (length(input$columns) >= 1 && length(input$columns) <= 3) {
        ggplot(loaded_data()) +
          lapply(input$columns, function(col) {
            geom_boxplot(
              aes_string(x = as.factor(col), y = col, fill = as.factor(col)),
              alpha = 0.5
            )
          }) +
          theme_light() +
          labs(fill = "Columns") +  # Set the legend title for 'fill'
          scale_fill_manual(values = c("blue", "red", "green")) +  # Colors for different series
          ggtitle("Boxplot") +
          theme(axis.text = element_text(size = 12)) +  # Increase the font size of axis text
          labs(x = "Columns")  # Set the x-axis label
      }
    })
    
    # output$plot2 <- renderPlot({
    #   req(loaded_data())
    #   req(input$column)
    #   selected_col <- loaded_data()[[input$column]]
    #   if (is.numeric(selected_col)) {
    #     x = loaded_data()[[input$column]]
    #
    #     # Create a data frame from the vector, as ggplot2 works with data frames
    #     df <- data.frame(value = x)
    #
    #     # Create the boxplot
    #     ggplot(df, aes(y = value)) +
    #       geom_boxplot(fill = "green", alpha = 0.7)  # green shading for the box
    #   }
    # })
    #
    output$plot3 <- renderPlot({
      req(loaded_data())
      req(input$columns)
      if (length(input$columns) >= 1 && length(input$columns) <= 3) {
        # Prepare the data in long format for faceting
        long_data <- reshape2::melt(loaded_data(), measure.vars = input$columns)
        
        # Create QQ plots
        ggplot(long_data, aes(sample = value)) +
          stat_qq(aes(color = variable)) +
          stat_qq_line(aes(color = variable)) +
          facet_wrap(~ variable, scales = "free") +
          theme_light() +
          labs(title = "QQ Plots", x = "Theoretical Quantiles", y = "Sample Quantiles") +
          theme(axis.text = element_text(size = 12)) +
          scale_color_manual(values = c("blue", "red", "green"))  # Define colors for each variable
      }
    })
    
    # output$plot3 <- renderPlot({
    #   req(loaded_data())
    #   req(input$column)
    #   selected_col <- loaded_data()[[input$column]]
    #   if (is.numeric(selected_col)) {
    #     x = loaded_data()[[input$column]]
    #     qqnorm(x)
    #   }
    # })
  })
}
