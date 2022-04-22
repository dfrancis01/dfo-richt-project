
#' Application User Interface
#'
#' @param session
#'
#' @import shiny
#' @importFrom shinydashboard sidebarMenu menuItem menuItem tabItems tabItem
#' @importFrom  shinydashboardPlus dashboardHeader dashboardControlbar dashboardSidebar dashboardPage dashboardFooter taskItem notificationItem messageItem
#' @importFrom bsplus bs_embed_tooltip
#' @noRd
#' @return Shiny UI

shinyUI <- function(session){
    shinydashboardPlus::dashboardPage(
        skin = 'blue-light'
        ,title = "RiCHT"
        ,header = shinydashboardPlus::dashboardHeader(title = mod_Title_Logo_UI("RiCHTLogo"))#dashboardHeader
        ,sidebar = shinydashboardPlus::dashboardSidebar(

            disable = FALSE,
            width = NULL,
            collapsed = FALSE,
            minified = TRUE,
            id = "RiCHTSidebar",
            sidebarMenu(
                menuItem(strong("About"), tabName = "about", icon = icon("info-circle", lib = "font-awesome")) %>% bs_embed_tooltip("This is about app.", placement = 'right')
                ,menuItem(strong("Primary Research"), #TODO: href = "#", #Link to external source info here
                         tabName = "primaryResearch", icon = NULL, startExpanded = TRUE)
                ,menuItem("Species", tabName = "species", icon = icon("fish", lib = "font-awesome")) %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem("Designatable Unit", tabName = "map", icon = icon("search-location", lib = "font-awesome")) %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem("Aquatic Features", tabName = "habitat", icon = icon("water", lib = "font-awesome")) %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem("Threats", tabName = "threats", icon = icon("exclamation-circle",lib = "font-awesome")) %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem(strong("Models"),
                         tabName = "models", icon = NULL, startExpanded = TRUE)
                ,menuItem("Decision Analysis", tabName = "decissionAnalysis", icon = icon("sitemap", lib = "font-awesome")) %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,menuItem(strong("Results"), tabName = "results", icon = icon("file", lib = "font-awesome")) %>% bs_embed_tooltip("Default Tool Tip", placement = 'right')
                ,br()
                ,menuItem("Help", tabName = "help", icon = icon("question-circle", lib = "font-awesome")) %>% bs_embed_tooltip("Help with the app.", placement = 'right')
                # ,hr(class = "sideHR")
                # ,div(class = "crestDFO", img(src="img/260px-DFO_Crest.jpg")) #TODO: change size on collapse
            )

        )#dashboardSidebar
        ,body = shinydashboard::dashboardBody(
            RiCHT_Theme()
            ,headerLinks() #shiny links
            ,tabItems(
                tabItem(tabName = "about", mod_About_Page_UI(id="richt_about"))
                ,tabItem(tabName = "primaryResearch", h1("Primary Research"))
                ,tabItem(tabName = "species", h1("Species"))
                ,tabItem(tabName = "map", h1("Map"))
                ,tabItem(tabName = "habitat", h1("Habitat"))
                ,tabItem(tabName = "threats", h1("Threats"))
                ,tabItem(tabName = "models", h1("Models"))
                ,tabItem(tabName = "decissionAnalysis", h1("Decission Analysis"))
                ,tabItem(tabName = "results", h1("Results"))
                ,tabItem(tabName = "help", h1("Help"))
            )
        )#dashboardBody
        ,controlbar = shinydashboardPlus::dashboardControlbar()#dashboardControlbar
        ,footer = shinydashboardPlus::dashboardFooter(
          left = mod_Footer_UI("RiCHTFooter"),
          right = NULL
        )#dashboardFooter
    )#DashboardPage
}#UI
