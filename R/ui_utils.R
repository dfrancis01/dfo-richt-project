#' Header Links
#'
#' @description This utility function is where all html links made in the `<head>`  tag will be placed.
#' @return HTML Header Tag with link tags for Favicon, CSS, Javascript
headerLinks <- function(){
  tags$head(
    tags$link(rel = "icon", type="image/png", href="img/RiCHT_16x16px.png"),
    tags$link(rel = "icon", type="image/png", href="img/RiCHT_32x32px.png"),
    tags$link(rel = "stylesheet", type = "text/css", href = "css/RiCHT.css")
  )
}


#' Rich Theme
#'
#' @return fresh theme
#' @importFrom fresh use_theme create_theme adminlte_color adminlte_sidebar
RiCHT_Theme <- function(){
  fresh::use_theme(
    fresh::create_theme( #Adminlte dashboard theme colour overide
      #https://rdrr.io/cran/fresh/man/adminlte_color.html
      fresh::adminlte_color(
        light_blue = "#396B39",              #primary colour override
        aqua = "#004455"                     #info colour override
      ),
      #https://rdrr.io/cran/fresh/man/adminlte_sidebar.html
      fresh::adminlte_sidebar(
        dark_bg = "#004455",                 #sidebar background colour darkmod default
        dark_hover_bg = "#7D9FA8",           # " " " on hover
        dark_color = "#fff",                 #Sidebar Text Colour
        dark_submenu_bg = NULL,              #sidebar Sub-menu bcground colour
        dark_submenu_color = NULL,           #Sidebar Sub-menu Text Colour
        dark_submenu_hover_color = NULL,     #Sidebar Sub-menu Text Colour on Hover
        #Seems to be no way to change the sub-menu bg colour with this method
      )#adminlte_sidebar
    )#create_theme
  )#use_theme
}
