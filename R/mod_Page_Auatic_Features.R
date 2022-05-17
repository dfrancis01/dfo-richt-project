#' Aquatic Features Page UI
#'
#' @author Dorlan Francis
#'
#' @description  This module returns the Aquatic Features Selection Page
#'
#' @param id Modual ID character/string
#'
#' @return Shiny FluidPage  with drop down controles
#' @noRd
#'
#' @importFrom shiny fluidPage
#' @importFrom shinydashboardPlus box
#' @importFrom shinyWidgets pickerInput
#'
mod_Page_Aquatic_Features_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(

    # Aquatic Features Info Section -------------------------------------------------------

    shiny::fluidRow(
      shinydashboardPlus::box(
        title = "Aquatic Features"
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

    # Aquatic Features Input Section ----------------------------------------------------
    , shiny::fluidRow(
      shinydashboardPlus::box(
        title = span(icon("water", lib = "font-awesome", class = "fa"),"Select Aquatic Features")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = FALSE
        ,headerBorder = TRUE
        ,shinyWidgets::pickerInput(
          inputId = ns("featuresPicker"),
          label = "Select all features of interest",
          choices = c("Features 1", "Features 2","Features 3","Features 4"),
          options = list(
            `actions-box` = TRUE,                   #Select/Deselect All action buttons
            size = 'auto',                          #size auto try to fit all options on the screen
            `selected-text-format` = "count > 9"    #Number of selections that appear before switching to count
          ),
          multiple = TRUE                           #Select multiple options at once
        )
      )#box
    )#fluidRow

  )#tagList
}#Page_Aquatic_Features_UI


# Server Section ----------------------------------------------------------


#' Aquatic Features Page Server
#'
#' @param id
#'
#' @return list of AquaticFeatures
#'
#' @noRd
#'
mod_Page_Species_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      ns <-session$ns

    }
  )#moduleServer
}#mod_Page_Species_Server
