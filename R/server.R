#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
# @importFrom datasets datasets::faithful
#' @importFrom graphics hist
shinyServer <- function(input, output, session) {
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- datasets::faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        graphics::hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

    output$myImage <- renderImage(deleteFile = FALSE,{
      list(src = system.file("www/img/rshiny-logo.png", package = "RiTCH"),
           height = "auto",
           width = "50px",
           contentType = 'image/png',
           alt = "This is alternate text")
    })


}
