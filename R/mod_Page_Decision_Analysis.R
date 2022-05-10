#' About Decision Analysis Page
#'
#' @author Amanda Caskenette
#'
#' @description  This module returns the Decision Analysis Page
#'
#' @param id Modual ID character/string
#'
#' @return Shiny FluidPage Decision Analysis Page
#' @noRd
#'
#' @importFrom shinydashboardPlus box
mod_Page_Decision_Analysis_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(

    # Decision_Analysis Info Section -------------------------------------------------------


    shiny::fluidRow(
      shinydashboardPlus::box(
        title = "Decision Analysis"
        ,status = "primary"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
        ,p(lorem)#p
      )#box
    )#fluidRow

    # Decision Analysis Tool Section ----------------------------------------------------
    , shiny::fluidRow(
      shinydashboardPlus::box(
        title = "Decision Analysis Tool"
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,h1(class = "text-danger text-center","Under Development")
      )#box
    )#fluidRow

  )#tagList
}#mod_Decision_Analysis_UI

#TODO Not used
# mod_Decision_Analysis_Server <- function(id) {
#   moduleServer(
#     id,
#     function(input, output, session) {
#
#     }
#   )#moduleServer
# }#mod_Page_Decision_Analysis_Server
