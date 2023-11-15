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
                           "23, 25, 26, 27, 21, 19, 18, 30, 31, 32, 33, 27",
                           rows=5)),
      column(4,    textAreaInput(ns("numbers_z"), 
                                 "Z (optional)",
                                 "1, 2, 3, 6, 7",
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

