server <- function(input, output) {

    ## set file size limit >5MB here
    options(shiny.maxRequestSize=200*1024^2)

    output$plot <- renderPlot({
        iv1 <- x %[]% input$bb_x & y %[]% input$bb_y
        iv2 <- x %[]% input$bb_y & y %[]% input$bb_x
        iv3 <- d %()% input$bb_d
        op <- par(mfrow=c(1,2))
        plot(x, y, pch = 19, cex = 0.25, col = iv1 + iv2 + 3,
            main = "Intersecting bounding boxes")
        plot(x, y, pch = 19, cex = 0.25, col = iv3 + 1,
            main = "Deck the halls:\ndistance range from center")
        par(op)
    })

    output$fileinfo <- renderPrint({
        req(input$file)
        cat("Size of", input$file$name, "=",
            round(input$file$size/1024^2, 3), "MB")
    })

    ## prevent timeout
#    autoInvalidate <- reactiveTimer(intervalMs = 50*1000)
#    observe({
#        autoInvalidate()
#        cat(".")
#    })

}
