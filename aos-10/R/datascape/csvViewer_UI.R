csvViewerUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Load data file"),
    tags$p(
      "You can load a comma-separated (csv) text file in this pane. Your CSV file
           should contain data in columns. Numerical columns will be available in the
           analysis panes. Text columns are ignored. All data columns should have
           a header containing the column name. Columns do not have to have the
           same length or number of entries."
    ),
    fileInput(
      ns("file1"),
      "Choose CSV File",
      accept = c(
        "text/csv",
        "text/comma-separated-values,text/plain",
        ".csv"
      )
    ),
    DTOutput(ns("table"))
  )
}
