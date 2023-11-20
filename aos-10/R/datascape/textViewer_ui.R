textViewerUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Enter data"),
    tags$p("Enter up to 3 datasets below. Each dataset must be one-dimensional, numeric
           and with entries separated by whitespace or commas. Once entered, click on 
           \"Load Data\" to parse and store your data. Check the tables to ensure your
           data looks as expected."),
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

