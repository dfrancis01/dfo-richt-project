#' Leaflet Map Module UI
#'
#' @param id is use with ns('') to uniquely identify module specific ids
#' @param width of map output default is 100% of container
#' @param height of map default is 80% of view port height
#'
#' @return Leaflet Map rendered output
#'
#' @importFrom leaflet leafletOutput
#'
mod_Leaflet_Map_UI <- function(id, width = "100%", height = "80vh") {
  ns <- NS(id)
  tagList(
    leafletOutput(ns("richtMap"), width = width, height = height)
  )
}#mod_Leaflet_Map_UI


# Server ------------------------------------------------------------------

#' Leaflet Map Module Server
#'
#' @param id id is use with ns('') to uniquely identify module specific ids
#'
#' @return Search Area
#'
#' @importFrom leaflet
mod_Leaflet_Map_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      output$mymap <- renderLeaflet({
        leaflet(
          options = leafletOptions(minZoom = 0, maxZoom = 18, worldCopyJump = TRUE)) %>%
          addTiles(group = "Default") %>%                                                                    # Map Tiles
          addProviderTiles(providers$Stamen.Toner, group = "Toner") %>%
          addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>%
          addProviderTiles(providers$Esri.WorldImagery, group = "Satellite") %>%
          addGraticule(interval = 10, style = list(color = "#bbbbbb", weight = 1), group = "Grid") %>%       # Grid Lines
          addDrawToolbar(                                                                                    # Draw Tool Bar
            targetGroup = "Draw",
            position = c("topleft", "topright", "bottomleft", "bottomright"),
            rectangleOptions = drawRectangleOptions(),
            editOptions = editToolbarOptions(selectedPathOptions = selectedPathOptions())
          ) %>%
          addLayersControl(
            baseGroups = c("Default", "Toner", "Toner Lite", "Satellite"),
            overlayGroups = c("Grid","Draw"),
            options = layersControlOptions(collapsed = TRUE)) # Layers controller
      })
    }
  )
}#mod_Leaflet_Map_Server
