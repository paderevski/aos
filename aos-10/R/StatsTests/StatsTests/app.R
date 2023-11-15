library(shiny)

# Define UI for application
ui <- fluidPage(
  titlePanel("AOS Math 10: Stats Tests Application Links"),
  
  # Main panel for displaying the hyperlinks
  mainPanel(
    h3("t-Test Applications"),
    p("Select a link to navigate to the respective t-Test application."),
    tags$ul(
      tags$li(tags$a(href = "https://drwhite.shinyapps.io/t-test-1/", 
                     "One Sample t-Test App", target = "_blank")),
      tags$li(tags$a(href = "https://drwhite.shinyapps.io/t-test-2/", 
                     "Two Sample t-Test App", target = "_blank")),
      tags$li(tags$a(href = "https://drwhite.shinyapps.io/t-test-3/", 
                     "Paired t-Test App", target = "_blank"))
    )
  )
)

# Define server logic (empty for this app since it's just linking to other apps)
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)
