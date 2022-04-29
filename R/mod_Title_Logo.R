#' Title & Logo for Atmel Temple Dashboard
#'
#' @author Dorlan Francis
#'
#' @param id is use with ns('') to uniquely identify module specific component ids, not currently used.
#'
#' @return HTML tagList
#' @noRd

mod_Title_Logo_UI <- function(id) {
  ns <- NS(id)
  tagList(
    tags$a(href = "https://doi.org/10.1186/s13750-021-00231-1", class = "logo",                    #Link to the paper systematic map protocol
          tags$span(class = "logo-mini",
                    tags$img(width="50px",height="50px",src = "img/RiCHT_64x64px.png", class = "")),
          tags$span(class = "logo-lg", id="RiCHTLogoText",
                  img(width="50px",height="50px", src = "img/RiCHT_64x64px.png", class = ""), "RiCHT")
          )#a
        )#tagList
}#mod_Title_Logo_UI

# Currently No server component
# mod_Title_Logo_Server <- function(id) {
#   moduleServer(
#     id,
#     function(input, output, session) {}
#   )#moduleServer
# }#mod_Title_Logo_Server
