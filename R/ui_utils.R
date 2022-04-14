#' Header Links
#'
#' @description This utility function is where all html links made in the `<head>`  tag will be placed.
#' @return HTML Header Tag with link tags for Favicon, CSS, Javascript
#' @examples
#' shinydashboard::dashboardBody(
#'  headerLinks(), ...
headerLinks <- {
  tags$head(
    tags$link(rel = "icon", type="image/png", href="img/RiCHT_16x16px.png"),
    tags$link(rel = "icon", type="image/png", href="img/RiCHT_32x32px.png"),
    tags$link(rel = "stylesheet", type = "text/css", href = "css/RiTCH.css")
  )
}
