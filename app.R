library(shiny)
library(yaml)

# --------------------------------------------------
# Load configuration
# --------------------------------------------------
config <- yaml::read_yaml("config.yml")

# --------------------------------------------------
# Load layout helpers
# --------------------------------------------------
source("ui_layout.R")

# --------------------------------------------------
# Derive branding from config
# --------------------------------------------------
brand_class <- paste0("brand-", config$brand)
logo_file <- paste0("logo-", config$brand, ".png")

# --------------------------------------------------
# UI
# --------------------------------------------------
ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),

  div(
    class = paste("app-page", brand_class),

    corporate_header(
      title = config$title,
      logo  = logo_file
    ),

    corporate_content(
      fluidRow(
        column(
          12,
          p("This dashboard provides an overview of municipalities.")
        )
      ),

      fluidRow(
        column(4, wellPanel(h4("Cantons"), h2("26"))),
        column(4, wellPanel(h4("Municipalities"), h2("2,131"))),
        column(4, wellPanel(h4("Last update"), h2("2026-01-15")))
      )
    ),

    corporate_footer(
      brand = config$brand,
      render_legal_notice(config$legal_notice)
    )
  )
)

# --------------------------------------------------
# Server
# --------------------------------------------------
server <- function(input, output, session) {
  # server logic goes here
}

shinyApp(ui, server)
