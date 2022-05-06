#' About Primary Research Info Page
#'
#' @author Dorlan Francis
#'
#' @description  This module returns the Primary Research info Page
#'
#' @param id Modual ID character/string
#'
#' @return HTML Tags
#'
#' @importFrom shinydashboardPlus box
mod_Page_Primary_Research_Info_UI <- function(id) {
  ns <- NS(id)
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
        title = span(icon("fish", lib = "font-awesome", class = "fa-lg"),"Species")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 4
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
      ,shinydashboardPlus::box(
        title = span(icon("search-location", lib = "font-awesome", class = "fa-lg"),"Designatable Unit")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 4
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
      )#Box
      ,shinydashboardPlus::box(
        title = span(icon("water", lib = "font-awesome", class = "fa-lg"),"Aquatic Features")
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
}#mod_Page_Primary_Research_Info_UI

#TODO Not used
# mod_Page_Primary_Research_Info_Server <- function(id) {
#   moduleServer(
#     id,
#     function(input, output, session) {
#
#     }
#   )#moduleServer
# }#mod_Page_Primary_Research_Info_Server
