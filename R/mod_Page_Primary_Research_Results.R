#' Primary Research Results Page UI
#'
#' @author Dorlan Francis
#'
#' @param id
#'
#' @return Shiny FluidPage Primary Research Results Screen
#' @noRd
#'
#'
mod_Page_Primary_Research_Results_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(

    # Results Summary Section -------------------------------------------------------
     shiny::fluidRow(
       class = "primary-results-summary",
      shinydashboardPlus::box(
        title = "Results Summary"
        ,id = ns("primaryReultPg-Summary")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        #,align = "center"
        ,shiny::fluidRow(
          #Species Results Box ----------------------------------------------------
          shinydashboardPlus::box(
            title = span(icon("fish", lib = "font-awesome", class = ""),"Species")
            ,status = "info"
            ,solidHeader = TRUE
            ,width = 4
            ,collapsible = TRUE
            ,headerBorder = TRUE
            #TODO replace mock-up with redertext output
            ,div(class="results-box",
              div(
                strong("Common Name:")#strong
                ,span("Atlantic sturgeon")
              )
              ,hr()
              ,div(
                strong("Scientific Name:")#strong
                ,span("Acipenser oxyrhynchus")
              )
              ,hr()
              ,div(
                strong("Family:")#strong
                ,span("ACIPENSERIDAE")
              )
              ,hr()
              ,div(
                strong("Order:")#strong
                ,span("ACIPENSERIFORMES")
              )
            )#div.results-box
          )#Box
          #Designatable Unit Results Box --------------------------------------------------------------
          ,shinydashboardPlus::box(
            title = span(icon("search-location", lib = "font-awesome", class = ""),"Designatable Unit")
            ,status = "info"
            ,solidHeader = TRUE
            ,width = 4
            ,collapsible = TRUE
            ,headerBorder = TRUE
            ,div(class="results-box",
                 div(
                   strong("Within Boundaries:")#strong
                   ,span("Xmin:###.##### Ymin:###.##### Xmax:###.##### Ymax:###.#####")
                 )
                 ,hr()
                 ,div(
                   strong("Köppen-Geiger climate Zome:")#strong
                   ,span("Dfb")
                 )
            )#div.results-box
          )#Box
          #Aquatic Features Results Box ----------------------------------------------------
          ,shinydashboardPlus::box(
            title = span(icon("water", lib = "font-awesome", class = ""),"Aquatic Features")
            ,status = "info"
            ,solidHeader = TRUE
            ,width = 4
            ,collapsible = TRUE
            ,headerBorder = TRUE
            ,div(class="results-box",
                 div(
                   strong("Slope:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Riparian vegetation:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Soil composition:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Canopy cover:")#strong
                   ,span("###")
                 )
            )#div.results-box
          )#Box
        )#fluidRow
        ,h3("Total: ###,###,###,###")
      )#Box
    )#fluidRow

    # Map, Preview Table & Download Results Button Section ---------------------
    ,shiny::fluidRow(
      class="primary-results-map",
      shinydashboardPlus::box(
        title = "Map"
        ,id = ns("primaryReultPg-map")
        ,status = "primary"
        ,solidHeader = TRUE
        ,width = 8
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,align = "center"
        ,leafletOutput(ns("map"))

      )#Box
      #Action buttons Table Preview & Resutls Download
      ,column(width = 4,
              shiny::actionButton(inputId = ns("previewResults")
                        ,label = "Preview Full Results Table"
                        ,icon = icon("eye", lib = "font-awesome")
                        ,class = "btn btn-primary btn-block btn-app-dark")
              ,shiny::actionButton(inputId = ns("downloadResults")
                        ,label = "Download Results"
                        ,icon = icon("file-download",lib = "font-awesome")
                        ,class = "btn btn-primary btn-block btn-app-dark")
      )#column
    )#fluidRow

    # Primary Research Table Section ----------------------------------------------------------
    ,fluidRow(
      shinydashboardPlus::box(
        title = "Primary Search"
        ,id = ns("primaryReultPg-Primary-Results")
        ,status = "info"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,align = "center"
        ,DT::DTOutput(ns("data_table"))#TODO:Placeholder Random Data Table
      )#Box
    )#fluidRow

    # Diagnostics Section ---------------------------------------------------------
    ,fluidRow(
      shinydashboardPlus::box(
        title = "Diagnostics"
        ,id = ns("primaryReultPg-Diagnotics")
        ,status = "primary"
        ,solidHeader = TRUE
        ,width = 12
        ,collapsible = TRUE
        ,headerBorder = TRUE
        ,align = "center"
        ,shinydashboardPlus::box(
          title = "Riparian Widths Examined"
          ,id = ns("primaryReultPg-Riparian_Width")
          ,status = "primary"
          ,solidHeader = TRUE
          ,width = 6
          ,collapsible = FALSE
          ,headerBorder = TRUE
          ,align = "center"
          ,plotOutput(ns("riparianWidths"))#TODO:Placeholder
        )#Box Riparian Widths
        ,shinydashboardPlus::box(
          title = "Koppen Geiger Climate Zones"
          ,id = ns("primaryReultPg-Koppen_Zone")
          ,status = "primary"
          ,solidHeader = TRUE
          ,width = 6
          ,collapsible = FALSE
          ,headerBorder = TRUE
          ,align = "center"
          ,plotOutput(ns("koppenZones"))#TODO:Placeholder
        )#Box Riparian Widths
      )#Box
    )#fluidRow

  )#fluidPage
}#mod_Page_Primary_Research_Results_UI

# Server Section ------------------------------------------------------------------

#' Primary Research Results Page Server
#'
#' @param id
#'
#' @noRd
#'
#' @importFrom shinipsum random_ggplot
#' @importFrom DT renderDT
#' @importFrom shinyWidgets sendSweetAlert
#' @importFrom leaflet renderLeaflet setView
#'
mod_Page_Primary_Research_Results_Server <- function(id) {
  #TODO:Module Inputs {Proxy_Map, Results_Data}
  moduleServer(
    id,
    function(input, output, session) {
      ns <- session$ns #Needed if UI will be rendered server side

      #Preview Button Click Event
      observeEvent(input$previewResults, {
        #TODO: Sweet Alert Placeholder
        shinyWidgets::sendSweetAlert(
          session = session,
          title = "Information",
          type = "info",
          text = "Preview Results coming soon."
        )
      })

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

      #TODO: Temp placeholder for Proxy Map
      output$map <- leaflet::renderLeaflet({
        leaflet() %>%
          leaflet::addTiles() %>%
          leaflet::setView(lat=45.424721, lng=-75.695000, zoom=11)
      })

      # TODO: Placeholder for search results Random Datatable from shinipsum
      # Title, DOI, Publication Year, Species, Koppen-Geiger Climate Zone, and
      # Aquatic Feature
      output$data_table <- DT::renderDT({
        shinipsum::random_DT(10, 5)
      })

      #TODO: Placeholder Riparian Widths Random Plot from shinyipsum
      output$riparianWidths <- renderPlot({
        shinipsum::random_ggplot()
      })

      #TODO: Placeholder Keppen Geiger Zones Random Plot from shinyipsum
      output$koppenZones <- renderPlot({
        shinipsum::random_ggplot()
      })

    }
  )#moduleServer
}#mod_Page_Primary_Research_Results_Server
