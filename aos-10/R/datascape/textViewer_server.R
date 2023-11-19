

textViewerServer <- function(id, data) {
  na.pad <- function(x, len) {
    x[1:len]
  }
  
  makePaddedDataFrame <- function(l, ...) {
    maxlen <- max(sapply(l, length))
    data.frame(lapply(l, na.pad, len = maxlen), ...)
  }
  
  readInput <- function(inputElement) {
    cleaned_input <- gsub("[^0-9\\.-]", " ", inputElement)
    cleaned_input <- gsub("[[:space:]]+", " ", cleaned_input)
    cleaned_input <- trimws(cleaned_input)
    num_vector <- as.numeric(unlist(strsplit(cleaned_input, " ")))
    num_vector <- na.omit(num_vector)
  }
  

  moduleServer(id, function(input, output, session) {
    observeEvent(input$parse_text, {
      cat("Pressed\n")
      cat(input$numbers)
      
      x = readInput(input$numbers_x)
      y = readInput(input$numbers_y)
      z = readInput(input$numbers_z)

      df <-  makePaddedDataFrame(list(x = x, y = y, z = z))
      if (length(x) == 0) {
        df <- subset(df, select=-c(x))
      }      
      if (length(y) == 0) {
        df <- subset(df, select=-c(y))
      }
      if (length(z) == 0) {
        df <- subset(df, select=-c(z))
      }
      data( df )
    })
    
    observeEvent(input$clear_text, {
      cat("Clear Text\n")
      updateTextAreaInput(session, "numbers_x", value = "")
      updateTextAreaInput(session, "numbers_y", value = "")
      updateTextAreaInput(session, "numbers_z", value = "")
      data(NULL)
    })
    
    output$table <- renderDT({
      req(data())
      datatable(data(),
                options = list(
                  scrollX = TRUE,
                  # Enable horizontal scrolling
                  scrollY = '50vh',
                  # Enable vertical scrolling with fixed height
                  pageLength = 1000
                ))  # Number of rows per page
    })
  })
}
