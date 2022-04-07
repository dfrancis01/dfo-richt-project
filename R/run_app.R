
#' Run Shiny App
#'
#' @export
#'
#' @importFrom shiny shinyApp
run_app <- function(){
  shiny::shinyApp(ui = shinyUI, server = shinyServer)
}
