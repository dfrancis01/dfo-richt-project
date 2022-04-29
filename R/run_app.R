
#' Run Shiny App
#'
#' @author Dorlan Francis
#'
#' @param port numeric specify port number
#' @param host character specify host name
#'
#' @export
#'
#' @importFrom shiny shinyApp
run_app <- function(host=NULL, port = NULL){
  if(!is.null(host)) options(shiny.host = as.character(host))
  if(!is.null(port)) options(shiny.port = as.integer(port))
  shiny::shinyApp(ui = shinyUI, server = shinyServer)
}
