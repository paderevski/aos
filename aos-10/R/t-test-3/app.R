library(shiny)

# Define the UI for the app
ui <- fluidPage(
  titlePanel("Paired t-Test Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        column(6,
               textAreaInput("numbers1", 
                             "Enter X set of data observations (separated by spaces, commas, or newlines):",
                             "20, 22, 23, 24, 25, 21, 20, 23, 24",
                             rows=10)
        ),
        column(6,
               textAreaInput("numbers2", 
                             "Enter Y set of data observations (separated by spaces, commas, or newlines):",
                             "23, 24, 29, 21, 22, 20, 21, 24, 27",
                             rows=10)
        )
      ),
      numericInput("alpha_level", 
                   "Significance Level (alpha):", 
                   0.05),
      actionButton("ttest_one_sided_button", "Perform One-Sided t-test"),
      actionButton("ttest_two_sided_button", "Perform Two-Sided t-test")
    ),
    mainPanel(
      tableOutput("ttest_result"),
      plotOutput("t_dist_plot"),
      plotOutput("boxplot") # Add this line for the boxplot output
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  # Reactive expression to parse the input
  parsedInputX <- reactive({
    # Allow digits, the decimal point, and the minus sign
    cleaned_input <- gsub("[^0-9\\.-]", " ", input$numbers1)
    # Replace multiple spaces (including newlines and tabs) with a single space
    cleaned_input <- gsub("[[:space:]]+", " ", cleaned_input)
    # Trim leading and trailing spaces
    cleaned_input <- trimws(cleaned_input)
    # Split the input by space
    num_vector <- as.numeric(unlist(strsplit(cleaned_input, " ")))
    num_vector <- na.omit(num_vector)
    if(length(num_vector) < 1) {
      return(NULL)
    }
    num_vector
  })  

  # Reactive expression to parse the input
  parsedInputY <- reactive({
    # Allow digits, the decimal point, and the minus sign
    cleaned_input <- gsub("[^0-9\\.-]", " ", input$numbers2)
    # Replace multiple spaces (including newlines and tabs) with a single space
    cleaned_input <- gsub("[[:space:]]+", " ", cleaned_input)
    # Trim leading and trailing spaces
    cleaned_input <- trimws(cleaned_input)
    # Split the input by space
    num_vector <- as.numeric(unlist(strsplit(cleaned_input, " ")))
    num_vector <- na.omit(num_vector)
    if(length(num_vector) < 1) {
      return(NULL)
    }
    num_vector
  })  
  
  # Function to perform t-test and plot
  perform_ttest <- function(one_sided = FALSE) {
    num_vector_x <- parsedInputX()
    num_vector_y <- parsedInputY()
    if (is.null(num_vector_x) || length(num_vector_x) < 2) {
      output$ttest_result <- renderPrint({ "Please provide at least two numbers to perform a t-test." })
      return()
    }
    if (is.null(num_vector_y) || length(num_vector_y) < 2) {
      output$ttest_result <- renderPrint({ "Please provide at least two numbers to perform a t-test." })
      return()
    }
    if (length(num_vector_y) != length(num_vector_x)) {
      output$ttest_result <- renderPrint("Lists are not the same length." )
      return()
    }
    
    alpha <- input$alpha_level  # Get the alpha level from the input
    
    # Perform the t-test
    alternative <- if (one_sided) {
      if(mean(num_vector_x) > mean(num_vector_y)) "greater" else "less"
    } else {
      "two.sided"
    }
    
    t_test <- t.test(num_vector_x, num_vector_y, alternative = alternative, conf.level = 1-alpha, paired = TRUE)
    
    # Display the t-test results
    output$ttest_result <- renderTable({
      results <- data.frame(
        Description = c("T-Test Statistic", "Degrees of Freedom", "P-Value", "Confidence Interval Lower", 
                        "Confidence Interval Upper", "X Mean", "Y Mean", "T-Test Result"),
        Value = c(t_test$statistic, t_test$parameter, t_test$p.value, 
                  t_test$conf.int[1], t_test$conf.int[2], mean(num_vector_x), mean(num_vector_y),
                  ifelse(t_test$p.value < alpha, "Reject Null Hypothesis: Difference is significant", 
                         "Fail to Reject Null Hypothesis: Difference is not significant"))
      )
      results
    }, align = 'l', rownames = FALSE)
    
    # Plot the t-distribution and shade the critical region
    output$t_dist_plot <- renderPlot({
      df <- t_test$parameter
      t_value <- t_test$statistic
      x <- seq(-5, 5, length.out=300)
      y <- dt(x, df)
      
      plot(x, y, type="l", lwd=2, ylab="Density", xlab="t value", main="t-Distribution")
      
      # Add a vertical line for the t-statistic
      abline(v = t_value, col = "blue", lwd = 2, lty = 2)
      
      # Display the t-value on the plot
      text(t_value, dt(t_value, df), labels = paste("t =", round(t_value, 2)), pos = 3, cex = 0.8, col = "blue")
      
      # Determine the critical values and shading
      if (one_sided) {
        crit_val <- qt(alpha, df, lower.tail=alternative == "less")
        x_crit <- if (alternative == "greater") {
          seq(crit_val, max(x), length.out=100)
        } else {
          seq(min(x), crit_val, length.out=100)
        }
        y_crit <- dt(x_crit, df)
        polygon(c(x_crit, rev(x_crit)), c(rep(0, length(x_crit)), rev(y_crit)), col="red", border=NA)
      } else {
        crit_val_lower <- qt(alpha/2, df, lower.tail=TRUE)
        crit_val_upper <- qt(alpha/2, df, lower.tail=FALSE)
        x_crit_lower <- seq(min(x), crit_val_lower, length.out=100)
        x_crit_upper <- seq(crit_val_upper, max(x), length.out=100)
        y_crit_lower <- dt(x_crit_lower, df)
        y_crit_upper <- dt(x_crit_upper, df)
        # Shade the lower tail
        polygon(c(x_crit_lower, rev(x_crit_lower)), c(rep(0, length(x_crit_lower)), rev(y_crit_lower)), col="red", border=NA)
        # Shade the upper tail
        polygon(c(x_crit_upper, rev(x_crit_upper)), c(rep(0, length(x_crit_upper)), rev(y_crit_upper)), col="red", border=NA)
      }
    })
    
    output$boxplot <- renderPlot({
      data1 <- num_vector_x
      data2 <- num_vector_y
      
      # Combine the data into a list for plotting
      combinedData <- list(data1, data2)
      
      # Create the boxplot
      boxplot(combinedData, names=c("X", "Y"), 
              main="Data Boxplot",
              ylab="Values", xlab="Data Sets")
    })
  }
  
  # Observe one-sided t-test button click
  observeEvent(input$ttest_one_sided_button, {
    perform_ttest(TRUE)
  })
  
  # Observe two-sided t-test button click
  observeEvent(input$ttest_two_sided_button, {
    perform_ttest(FALSE)
  })
}

# Run the app
shinyApp(ui = ui, server = server)