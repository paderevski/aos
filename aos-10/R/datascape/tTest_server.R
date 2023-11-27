
tTestServer <- function(id, loaded_data) {
    moduleServer(id, function(input, output, session) {
        observe({
          if (!is.null(loaded_data()) && ncol(loaded_data()) > 0) {
            # Filter to include only numeric columns
            numeric_columns <- names(loaded_data())[sapply(loaded_data(), is.numeric)]
            # Update the select input with names of numeric columns
            updateSelectInput(session, "column", choices = numeric_columns)
          } else {
            updateSelectInput(session, "column", choices = NULL)
          }
          
        })

        # Function to perform t-test and plot
        perform_ttest <- function(one_sided = FALSE) {
          req(loaded_data())
          req(input$column)
          num_vector <- loaded_data()[[input$column]]
          num_vector <- na.omit(num_vector)
          
          if (is.null(num_vector) || length(num_vector) < 2) {
            output$ttest_result <- renderPrint({ "Please provide at least two numbers to perform a t-test." })
            return()
          }
          
          hypothesized_mean <- input$hypothesized_mean
          alpha <- input$alpha_level  # Get the alpha level from the input
          
          # Perform the t-test
          alternative <- if (one_sided) {
            if(mean(num_vector) > hypothesized_mean) "greater" else "less"
          } else {
            "two.sided"
          }
          
          cat("alpha = ", alpha, "mu = ", hypothesized_mean)
          t_test <- t.test(num_vector, mu = hypothesized_mean, alternative = alternative, conf.level = 1-alpha)
          
          # Display the t-test results
          output$ttest_result <- renderTable({
            results <- data.frame(
              Description = c("T-Test Statistic", "Degrees of Freedom", "P-Value", "Confidence Interval Lower", 
                              "Confidence Interval Upper", "Sample Mean", "Hypothesized Mean", "T-Test Result"),
              Value = c(t_test$statistic, t_test$parameter, t_test$p.value, 
                        t_test$conf.int[1], t_test$conf.int[2], mean(num_vector), 
                        hypothesized_mean, 
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
        }
        
        # Observe one-sided t-test button click
        observeEvent(input$ttest_one_sided_button, {
          perform_ttest(TRUE)
        })
        
        # Observe two-sided t-test button click
        observeEvent(input$ttest_two_sided_button, {
          perform_ttest(FALSE)
        })
        #-----------------------------------------------------------------------

    })
}
