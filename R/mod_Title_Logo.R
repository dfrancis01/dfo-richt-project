#' Title & Logo for Atmel Temple Dashboard
#'
#' @param id is use with ns('') to uniquely identify module specific ids not used currently
#'
#' @return
#' @export

mod_Title_Logo_UI <- function(id) {
  ns <- NS(id)
  tagList(
    tags$a(href = "https://environmentalevidencejournal.biomedcentral.com/track/pdf/10.1186/s13750-021-00231-1.pdf", class = "logo",
          tags$span(class = "logo-mini",
                    tags$img(width="50px",height="50px",src = "img/RiCHT_64x64px.png", class = "")),
          tags$span(class = "logo-lg", id="ritchLogoText",
                  img(width="50px",height="50px", src = "img/RiCHT_64x64px.png", class = ""), "RiTCH")
          )#a
        )#tagList
}#mod_Title_Logo_UI

mod_Title_Logo_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {}
  )#moduleServer
}#mod_Title_Logo_Server
