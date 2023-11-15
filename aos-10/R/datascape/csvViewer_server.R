
csvViewerServer <- function(id, data) {
    moduleServer(id, function(input, output, session) {
        observeEvent(input$file1, {
            file <- input$file1
            if (is.null(file)) {
                data(read.csv("./Minsk-2019.csv"))
            } else {
                data(read.csv(file$datapath))
            }
        })

        output$table <- renderDT({
            req(data())
            datatable(data(), 
                    options = list(scrollX = TRUE,  # Enable horizontal scrolling
                                   scrollY = '50vh',  # Enable vertical scrolling with fixed height
                                   pageLength = 1000)  # Number of rows per page
          )        })
    })
}
