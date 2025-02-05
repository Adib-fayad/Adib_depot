#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 100,
                        value = 30),
  selectInput("color","choisir une couleur",choices = c("pink","red","blue")),
  dateInput(inputId = "idDate", label = "Please enter a date", value = "2025/02/05",
            format = "dd/mm/yyyy", startview = "month", weekstart = 0, language = "fr"),
  textInput("titre", "titre"),
  
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textAreaInput("comment","INTERPRETATION","",rows = 3),
            actionButton("envoi","c good"),
            verbatimTextOutput("textDisplay")
        )
    )
)
