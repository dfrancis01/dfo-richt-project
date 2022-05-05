#' Title
#'
#' @param id
#'
#' @return fluidPage Models Results Screen
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
        # ,img(src="img/Placeholder.GGPlot.Opent.Street.Map.png", style ="max-height:150px;")#TODO:Placeholder Image for Decision Tree
        ,plotOutput(ns("image")) #did not work
        #,imageOutput(ns("image"), height = "150px") #did not work
      )#Box
      ,column(width = 2, align = "right",
        # shiny::actionButton(inputId = ns("downloadResults"), label = "Downlaod Results", icon = icon("file", lib = "font-awesome"), class = "btn btn-primary btn-lg btn-app-dark")
      tags$button(id=ns("downloadResults"), class = "action-buttonshiny-bound-input btn btn-primary btn-lg ", "Download Results")
        )
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
#'
mod_Page_Models_Results_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      output$image <- renderImage({
        # When input$n is 3, filename is ./images/image3.jpeg
        filename <- normalizePath(file.path('inst/www/img/Placeholder.GGPlot.Opent.Street.Map.png'))

        height <- session$clientData$output_plot2_height

        # Return a list containing the filename and alt text
        list(src = filename,
             height = 400,
             width = 'auto',
             alt = paste("Placeholder Openstreet Map"))

      }, deleteFile = FALSE)

      #Placeholder Random DT Datatable from shinipsum
      output$data_table <- DT::renderDT({
        shinipsum::random_DT(10, 5)
      })
      #Place Holder Horizontal Bar graph
      output$horizontalBar <- renderPlot({
        g <- ggplot2::ggplot(ggplot2::mpg)
        g + ggplot2::geom_bar(ggplot2::aes(x = class, fill = factor(ggplot2::mpg$cyl))) + ggplot2::coord_flip()
      })

    }
  )#moduleServer
}#mod_Page_Models_Results_Server
