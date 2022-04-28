
#' Application User Interface
#'
#' @author Dorlan Francis
#'
#' @param session
#'
#' @import shiny
#' @importFrom shinydashboard sidebarMenu menuItem menuItem tabItems tabItem
#' @importFrom shinydashboardPlus dashboardHeader dashboardControlbar dashboardSidebar
#' @importFrom shinydashboardPlus dashboardPage dashboardFooter taskItem notificationItem messageItem
#' @importFrom bsplus bs_embed_tooltip
#' @noRd
#' @return Shiny UI

shinyUI <- function(session){
    shinydashboardPlus::dashboardPage(
        skin = 'blue-light'
        # ,freshTheme = RiCHT_Theme() How the docs say theming works
        ,title = "RiCHT"
        ,header = shinydashboardPlus::dashboardHeader(title = mod_Title_Logo_UI("RiCHTLogo"))#dashboardHeader
        ,sidebar = shinydashboardPlus::dashboardSidebar(

            disable = FALSE,
            width = NULL,
            collapsed = FALSE,
            minified = TRUE,
            id = "RiCHTSidebar",
            sidebarMenu(
                menuItem(strong("Primary Research"), tabName = "primaryResearch", icon = NULL, badgeLabel = "dev", badgeColor = "red")
                ,menuItem("Designatable Unit", tabName = "map", icon = icon("search-location", lib = "font-awesome"), badgeLabel = "dev", badgeColor = "red", selected = TRUE) %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem("Species", tabName = "species", icon = icon("fish", lib = "font-awesome"), badgeLabel = "dev", badgeColor = "red") %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem("Aquatic Features", tabName = "habitat", icon = icon("water", lib = "font-awesome"), badgeLabel = "dev", badgeColor = "red") %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem("Primary Results", tabName = "primaryResults", icon = icon("file",lib = "font-awesome"), badgeLabel = "dev", badgeColor = "red") %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')

                ,menuItem(strong("Models"), tabName = "modelsResearch", icon = NULL)
                ,menuItem("Decision Analysis", tabName = "decissionAnalysis", icon = icon("sitemap", lib = "font-awesome"), badgeLabel = "dev", badgeColor = "red") %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem("Models Results", tabName = "modelReults", icon = icon("file", lib = "font-awesome"), badgeLabel = "dev", badgeColor = "red") %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')

                # ,menuItem("Help", tabName = "help", icon = icon("question-circle", lib = "font-awesome")) %>% bs_embed_tooltip("Help with the app.", placement = 'right')
                ,menuItem(strong("About"), tabName = "about", icon = icon("info-circle", lib = "font-awesome"), badgeLabel = "con", badgeColor = "yellow") %>% bs_embed_tooltip("This is about app.", placement = 'right')
                # ,hr(class = "sideHR")
                # ,div(class = "crestLogo logo-lg logo-mini", img(src="img/260px-DFO_Crest.jpg")) #TODO: Proposed RiCHT location

            )#sidebarMenu
        )#dashboardSidebar
        ,body = shinydashboard::dashboardBody(
            RiCHT_Theme() # how theming actualy works :()
            ,headerLinks() #shiny links
            ,tabItems(
                #Primary Search Section
                tabItem(tabName = "primaryResearch", h1("Primary Research"))
                ,tabItem(tabName = "map", h1("Designatable Unit (Map)"))
                ,tabItem(tabName = "species", h1("Species"))
                ,tabItem(tabName = "habitat", h1("Habitat"))
                ,tabItem(tabName = "primaryResults", h1("Primary Paper Search Results"))
                #Models Search Section
                ,tabItem(tabName = "modelsResearch", h1("Models Research"))
                ,tabItem(tabName = "decissionAnalysis", h1("Decission Analysis"))
                ,tabItem(tabName = "modelReults", h1("Models Results"))
                ,tabItem(tabName = "help", h1("Help"))                           #TODO: Proposed wizard
                ,tabItem(tabName = "about", mod_About_Page_UI(id="richt_about"))
            )
        )#dashboardBody
        ,controlbar = shinydashboardPlus::dashboardControlbar()#dashboardControlbar
        ,footer = shinydashboardPlus::dashboardFooter(
          left = mod_Footer_UI("RiCHTFooter"),
          right = NULL
        )#dashboardFooter
    )#DashboardPage
}#UI
