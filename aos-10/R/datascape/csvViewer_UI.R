
csvViewerUI <- function(id) {
    ns <- NS(id)
    fluidPage(
        fileInput(ns("file1"), "Choose CSV File",
                  accept = c(
                    "text/csv",
                    "text/comma-separated-values,text/plain",
                    ".csv")),
        DTOutput(ns("table"))
    )
}
