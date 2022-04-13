#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
# @importFrom datasets datasets::faithful
#' @importFrom graphics hist
shinyServer <- function(input, output, session) {
  mod_Footer_Server("ritchFooter")
}
