# Anna Daria Rescifina

library(shiny)

# Added Title Panel
ui <- fluidPage(
  titlePanel("Anna Rescifina"),
  
# Added Plot Type Selector  
  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Number of observations:", 200),
      
      selectInput("plot_type", "Choose plot type:",
                  choices = c("Histogram", "Boxplot")),
# Added Color Selector       
      selectInput("color", "Choose color (for boxplot):",
                  choices = c("red", "blue", "green", "gray"))
    ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
)
# Added Plot Switching Logic
server <- function(input, output) {
  output$plot <- renderPlot({
    data <- runif(input$n)
    
    if (input$plot_type == "Histogram") {
      hist(data)
    } else {
      boxplot(data, col = input$color)
    }
  })
}

shinyApp(ui = ui, server = server)
