

dataGraphUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    tags$h3("Visualize Data"),
    tags$p(
      "Once you have loaded data you can graph it here. Select up to 3 datasets
             and they will be plotted as histograms, box-plots and QQ-plots. The histogram
             is useful to visualize the general shape of the data distribution. The box-plot
             shows the data range of quartile 1 through quartile 3, plus the median and
             extent of any outliers. The QQ plot can be used to assess the degree to which the
             samples are normally distributed."
    ),
    textOutput("status"),
    checkboxGroupInput(
      ns("columns"),
      "Choose columns to plot:",
      choices = NULL,
      selected = NULL,
      inline = TRUE
    ),
    plotOutput(ns("plot1")),
    plotOutput(ns("plot2")),
    plotOutput(ns("plot3"))
    
  )
}
