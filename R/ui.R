
#' Application User Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
#' @return Shiny UI
shinyUI <- function(session){
    tagList(
    fluidPage(
      tags$head(
        tags$script(src = "js/hello.js"),
        tags$link(rel = "stylesheet", type = "text/css", href = "css/bootstrap.Cerulean.min.css")
        ),
    # Application title
    titlePanel("Old Faithful Geyser Data"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            actionButton("jsButton",label = "Javascript Hello!", onClick="myJsHello()",class="btn-primary")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            h3("UI Linked Image"),
            img(src="img/rshiny-logo.png",width="auto", height="50px",package="RiTCH"),
            h3("Server Rendered Image"),
            imageOutput("myImage"),
        )
    )
    )#fluidpage
    )#TagList
}
