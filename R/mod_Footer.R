#' App Footer Module UI Code
#'
#' @param id Unique id use with ns()
#'
#' @return HTML div wrapper for footer elements
#' @noRd
mod_Footer_UI <- function(id) {
  ns <- NS(id)
      div(class="footer-wrapper",
          p(class='footer-build', "Build:", textOutput(ns("buildNumber"), inline = TRUE)),
          p(class='footer-copyright','\u00A9 2022'),
          img(src="img/canada_c_314x75px.png", height = "40px", width="auto")
     )#div
}#mod_Footer_UI

#' App Footer Module Server Code
#'
#' @param id Unique id use with ns()
#
#' @importFrom utils packageName packageVersion
mod_Footer_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      #Get package name and build number and render UI
      packName <- utils::packageName()

      output$buildNumber <- renderText({
        #as.character(packageVersion(packName))
        packName %>% utils::packageVersion() %>% as.character()
      })

      #TODO:Get package copyright year and render UI
    }
  )#moduleServer
}#mod_Footer_Server
