corporate_header <- function(title, logo) {
  tags$header(
    class = "app-header",
    tags$img(
      src = logo,
      class = "app-logo",
      alt = "Institution logo"
    ),
    tags$h1(
      title,
      class = "app-title"
    )
  )
}

corporate_content <- function(...) {
  div(
    class = "app-content",
    ...
  )
}

corporate_footer <- function(brand, ...) {
  
  footer_style <- if (brand == "black") {
    "color: #000000;"
  } else {
    NULL  # keep CSS default (blue)
  }
  
  tags$footer(
    class = "app-footer",
    style = footer_style,
    ...
  )
}

# render_legal_notice <- function(lines) {
#   tagList(lapply(lines, tags$p))
# }

render_legal_notice <- function(lines) {
  tags$p(
    paste(lines, collapse = " · ")
  )
}
