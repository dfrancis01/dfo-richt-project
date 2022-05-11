#' Species Page UI
#'
#' @author Dorlan Francis
#'
#' @description  This module returns the Species Selection Page
#'
#' @param id Modual ID character/string
#'
#' @return Shiny FluidPage  with drop down controles
#' @noRd
#'
#' @importFrom shinydashboardPlus box
mod_Page_Species_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(

    # Species Info Section -------------------------------------------------------

    shiny::fluidRow(
      shinydashboardPlus::box(
        title = "Species"
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

    # Specie Input Section ----------------------------------------------------
    , shiny::fluidRow(
      shinydashboardPlus::box(
        title = span(icon("fish", lib = "font-awesome", class = "fa"),"Select Species")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,mon_Species_Selector_UI(ns("Species_Selector_1"))
      )#box
    )#fluidRow

  )#tagList
}#mod_Species_UI

#' Species Page Server
#'
#' @param id
#'
#' @return list of ORDER,FAMILY,SCIENTIFIC,COMMON
#'
#' @noRd
#'
mod_Page_Species_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      ns <-session$ns
      mod_Species_Selector_Server("Species_Selector_1")
    }
  )#moduleServer
}#mod_Page_Species_Server
