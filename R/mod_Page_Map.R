#' Map Page UI
#'
#' @author Dorlan Francis
#'
#' @description  This module returns the Map Page
#'
#' @param id Modual ID character/string
#'
#' @return Shiny FluidPage  with Designatable (Leaflet) Map  Search Area Input
#' @noRd
#'
#' @importFrom shinydashboardPlus box
mod_Page_Map_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(
    mod_Leaflet_Map_UI(ns("Leaflet_Map_1"))
  )#fluidPage
}#mod_Species_UI

#' Map Page Server
#'
#' @param id
#'
#' @return list of Map Boundaries and Köppen-Geige
#'
#' @noRd
#'
mod_Page_Map_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      ns <-session$ns
      mod_Leaflet_Map_Server("Leaflet_Map_1")
    }
  )#moduleServer
}#mod_Page_Map_Server
