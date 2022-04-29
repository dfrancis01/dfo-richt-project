#' About Page
#'
#' @author Dorlan Francis
#'
#' @description This module returns the about page
#'
#' @param id Modual ID character/string
#'
#' @return HTML Tags
#'
#' @importFrom shinydashboardPlus box
mod_About_Page_UI <- function(id) {
  ns <- NS(id)
  tagList(

# Tool Info Section -------------------------------------------------------


  fluidRow(
    shinydashboardPlus::box(
      title = "Riparian Critical Habitat Tool"
      ,id = ns("aboutPg-tool")
      ,status = "primary"
      ,solidHeader = TRUE
      ,width = 12
      ,collapsible = TRUE
      ,headerBorder = TRUE
      ,fluidRow(class="aboutPg-info",
        column(width = 2, align = "center",
          tags$img(class="aboutPg-info-img", src = "img/RiCHT_240x278.png", width=240)#img
        )#column
        ,column(width = 10
        ,div(
          class = "aboutPg-info-about"
          ,p("The goal of the Riparian Critical Habitat Tool (RiCHT) is to provide quantitative evidence to support the delineation of riparian Critical Habitat. The tool provides an interface for a searchable database containing the current state of knowledge regarding the relationships between the riparian zone (attributes and processes), aquatic features, and aquatic species at risk.")
          ,a(href="https://doi.org/10.1186/s13750-021-00231-1","Evidence of effect of riparian attributes on listed freshwater fishes and mussels and their aquatic critical habitat: a systematic map protocol")
        )#div
        )#column
      )#fluidRow
      )#Box
    # )#column
  )#fluidRow

# Contributors Section ----------------------------------------------------
  , fluidRow(
    shinydashboardPlus::box(
      title = "Contributors"
      ,id = ns("aboutPg-contributors")
      ,status = "info"
      ,solidHeader = TRUE
      ,width = 12
      ,collapsible = TRUE
      ,headerBorder = TRUE
      ,fluidRow(class = "aboutPg-contributors",
          column(width=4,
          tags$ul(
            tags$li("Lead Investigators")
            ,tags$li("Amanda Caskenette")
            ,tags$li("Eva Enders")
            ,tags$li("New Boss")
          )#ul
        )#column
       , column(width=4,
          tags$ul(
            tags$li("System Map Contributors")
            ,tags$li("Amanda Caskenette")
            ,tags$li("Travis Durhack")
            ,tags$li("Brenley Yuan")
            ,tags$li("Sarah Hynka")
            ,tags$li("Colin Kovachick")
          )#ul
        )#column
        ,column(width=4,
          tags$ul(
            tags$li("App Development")
            ,tags$li("Dorlan Francis")
            ,tags$li("Amanda Caskenette")
          )#ul
        )#column
        )#flluidRow
    )#Box
  )#fluidRow

# Development Section -----------------------------------------------------
  ,fluidRow(
    shinydashboardPlus::box(
      title = "Development"
      ,id = ns("aboutPg-Development")
      ,status = "primary"
      ,solidHeader = TRUE
      ,width = 12
      ,collapsible = TRUE
      ,headerBorder = TRUE
      ,tags$ul(class="aboutPg-Development-logos",
        tags$li(
          tags$img(src = "img/rshiny-logo.png", alt="")
          ,tags$p("Shiny")
          ,tags$span("28.04.2018")
        )
        ,tags$li(
          tags$img(src = "img/usethis_logo.png", alt="")
          ,tags$p("Usethis")
          ,tags$span("2.0.0")
        )
        ,tags$li(
          tags$img(src = "img/Docker_Logo.jpg", alt="")
          ,tags$p("Docker")
          ,tags$span("20.10.7")
        )
        ,tags$li(
          tags$img(src = "img/shinyDashBoardPlus_Logo.jpg", alt="")
          ,tags$p("ShinyDashBoard+")
          ,tags$span("2.0.3")
        )
        ,tags$li(
          tags$img(src = "img/geohelm-leafletjs.gif", alt="")
          ,tags$p("Leaflet")
          ,tags$span("2.1.1")
        )
      )#ul
      ,div(class = "aboutPg-Development"
    ,h3("Documentation")
    ,p ("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laboru")
      )#div
    )#box
  )#fluidRow
  )#tagList
}#mod_About_Page_UI

#TODO Not used
# mod_About_Page_Server <- function(id) {
#   moduleServer(
#     id,
#     function(input, output, session) {
#
#     }
#   )#moduleServer
# }#mod_About_Page_Server


#Note: for a function file from:https://stackoverflow.com/questions/61711777/how-to-create-an-adaptative-list-ulli-using-htmltools
# #using ul$children
# warns <- c("warning 1", "warning 2", "warning 3", "warning 4")
# ul <- tags$ul()
# ul$children <- purrr::map(warns, function(.x) tags$li(.x))
#
# #OR
#
# # generating everything at once
# warns <- c("warning 1", "warning 2", "warning 3", "warning 4")
# ul <- tags$ul(
#   purrr::map(warns, function(.x) tags$li(.x))
# )
