#' Title
#'
#' @author Dorlan Francis
#'
#' @description add resource paths for images, javascript and css files
#' @param libname default
#' @param pkgname default
#'
#' @import shiny
.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "img",
    directoryPath = system.file(
      "www/img",
      package = "RiCHT"
    )
  )# Img
  shiny::addResourcePath(
    prefix = "js",
    directoryPath = system.file(
      "www/js",
      package = "RiCHT"
    )
  )# Js
  shiny::addResourcePath(
    prefix = "css",
    directoryPath = system.file(
      "www/css",
      package = "RiCHT"
    )
  )# CSS
}

#' Title
#'
#' @description removes resource paths that were load by the onLoad function
#' @param libname default
#' @param pkgname default
#'
#' @import shiny
.onUnload <- function(libname, pkgname) {
  shiny::removeResourcePath("www/img")
  shiny::removeResourcePath("www/js")
  shiny::removeResourcePath("www/css")
}
