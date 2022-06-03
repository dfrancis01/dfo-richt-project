#' About Primary Research Info Page
#'
#' @author Dorlan Francis
#'
#' @description  This module returns the Primary Research info Page
#'
#' @param id Modual ID character/string
#'
#' @return Shiny FluidPage Primary Research Info Page
#' @noRd
#'
#' @importFrom shinydashboardPlus box
mod_Page_Primary_Research_Info_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(

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
        title = span(icon("search-location", lib = "font-awesome", class = "fa-lg"),"Designatable Unit")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 4
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
        ,div(class="text-center",
             shiny::actionButton(
               inputId = ns("goDesignatableUnit")
               ,label="Designatable Unit")#action button
        )#div center button
      )#Box
      ,shinydashboardPlus::box(
        title = span(icon("fish", lib = "font-awesome", class = "fa-lg"),"Species")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 4
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,p(lorem)#p
        ,p(lorem)#p
        ,div(class="text-center",
          shiny::actionButton(inputId = ns("goSpecies"), label="Species")
        )#div center button
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
        ,div(class="text-center",
          shiny::actionButton(inputId = ns("goAquaticFeatures"), label="Aquatic Features")
        )#div center button
      )#Box
    )#fluidRow

  )#tagList
}#mod_Page_Primary_Research_Info_UI

#' Title
#'
#' @param id
#' @returns map, species, features click events in list 'events'
#' @noRd
mod_Page_Primary_Research_Info_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      events <- list(
        map = reactive(input$goDesignatableUnit),
        species = reactive(input$goSpecies),
        features = reactive(input$goAquaticFeatures)
        )#list

      return(events)

    }#function
  )#moduleServer
}#mod_Page_Primary_Research_Info_Server
