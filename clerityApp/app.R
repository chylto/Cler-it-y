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
x<-c(6,7,8,9,10,11,12,13,14,15,16,17)
# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Clerity: College Crime Rates in Milwaukee"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("school", "Campus:", c("Marquette"=3)),
      selectInput("weight", "Number of Crimes", c("Total" = 0, "Per Student" = 1, "Per 1000 Students"=2))
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
    if(input$weight==0){
    d<-ts(as.vector(df[input$school,12:23]))
    }
    if(input$weight==1){
    d<-ts(as.vector(df[input$school, 24:35]))
    }
    if(input$weight==2){
    d<-ts(as.vector(df[input$school, 36:47]))
    }
    #print(d)
    plot(x,d,xlab = "Year", ylab="Total Crime Events", main=df$INSTNM[input$school], ylim = c(0,(1.2*max(d))))
    lines(x,d,type="o")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
