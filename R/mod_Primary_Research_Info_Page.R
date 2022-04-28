#' About Primary Research Info Page
#'
#' @description  This module returns the Primary Research info Page
#'
#' @param id Modual ID character/string
#'
#' @return HTML Tags
#'
#' @importFrom shinydashboardPlus box
mod_Primary_Research_Info_Page_UI <- function(id) {
  ns <- NS(id)
  lorem <- "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia dignissim dapibus. Nulla ut sem elementum, scelerisque odio a, ultrices turpis."
  tagList(

    # Primary Research Info Section -------------------------------------------------------


    fluidRow(
      shinydashboardPlus::box(
        title = "Primary Research"
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

    # Species Designatable Unit Aquatic Features Section ----------------------------------------------------
    , fluidRow(
      shinydashboardPlus::box(
        title = span(icon("fish", lib = "font-awesome"),"Species")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 4
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
      ,shinydashboardPlus::box(
        title = span(icon("search-location", lib = "font-awesome"),"Designatable Unit")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 4
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
      ,shinydashboardPlus::box(
        title = span(icon("water", lib = "font-awesome"),"Aquatic Features")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 4
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
    )#fluidRow

  )#tagList
}#mod_Primary_Research_Info_Page_UI

#TODO Not used
# mod_Primary_Research_Info_Page_Server <- function(id) {
#   moduleServer(
#     id,
#     function(input, output, session) {
#
#     }
#   )#moduleServer
# }#mod_Primary_Research_Info_Page_Server
