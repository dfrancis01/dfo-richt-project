#' Primary Research Results Page UI
#'
#' @author Dorlan Francis
#'
#' @param id
#'
#' @return Shiny FluidPage Primary Research Results Screen
#' @noRd
#'
mod_Page_Primary_Research_Results_UI <- function(id) {
  ns <- NS(id)
  shiny::fluidPage(

    # Results Summary Section -------------------------------------------------------
     shiny::fluidRow(
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
          # class = "primary-results-summary",
          #Species Results Box ----------------------------------------------------
          shinydashboardPlus::box(
            title = div(class="results-box-title"
                ,span(
                  icon("fish", lib = "font-awesome", class = "restuls-icon")
                  ,"Species")
                ,span(class = "restuls-count", "##,###,###,###")
                )#div.restults-box-title
            ,status = "info"
            ,solidHeader = TRUE
            ,height = 140
            ,width = 4
            ,collapsible = TRUE
            ,headerBorder = TRUE
            ,class = "speciess-box"
            #TODO replace mock-up with redertext output
            ,div(class="results-box",
              div(
                span(strong("Common Name:")#strong
                ,span("Atlantic Sturgeon"))
                ,span("##")
              )
              ,hr()
              ,div(
                span(strong("Scientific Name:")#strong
                ,span("Acipenser Oxyrhynchus"))
                ,span("##")
              )
              ,hr()
              ,div(
                span(strong("Family:")#strong
                ,span("ACIPENSERIDAE"))
                ,span("##")
              )
              ,hr()
              ,div(
                span(strong("Order:")#strong
                ,span("ACIPENSERIFORMES"))
                ,span("##")
              )
            )#div.results-box
          )#Box
          #Designatable Unit Results Box --------------------------------------------------------------
          ,shinydashboardPlus::box(
            title = div(class="results-box-title"
                ,span(
                  icon("search-location", lib = "font-awesome", class = "restuls-icon")
                  ,"Designatable Unit")
                ,span(class = "restuls-count", "##,###,###,###")
            )#div.restults-box-title
            ,status = "info"
            ,solidHeader = TRUE
            ,width = 4
            ,height = 140
            ,collapsible = TRUE
            ,headerBorder = TRUE
            ,class = "designatable-map-box"
            ,div(class="results-box",
                 div(
                   strong("Within Boundaries:")#strong
                   ,span("Xmin:###.##### Ymin:###.##### Xmax:###.##### Ymax:###.#####")
                 )
                 ,hr()
                 ,div(
                   strong("K\u00F6ppen-Geiger Climate Zone:")#strong #Köppen-Geiger Climate Zone:
                   ,span("Dfb")
                 )
            )#div.results-box
          )#Box
          #Aquatic Features Results Box ----------------------------------------------------
          ,shinydashboardPlus::box(
            title = div(class="results-box-title"
                ,span(
                  icon("water", lib = "font-awesome", class = "restuls-icon")
                  ,"Aquatic Features")
                ,span(class = "restuls-count", "##,###,###,###")
            )#div.restults-box-title
            ,status = "info"
            ,solidHeader = TRUE
            ,width = 4
            ,height = 140
            ,collapsible = TRUE
            ,headerBorder = TRUE
            ,class = "features-box"
            ,div(class="results-box",
                 div(
                   strong("Feature 1:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Feature 2:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Feature 3:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Feature 4:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Feature 5:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Feature 6:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Feature 7:")#strong
                   ,span("###")
                 )
                 ,hr()
                 ,div(
                   strong("Feature 8:")#strong
                   ,span("###")
                 )
            )#div.results-box
          )#Box
        )#fluidRow
        ,h3(class="primary-results-h3","Total: ###,###,###,###")
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
        ,class="richt-box-shadow"
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

      #TODO: Temp placeholder for Proxy Map, location set to Ottawa
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
