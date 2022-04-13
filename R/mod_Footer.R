#' App Footer Module UI
#'
#' @param id Unique id use with ns()
#'
#' @return HTML div wrapper for footer elements
#' @noRd
mod_Footer_UI <- function(id) {
  ns <- NS(id)
      div(class="footer-wrapper",
          htmlOutput(ns("build")),                   #Build number from server
          p(class='footer-copyright','\u00A9 2022'),
          img(src="img/canada_c_314x75px.png", height = "50px", width="auto")
     )#div
}#mod_Footer_UI

#' App Footer Module Server
#'
#' @param id Unique id use with ns()
#
#' @importFrom utils packageName packageVersion
mod_Footer_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      #Get package name and build number and render UI
      packName <- packageName()
      output$build <- renderUI({
        HTML(paste0("<p class='footer-build'>Build:", packageVersion(packName),"</p>"))
      })

      #Get package copyright year and render UI
    }
  )#moduleServer
}#mod_Footer_Server
