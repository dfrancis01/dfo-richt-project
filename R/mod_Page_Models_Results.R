#' Models Results Page
#'
#' @author Dorlan Francis
#'
#' @param id
#'
#' @return Shiny FluidPage Models Results Screen
#' @importFrom DT DTOutput
#' @noRd
#'
#' @importFrom DT DTOutput
mod_Page_Models_Results_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(
    # Multi Attribute Values Section -------------------------------------------------------

    fluidRow(
      shinydashboardPlus::box(
        title = "Multi Attribute Values"
        ,id = ns("modelReultPg-tree")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,align = "center"
        ,img(src="img/Placeholder.Desision.png", style ="max-height:150px;")#TODO:Placeholder Image for Decision Tree
      )#Box
    )#fluidRow

    # Map & Download Button Section -----------------------------------------------------
    ,fluidRow(
      shinydashboardPlus::box(
        title = "Map"
        ,id = ns("modelReultPg-map")
        ,status = "primary"
        ,solidHeader = TRUE
        ,width = 10
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,align = "center"
        #TODO:Placeholder Map Proxy
        # ,plotOutput(ns("map"))
        ,imageOutput(ns("map")) #Alternative Method
      )#Box
      ,column(width = 2,
        shiny::actionButton(inputId = ns("downloadResults"), label = "Download Results", icon = icon("file", lib = "font-awesome"), class = "btn btn-primary btn-lg btn-app-dark")
      )#column
    )#fluidRow


    # MAVF Scores Table Section ----------------------------------------------------------
    ,fluidRow(
      shinydashboardPlus::box(
        title = "MAVF Scores "
        ,id = ns("modelReultPg-MAVF")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,align = "center"
        ,DT::DTOutput(ns("data_table"))#TODO:Placeholder Random Data Table
      )#Box
    )#fluidRow


    # SAVF Scores Plot Section ---------------------------------------------------------
    ,fluidRow(
      shinydashboardPlus::box(
        title = "Breakout of Weighted SAVF "
        ,id = ns("modelReultPg-SAVF")
        ,status = "primary"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,align = "center"
        ,plotOutput(ns("horizontalBar"))#TODO:Placeholder
      )#Box
    )#fluidRow

  )#tagList
}#mod_Page_Models_Results_UI

#' Title
#'
#' @param id
#'
#' @noRd
#'
#' @importFrom ggplot2 aes geom_bar ggplot
#' @importFrom DT renderDT
#' @importFrom shinyWidgets sendSweetAlert
#'
mod_Page_Models_Results_Server <- function(id) {
  #TODO:Module Inputs {Proxy_Map, Search_Data}
  moduleServer(
    id,
    function(input, output, session) {
      ns <- session$ns #Needed if UI will be rendered server side
      #Download Button Click Event
      observeEvent(input$downloadResults, {
        #TODO: Sweet Alert Placeholder
        shinyWidgets::sendSweetAlert(
          session = session,
          title = "Information",
          type = "info",
          text = "Download Report coming soon."
        )
      })

      #TODO: Temp placeholder for Proxy Map, map image
      output$map <- renderImage({
        filename <- normalizePath(file.path('inst/www/img/Placeholder.GGPlot.Opent.Street.Map.png'))
        # Return a list containing the filename and alt text
        list(src = filename,
             height = 400,             #Note:Effective size of placeholder Map

             width = 'auto',
             alt = paste("Placeholder Openstreet Map"))

      }, deleteFile = FALSE)

      #TODO: Placeholder for search results Random DT Datatable from shinipsum
      output$data_table <- DT::renderDT({
        shinipsum::random_DT(10, 5)
      })

      #TODO: Placeholder Horizontal Bar graph ggplot test data

      output$horizontalBar <- renderPlot({
        g <- ggplot2::ggplot(ggplot2::mpg)
        g + ggplot2::geom_bar(ggplot2::aes(x = class, fill = factor(ggplot2::mpg$cyl))) + ggplot2::coord_flip()
      })

    }
  )#moduleServer
}#mod_Page_Models_Results_Server
