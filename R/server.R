#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shinydashboard updateTabItems
#' @noRd
shinyServer <- function(input, output, session) {
  mod_Footer_Server("Footer_1")

  #Top Nav bar about button trigger event
  observeEvent(input$navAbout,{
    shinydashboard::updateTabItems(session, inputId = "RiCHTSidebarMenu", selected = "about")
  })

  #Model Result Page Module Server Code
  mod_Page_Models_Results_Server("Page_Models_Results_1")

  # Reactive values Search Area & Kopen zone
  # Reactive values Species Name
  # Reactive values Aquatic Features
}
