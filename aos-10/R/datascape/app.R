library(shiny)
library(DT)
library(ggplot2)
library(ggsci)

# Source the module files
source("csvViewer_UI.R")
source("csvViewer_server.R")
source("dataGraph_UI.R")
source("dataGraph_server.R")
source("tTest_UI.R")
source("tTest_server.R")
source("tTest2_UI.R")
source("tTest2_server.R")
source("tTest2P_UI.R")
source("tTest2P_server.R")
source("wTest_UI.R")
source("wTest_server.R")
source("wTest2_UI.R")
source("wTest2_server.R")
source("wTest2P_UI.R")
source("wTest2P_server.R")
source("textViewer_ui.R")
source("textViewer_server.R")
source("anovaOne_UI.R")
source("anovaOne_server.R")
source("anovaKW_UI.R")
source("anovaKW_server.R")
source("chiSquare_GOF_UI.R")
source("chiSquare_GOF_server.R")
source("chiSquare_indy_UI.R")
source("chiSquare_indy_server.R")

ui <- fluidPage(
  tags$head(tags$script(src = "./showMore.js")),
  titlePanel("DataScape"),
  
  tags$p("A data exploration application"),
  tabsetPanel(
    tabPanel("Enter Data", textViewerUI("textViewer")),
    tabPanel("Load CSV", csvViewerUI("csvViewer")),
    tabPanel("Visualize Data", dataGraphUI("dataGraph")),
    tabPanel(
      "Analyze Statistics",
      sidebarLayout(
        sidebarPanel(
          radioButtons(
            "tTestType",
            "Choose Statistics Test:",
            choices = c(
              "One Sample T-test" = "oneSampleT",
              "Two Sample T-test" = "twoSampleT",
              "Paired T-test" = "pairedT",
              "One Sample Wilcoxon Signed-Rank Test" = "oneSampleWilcox",
              "Two Sample Mann-Whitney U Test" = "twoSampleWilcox",
              "Paired Wilcoxon Signed-Rank Test" = "pairedWilcox",
              "One-way ANOVA" = "anova_one",
              "Non-parametric ANOVA" = "anova_kw",
              "Chi-square GOF" = "chi_square_gof",
              "Chi-square Independence" = "chi_square_indy"
            )
            
          )
        ),
        mainPanel(
          conditionalPanel(condition = "input.tTestType == 'oneSampleT'",
                           tTestUI("tTest")),
          conditionalPanel(condition = "input.tTestType == 'twoSampleT'",
                           tTest2UI("tTest2")),
          conditionalPanel(condition = "input.tTestType == 'pairedT'",
                           tTest2PUI("tTest3")),
          conditionalPanel(condition = "input.tTestType == 'oneSampleWilcox'",
                           wTestUI("wTest")),
          conditionalPanel(condition = "input.tTestType == 'twoSampleWilcox'",
                           wTest2UI("wTest2")),
          conditionalPanel(condition = "input.tTestType == 'pairedWilcox'",
                           wTest2PUI("wTest3")) ,
          conditionalPanel(condition = "input.tTestType == 'anova_one'",
                           anovaOneUI("anova1")),
          conditionalPanel(condition = "input.tTestType == 'anova_kw'",
                           anovaKWUI("anovaKW")),
          conditionalPanel(condition = "input.tTestType == 'chi_square_gof'",
                           chiSquareGOFUI("chisquaregof")),
          conditionalPanel(condition = "input.tTestType == 'chi_square_indy'",
                           chiSquareIndyUI("chisquareindy"))
        )
      )
    ),
    tabPanel("About",
             fluidPage(
               h3("About DataScape"),
               p(
                 "DataScape is a data exploration application designed to help students and
                               scientists analyze their experimental data. It has been designed
                               using R and the shiny package, so all the statistical results
                               are professional grade and use the most up-to-date algorithms. The
                               app is designed to make it easy to perform a group of
                               related calculations in just a few clicks. On the other hand,
                               detailed statistical analyses should be continued in R or
                               similar software because this app does not provide
                               extensive options to customize output or further analyze data."
               ),
               p(
                 "Currently this should be considered BETA software, particularly when
                               it comes to catching errors or unexpected inputs. Please
                               report any errors to the creator."
               ),
               p("Created by: Dr. Patrick White, Academies of Loudoun"),
               p("For more information, email: "),
               a(href = "mailto:pwhite2@lcps.org", "Patrick White"),
             ))
  )
)

server <-
  function(input, output, session) {
    data <- reactiveVal()
    
    textViewerServer("textViewer", data)
    csvViewerServer("csvViewer", data)
    dataGraphServer("dataGraph", data)
    tTestServer("tTest", data)
    tTest2Server("tTest2", data)
    tTest2PServer("tTest3", data)
    wTestServer("wTest", data)
    wTest2Server("wTest2", data)
    wTest2PServer("wTest3", data)
    anovaOneServer("anova1", data)
    anovaKWServer("anovaKW", data)
    chiSquareGOFServer("chisquaregof", data)
    chiSquareIndyServer("chisquareindy", data)
  }

shinyApp(ui = ui, server = server)
