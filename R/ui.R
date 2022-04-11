
#' Application User Interface
#'
#' @param session
#'
#' @import shiny
#' @import shinydashboard
#' @import shinydashboardPlus
#' @noRd
#' @return Shiny UI
mycss<-"
/*Atmel logo override*/
.main-header .logo {
  padding: 0;
}
/*
#ritchLogoText{
    color: red;
}
*/ Debug
span[id = 'ritchLogoText']:nth-letter(1){
  font-weight: bold;
  color: red;
}
"



shinyUI <- function(session){
    shinydashboardPlus::dashboardPage(
        title = "RiTCH",
        shinydashboardPlus::dashboardHeader(title = mod_Title_Logo_UI("ritchLogo")),
        shinydashboardPlus::dashboardSidebar(),
        shinydashboard::dashboardBody(
            tags$head(
              tags$link(rel = "icon", type="image/png", href="img/RiCHT_16x16px.png"),
              tags$link(rel = "stylesheet", type = "text/css", href = "css/RiTCH.css"))
            # tags$head(tags$style(HTML(mycss))),
        )
    )
}
