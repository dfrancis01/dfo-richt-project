#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shinydashboard updateTabItems
#' @noRd
#'
shinyServer <- function(input, output, session) {
  mod_Footer_Server("Footer_1")

  #Top Nav bar about button trigger event
  observeEvent(input$navAbout,{
    shinydashboard::updateTabItems(session, inputId = "RiCHTSidebarMenu", selected = "about")
  })

  # Reactive values Search Area & Köppen zone
  mod_Page_Map_Server(id = "Page_Map_1")

  # Reactive values Species Name
  mod_Page_Species_Server(id = "Page_Species_1")

  # Reactive values Aquatic Features

  #Model Result Page Module Server Code
  mod_Page_Models_Results_Server(id = "Page_Models_Results_1")
}
