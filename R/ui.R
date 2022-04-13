
#' Application User Interface
#'
#' @param session
#'
#' @import shiny
#' @import shinydashboard
#' @importFrom  shinydashboardPlus dashboardHeader dashboardSidebar dashboardPage dashboardFooter taskItem notificationItem messageItem
#' @noRd
#' @return Shiny UI

shinyUI <- function(session){
    shinydashboardPlus::dashboardPage(
        title = "RiTCH",
        shinydashboardPlus::dashboardHeader(title = mod_Title_Logo_UI("ritchLogo")),
        shinydashboardPlus::dashboardSidebar(),
        shinydashboard::dashboardBody(
            tags$head(
              tags$link(rel = "icon", type="image/png", href="img/RiCHT_16x16px.png"),
              tags$link(rel = "stylesheet", type = "text/css", href = "css/RiTCH.css"))
        )#dashboardBody
        ,footer = shinydashboardPlus::dashboardFooter(
          left = mod_Footer_UI("ritchFooter"),
          right = NULL
        )#dashboardFooter
    )#DashboardPage
}#UI
