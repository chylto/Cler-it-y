#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

df <-read.csv('data.csv')

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Clerity: College Crime Rates in Milwaukee"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("school", "Campus:", c("Marquette"=3)),
      selectInput("per1000", "Number of Crimes", c("Total" = 0, "Per 1000 Students" = 1))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("linePlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$linePlot <- renderPlot({
    if(input$per1000==0){
    d<-as.vector(df[input$school,11:22])}
    else{
      d<-as.vector(df[input$school, 25:36])
    }
    plot(x,d,xlab = "Year", ylab="Total Crime Events", main=df$INSTNM[input$school], ylim = c(0,(1.2*max(d))))
    lines(x,d,type="o")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)