ui <- fluidPage(
  titlePanel("Intervals example with Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bb_x", "Position along x axis",
        min=min(x), max=max(x), value=range(x),
        step=round(diff(range(x))/20, 1), animate=TRUE
      ),
      sliderInput("bb_y", "Position along y axis",
        min = min(y), max = max(y), value = range(y),
        step=round(diff(range(y))/20, 1), animate=TRUE
      ),
      sliderInput("bb_d", "Radial distance",
        min = 0, max = max(d), value = c(0, max(d)/2),
        step=round(max(d)/20, 1), animate=TRUE
      ),
      fileInput("file", "Choose file")
    ),
    mainPanel(
      plotOutput("plot"),
      verbatimTextOutput("fileinfo")
    )
  )
)
