#' About Model Search Info Page
#'
#' @author Dorlan Francis
#'
#' @description  This module returns the Primary Research info Page#'
#'
#' @param id Modual ID character/string
#'
#' @return  Shiny FluidPage Model Search Info Page
#' @noRd
#'
#' @importFrom shinydashboardPlus box
mod_Page_Model_Info_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(
    # Model Info Section -------------------------------------------------------

    fluidRow(
      shinydashboardPlus::box(
        title = "Models"
        # ,id = ns("researchPg-tool")
        ,status = "primary"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
      # )#column
    )#fluidRow

    # Delineation Processes Threats Habitat Suiablility Section ----------------------------------------------------
    , fluidRow(
      class = "richt-info-box"
      ,shinydashboardPlus::box(
        title = span(img(src = "img/Delineation_Card_Icon.svg", class = "info-head-icon"),"Delineation")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 3
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
      ,shinydashboardPlus::box(
        title = span(img(src = "img/Process_Card_Icon.svg", class = "info-head-icon"),"Processes")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 3
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
      ,shinydashboardPlus::box(
        title = span(img(src = "img/Threats_Card_Icon.svg", class = "info-head-icon"),"Threats")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 3
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
      ,shinydashboardPlus::box(
        title = span(img(src = "img/Habitat_Suitability_Card_Icon.svg", class = "info-head-icon"),"Habitat Suitability")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 3
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
    )#fluidRow
  )#tagList
}#mon_Model_Info_UI

#TODO Unused Server Compononent
# mod_Page_Model_Info_Server <- function(id) {
#   moduleServer(
#     id,
#     function(input, output, session) {
#
#     }
#   )#moduleServer
# }#mon_Page_Model_Info_Server
