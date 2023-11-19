textViewerUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$p("Enter data observations (separated by spaces, commas, or newlines)"),
    fluidRow(
      column(4, 
             textAreaInput(ns("numbers_x"), 
                           "X",
                           "20, 22, 23, 24, 25, 21, 20, 23, 24",
                           rows=5)),
      column(4,
             textAreaInput(ns("numbers_y"), 
                           "Y (optional)",
                           "20, 22, 23, 29, 35,11, 40, 43, 24",
                           rows=5)),
      column(4,    textAreaInput(ns("numbers_z"), 
                                 "Z (optional)",
                                 "28, 42, 33, 34, 45, 51, 20, 23, 24",
                                 rows=5))
    ),
    fluidRow(
      column(2,
             actionButton(ns("parse_text"), "Load Data")),
      column(2,
             actionButton(ns("clear_text"), "Clear Text"))
    ),
    tags$hr(),
    DTOutput(ns("table"))
  )
}

