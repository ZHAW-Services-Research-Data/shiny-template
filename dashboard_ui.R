# -----------------------------------------------------------------------------
# Dashboard UI -- *TO BE EDITED*
#
# Defines UI and dashboard content.
# -----------------------------------------------------------------------------

#' Dashboard UI
#'
#' Defines the UI for the dashboard content area. This function should return a
#' Shiny UI object (e.g., a tagList or a div) that contains
#' application-specific UI elements.
#'
#' @param title Optional character string used for the first content heading.
#'   If omitted, falls back to config$title when available.
#'
#' @return A Shiny UI object representing the dashboard content.
dashboard_ui <- function(title = NULL) {
  app_title <- if (!is.null(title) && nzchar(title)) {
    title
  } else if (exists("config", inherits = TRUE) &&
    !is.null(config$title) &&
    nzchar(config$title)) {
    config$title
  } else {
    "Dashboard"
  }

  tagList(
    h2(app_title),
    p(paste0(
      "Explore body measurements of three penguin species observed on ",
      "islands in the Palmer Archipelago, Antarctica."
    )),
    fluidRow(
      column(
        4,
        selectInput("species", "Species",
          choices = c("All", "Adelie", "Chinstrap", "Gentoo"),
          selected = "All"
        )
      ),
      column(
        4,
        selectInput("x_var", "X axis",
          choices = c(
            "bill_length_mm", "bill_depth_mm",
            "flipper_length_mm", "body_mass_g"
          ),
          selected = "bill_length_mm"
        )
      ),
      column(
        4,
        selectInput("y_var", "Y axis",
          choices = c(
            "bill_length_mm", "bill_depth_mm",
            "flipper_length_mm", "body_mass_g"
          ),
          selected = "flipper_length_mm"
        )
      )
    ),
    plotOutput("scatter", height = "400px"),
    hr(),
    h3("Summary statistics"),
    tableOutput("summary"),
    hr(),
    h3("Raw data"),
    p("Showing first 50 rows."),
    tableOutput("table")
  )
}
