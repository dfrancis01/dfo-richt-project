#' Header Links
#'
#' @author Dorlan Francis
#'
#' @description This utility function is where all html links made in the `<head>`  tag will be placed.
#' @return HTML Header Tag with link tags for Favicon, CSS, Javascript
headerLinks <- function(){
  tags$head(
    tags$link(rel = "icon", type="image/png", href="img/RiCHT_16x16px.png")
    ,tags$link(rel = "icon", type="image/png", href="img/RiCHT_32x32px.png")
    ,tags$link(rel = "stylesheet", type = "text/css", href = "css/RiCHT.css")
  )
}


#' Rich Theme
#'
#' @return fresh theme
#' @importFrom fresh use_theme create_theme adminlte_color adminlte_sidebar
RiCHT_Theme <- function(){
  richt_primary <- "#396B39"
  richt_secondary <- "#004455"
  richt_side_hover <- "#7D9FA8"
  richt_white <- "#fff"
  fresh::use_theme(
    fresh::create_theme( #Adminlte dashboard theme colour overide
      # https://rdrr.io/cran/fresh/man/adminlte_vars.html
      fresh::adminlte_vars(body_bg = "#FFF")
      #https://rdrr.io/cran/fresh/man/adminlte_color.html
      ,fresh::adminlte_color(
        light_blue = richt_primary,              #primary colour override
        aqua = richt_secondary                    #info colour override
      )
      #https://rdrr.io/cran/fresh/man/adminlte_sidebar.html
      ,fresh::adminlte_sidebar(
        dark_bg = richt_secondary,                 #sidebar background colour darkmod default
        # dark_hover_bg = richt_side_hover,           # " " " on hover
        # dark_color = richt_white,                 #Sidebar Text Colour
        # dark_hover_color = NULL,
        # dark_submenu_bg = NULL,              #sidebar Sub-menu bcground colour
        # dark_submenu_color = NULL,           #Sidebar Sub-menu Text Colour
        # dark_submenu_hover_color = NULL,     #Sidebar Sub-menu Text Colour on Hover

        # light sking colors

        light_bg = richt_secondary,                 #sidebar background colour darkmod default
        light_hover_bg = richt_side_hover,
        light_color = richt_white,
        light_hover_color = richt_white,
        light_submenu_bg = NULL,
        light_submenu_color = NULL,
        light_submenu_hover_color = NULL
      )#adminlte_sidebar
    )#create_theme
  )#use_theme
}
