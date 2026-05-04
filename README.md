# ZHAW Shiny dashboard template

This repository provides a structured template for building institutional
Shiny dashboards with consistent layout, branding, and legal footer.

UI stands for User Interface. A Shiny application usually consists of two main components: a `ui` object and a `server` function.

- The UI defines what the user sees (layout, inputs, outputs).
- The server defines how the application behaves (reactivity, data processing, rendering).

If you are new to Shiny, see the [official Shiny getting started tutorial](https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/) to learn the basics.


---

## Quickstart

1. Clone or copy this repository.
2. Open `config.yml` and set your title, brand, and legal notice.
3. Open `dashboard_ui.R` and add your UI elements inside `dashboard_ui()`.
4. Open `dashboard_server.R` and add your server logic inside `dashboard_server()`.
5. Run the app:

```r
shiny::runApp()
```

That's it. You do not need to touch any other file.

---

## File structure

```
app.R                       # Application entry point (do not modify)
template/
  layout.R               # Layout helpers (do not modify)

dashboard_ui.R              # Edit this – dashboard UI content
dashboard_server.R          # Edit this – dashboard server logic

config.yml                  # Branding and legal configuration
write_manifest.R            # Run once before deploying to Posit Connect
www/
  style.css                 # Styling
  logo-standard.png
  logo-black.png
```

---

## What you should edit

### Dashboard UI

Edit `dashboard_ui.R` and define:

```r
dashboard_ui <- function() {
  tagList(
    # your UI components here
  )
}
```

### Dashboard server logic

Edit `dashboard_server.R` and define:

```r
dashboard_server <- function(input, output, session) {
  # your server logic here
}
```

#### Data

Load static datasets at the top of `dashboard_server.R`, above the
`dashboard_server()` function. Use `reactive()` only if data must update during runtime.


### Branding and legal notice

Edit `config.yml`:

```yaml
title: "Dashboard title"
brand: "standard"   # or "black"

legal_notice:
  - "Institution"
  - "Department"
  - "Contact"
```

- `brand` controls the logo and footer color.
- `legal_notice` items are displayed in the footer separated by dots.
- `partner_logos` should be prepared in `1500 x 850 px` (about `1.76:1`),
  and the template scales them into a consistent display frame.

---

## Do not edit

- `app.R`
- `template/layout.R`

These files define the structural template and should remain unchanged.

---

## Run the app

In R:

```r
shiny::runApp()
```

Or open `app.R` in RStudio and click **Run App**.

---

## Deploy to Posit Connect

Posit Connect requires a `manifest.json` that records the exact R version and
package versions your app uses. Generate it by running:

```bash
Rscript write_manifest.R
```

This works from any working directory — the script always writes `manifest.json`
next to itself. If `rsconnect` is not yet installed, the script installs it
automatically.

The script works for any content type that Posit Connect supports (Shiny apps,
Plumber APIs, R Markdown, Quarto). It detects the content type automatically
from the files present in the app directory.

Once `manifest.json` has been generated:

1. Commit it to version control alongside your app.
2. In Posit Connect, create a new content item and upload the folder, **or**
   use `rsconnect::deployApp()` from R to push directly:

```r
rsconnect::deployApp(server = "your-connect-instance.example.com")
```

Re-run `write_manifest.R` whenever you add or update a package dependency.
