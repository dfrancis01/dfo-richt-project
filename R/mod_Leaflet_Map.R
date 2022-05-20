#' Leaflet Map Module UI
#'
#' @param id is use with ns('') to uniquely identify module specific ids
#' @param width of map output default is 100% of container
#' @param height of map default is 85% of view port height
#'
#' @return Leaflet Map rendered output
#'
#' @importFrom leaflet leafletOutput
#'
mod_Leaflet_Map_UI <- function(id, width = "100%", height = "85vh") {
  ns <- NS(id)
  tagList(
    leaflet::leafletOutput(ns("richtMap"), width = width, height = height)
  )
}#mod_Leaflet_Map_UI


# Server ------------------------------------------------------------------

#' Leaflet Map Module Server
#'
#' @param id id is use with ns('') to uniquely identify module specific ids
#'
#' @return Search Area
#'
#' @importFrom leaflet leaflet renderLeaflet leafletOptions addTiles
#' @importFrom leaflet addProviderTiles addGraticule addLayersControl
#' @importFrom leaflet layersControlOptions providers hideGroup
#' @importFrom leaflet.extras addDrawToolbar drawRectangleOptions
#' @importFrom leaflet.extras selectedPathOptions editToolbarOptions
#'
mod_Leaflet_Map_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      output$richtMap <- leaflet::renderLeaflet({
        leaflet::leaflet(
          options = leaflet::leafletOptions(minZoom = 1, maxZoom = 18, worldCopyJump = TRUE)) %>%
          leaflet::addTiles(group = "Default") %>%                                                                    # Map Tiles
          leaflet::addProviderTiles(leaflet::providers$Stamen.Toner, group = "Toner") %>%
          leaflet::addProviderTiles(leaflet::providers$Stamen.TonerLite, group = "Toner Lite") %>%
          leaflet::addProviderTiles(leaflet::providers$Esri.WorldImagery, group = "Satellite") %>%
          leaflet::addGraticule(interval = 10, style = list(color = "#bbbbbb", weight = 1), group = "Grid") %>%       # Grid Lines
          leaflet.extras::addDrawToolbar(                                                                                    # Draw Tool Bar
            targetGroup = "Draw",
            position = c("topleft", "topright", "bottomleft", "bottomright"),
            rectangleOptions = leaflet.extras::drawRectangleOptions(),
            polylineOptions = FALSE, circleOptions = FALSE,  markerOptions = FALSE,
            circleMarkerOptions = FALSE, singleFeature = FALSE, polygonOptions = FALSE,
            editOptions = leaflet.extras::editToolbarOptions(selectedPathOptions = leaflet.extras::selectedPathOptions())
          ) %>%
          leaflet::addLayersControl(
            baseGroups = c("Default", "Toner", "Toner Lite", "Satellite"),
            overlayGroups = c("Grid","Draw"),
            options = leaflet::layersControlOptions(collapsed = TRUE))%>% # Layers controller
          leaflet::hideGroup("Grid")
      })
    }
  )
}#mod_Leaflet_Map_Server
