
dataGraphUI <- function(id) {
    ns <- NS(id)
    fluidPage(
      checkboxGroupInput(ns("columns"), "Choose columns to plot:",
                         choices = NULL, 
                         selected = NULL,
                         inline = TRUE),
        plotOutput(ns("plot1")),
        plotOutput(ns("plot2")),
        plotOutput(ns("plot3"))
        
    )
}
