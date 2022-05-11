#' Species Selector UI
#'
#' @param id
#'
#' @return UI shiny::tagList Dropdowns for Order, Family, Scientific Name, Test summary output
#' @noRd
#'
mon_Species_Selector_UI <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(ns("selectOrder"), label = h3("Select Order"),
                choices = c("",unique(SPECIES$ORDER)))
    ,selectInput(ns("selectFamily"), label = h3("Select Family"),
                choices = c('',unique(SPECIES$FAMILY)))
    ,selectInput(ns("selectScientific"), label = h3("Select Scientific Name"),
                choices = c('',unique(SPECIES$`SCIENTIFIC NAME`)))
    ,textOutput(ns("text_Summary"))
  )#tagList
}#species_Selector_UI

#' Species Selector Server
#'
#' @param id
#'
#' @return re list of ORDER,FAMILY,SCIENTIFIC,COMMON
#' @noRd
#'
mod_Species_Selector_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      #Filtering is NOT working, your thinking you
      re <- reactiveValues(order="",Family="",SCIENTIFIC="", Common="")

      #filterFamily by Order

      selectFamilyList <- reactive({
        req(input$selectOrder)
        if(input$selectOrder == ""){
          c("",unique(SPECIES$FAMILY))
        } else {
          c("",unique(dplyr::filter(SPECIES,ORDER==input$selectOrder)$FAMILY))
        }#if else
      })#selFam
      selectScientificList <- reactive({
        req(input$selectFamily)
        if(input$selectFamily == ""){
          c("",unique(SPECIES$`SCIENTIFIC NAME`))
        } else {
          c("",unique(dplyr::filter(SPECIES,FAMILY==input$selectFamily)$`SCIENTIFIC NAME`))
        }#if else
      })#selFam

      observeEvent(input$selectOrder, {
        freezeReactiveValue(input, "selectFamily")
        updateSelectInput(inputId = "selectFamily", choices = selectFamilyList())
        re$order <- input$selectOrder
      })
      observeEvent(input$selectFamily, {
        freezeReactiveValue(input, "selectScientific")
        updateSelectInput(inputId = "selectScientific", choices = selectScientificList())
        re$Family <- input$selectFamily
      })
      #filterScientificName by FilterFamily
      observeEvent(input$selectScientific, {
        re$SCIENTIFIC <- input$selectScientific
        re$Common <-dplyr::filter(SPECIES,`SCIENTIFIC NAME`==input$selectScientific)$`COMMON NAME`
      })

      output$text_Summary <- renderText({
        req(re)
        paste("You have selected"
              , "ORDER:",re$order
              , ", FAMILY:", re$Family
              , ", SCIENTIFIC:", re$SCIENTIFIC
              , ", COMMON:", re$Common, sep=" ")
      })





      return(re)

    }
  )#moduleServCer
}#species_Selector_Server
