#' Title
#'
#' @param libname default
#' @param pkgname default
#'
#' @import shiny
.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "img",
    directoryPath = system.file(
      "www/img",
      package = "RiTCH"
    )
  )
}

#' Title
#'
#' @param libname default
#' @param pkgname default
#'
#' @import shiny
.onUnload <- function(libname, pkgname) {
  shiny::removeResourcePath("www/img")
}
