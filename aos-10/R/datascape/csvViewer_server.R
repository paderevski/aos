
csvViewerServer <- function(id, loaded_data) {
    moduleServer(id, function(input, output, session) {
        observeEvent(input$file1, {
            file <- input$file1
            if (is.null(file)) {
                loaded_data(read.csv("./Minsk-2019.csv"))
            } else {
                loaded_data(read.csv(file$datapath))
            }
        })

        observeEvent(input$dataset, {
          cat("DATASET: ", input$dataset, "\n")
          if (input$dataset == "") {
            return;
          } else {
            data(list = input$dataset)
            loaded_data(get(input$dataset))
            cat("Dataset loaded\n")
          }
        })
        
        output$table <- renderDT({
            req(loaded_data())
            datatable(loaded_data(), 
                    options = list(scrollX = TRUE,  # Enable horizontal scrolling
                                   scrollY = '50vh',  # Enable vertical scrolling with fixed height
                                   pageLength = 1000)  # Number of rows per page
          )        })
    })
}
