

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = input$color, border = 'blue',
             xlab = 'Waiting time to next eruption (in mins)',
             main = input$titre)

    })
    #variable pour stocker le text
    text_reactive <- reactiveVal("")
    #quand on clique sur envoi on stock das text_reactive ce qui est dans comment
    observeEvent(input$envoi, {
      text_reactive(input$comment)
      updateTextAreaInput(session, "comment", value = "")
    })
    #on copie ce qui est dans text_reactive dans la zone Display
    output$textDisplay <- renderText({
      paste("Your notes:", text_reactive())
    })

}
