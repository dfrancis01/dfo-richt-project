
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
#' @importFrom shinyjs hidden
#' @noRd
#' @return Shiny UI

shinyUI <- function(session){
    shinydashboardPlus::dashboardPage(
        skin = 'blue-light'
        # ,freshTheme = RiCHT_Theme() How the docs say theming works
        ,title = "RiCHT"
        ,header = shinydashboardPlus::dashboardHeader(
            title = mod_Title_Logo_UI("RiCHTLogo")
            ,tags$li(class = "dropdown", actionLink(inputId = "navAbout", label = "About", icon = icon("info-circle")))
            )#dashboardHeader
        ,sidebar = shinydashboardPlus::dashboardSidebar(

            disable = FALSE,
            width = NULL,
            collapsed = FALSE,
            minified = TRUE,
            sidebarMenu(
                id = "RiCHTSidebarMenu"
                ,shinyjs::useShinyjs()
                ,menuItem(strong("Primary Research"), tabName = "primaryResearch", icon = NULL, badgeLabel = "con", badgeColor = "yellow")

                ,menuItem("Designatable Unit", tabName = "map", icon = icon("search-location", lib = "font-awesome"), badgeLabel = "con", badgeColor = "yellow", selected = TRUE)
                ,menuItem("Species", tabName = "species", icon = icon("fish", lib = "font-awesome"), badgeLabel = "con", badgeColor = "yellow")
                ,menuItem("Aquatic Features", tabName = "features", icon = icon("water", lib = "font-awesome"), badgeLabel = "con", badgeColor = "yellow")
                ,menuItem("Primary Results", tabName = "primaryResults", icon = icon("file",lib = "font-awesome"), badgeLabel = "dev", badgeColor = "red")

                ,menuItem(strong("Models"), tabName = "modelsResearch", icon = NULL, badgeLabel = "con", badgeColor = "yellow")
                ,menuItem("Decision Analysis", tabName = "decisionAnalysis", icon = icon("sitemap", lib = "font-awesome"), badgeLabel = "dev", badgeColor = "red")
                ,menuItem("Models Results", tabName = "modelResults", icon = icon("file", lib = "font-awesome"), badgeLabel = "con", badgeColor = "yellow")

                # ,menuItem("Help", tabName = "help", icon = icon("question-circle", lib = "font-awesome")) %>% bs_embed_tooltip("Help with the app.", placement = 'right')
                ,menuItem(text = "About", tabName = "about") %>% shinyjs::hidden()
                # ,hr(class = "sideHR")
                # ,div(class = "crestLogo logo-lg logo-mini", img(src="img/260px-DFO_Crest.jpg")) #TODO: Proposed RiCHT location

            )#sidebarMenu
        )#dashboardSidebar
        ,body = shinydashboard::dashboardBody(
            RiCHT_Theme() # how theming actualy works :()
            ,headerLinks() #shiny links
            ,tabItems(
                #Primary Search Section
                tabItem(tabName = "primaryResearch", mod_Page_Primary_Research_Info_UI(id = "Page_Primary_Research_Info_1"))
                ,tabItem(tabName = "map", mod_Page_Map_UI(id = "Page_Map_1"))
                ,tabItem(tabName = "species", mod_Page_Species_UI(id="Page_Species_1"))
                ,tabItem(tabName = "features", mod_Page_Aquatic_Features_UI (id="Page_Features_1"))
                ,tabItem(tabName = "primaryResults", h1("Primary Paper Search Results"))
                #Models Search Section
                ,tabItem(tabName = "modelsResearch", mod_Page_Model_Info_UI(id = "Page_Model_Info_1"))
                ,tabItem(tabName = "decisionAnalysis", mod_Page_Decision_Analysis_UI(id = "Page_Decision_Analysis_1"))
                ,tabItem(tabName = "modelResults", mod_Page_Models_Results_UI(id = "Page_Models_Results_1"))
                ,tabItem(tabName = "help", h1("Help"))                           #TODO: Proposed wizard
                ,tabItem(tabName = "about", mod_Page_About_UI(id = "Page_About_1"))
            )
        )#dashboardBody
        ,controlbar = shinydashboardPlus::dashboardControlbar(skin = "light")#dashboardControlbar
        ,footer = shinydashboardPlus::dashboardFooter(
          left = mod_Footer_UI(id = "Footer_1"),
          right = NULL
        )#dashboardFooter
    )#DashboardPage
}#UI
