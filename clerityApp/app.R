#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
install.packages("shinythemes")
library(shinythemes)
library(shiny)
library(forecast)
library(ggplot2)
library(reshape2)

df <-read.csv('data.csv')
x<-c(2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  #theme = shinytheme("cerulean")
  
  # Application title
  titlePanel("Clerity: College Crime Rates in Milwaukee"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel("Select School",
      selectInput("school", "Campus:", c("Alverno College"=1,"Cardinal Stritch University"=2,"Marquette University"=3,"Milwaukee Area Technical College"=4,"Milwaukee Institute of Art & Design"=5,"Milwaukee School of Engineering"=6,"Mount Mary College"=7,"Bryant and Stratton College"=8,"Wisconsin Lutheran College"=9,"University of Wisconsin-Milwaukee"=10)),
      selectInput("weight", "Number of Crimes", c("Total" = 0, "Per Student" = 1, "Per 1000 Students"=2)),
      selectInput("line","Baseline for Comparison", c("Overall Trend Line"=0,"Smoothed Trend Line"=1))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("linePlot"),
    
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$linePlot <- renderPlot({
    if(input$weight==0){
    d<-ts(as.vector(df[input$school,12:23]))
    t<-ts(as.vector(df[11,12:23]))
    data <-append(as.vector(df[input$school,12:23]),(as.vector(df[11,12:23])))
    high = 55
    }
    if(input$weight==1){
    d<-ts(as.vector(df[input$school, 24:35]))
    t<-ts(as.vector(df[11,24:35]))
    high = .012
    }
    if(input$weight==2){
    d<-ts(as.vector(df[input$school, 36:47]))
    t<-ts(as.vector(df[11,36:47]))
    high = 12
    }
    avg<-tslm(t~trend+I(trend^2))
    fitted<-avg$fitted.values
    #print(avg$fitted.values)
    #print(d)
    #data<-data.frame(c(x,d,t))
    #data<-melt(data,id=x)
    #d1<-data.frame(data,class=rep(c("School","All"),each=12))
    #ggplot(data=d1, aes(x=rep(x,2),y=data,group=class))+geom_line()
    
    zeke=((max(fitted)-min(fitted))/12 *(1:12))+min(fitted)
    #schoolName<-toString(df$INSTNM[input$school])
    
    if(input$line == 0){
      plot(x,d,xlab = "Year", ylab="Total Crime Events", main=df$INSTNM[input$school], xlim=c(2006,2017),ylim = c(0,high)) +lines(x,d,type="o",lty=1,col="blue",lwd=2)+lines(x,zeke,col="black",lwd=2)
      legend("topright",legend=c("User School","Average Crime"),col=c("blue", "black"),lty=1,lwd = 2,text.col=c("blue","black"))
    }else{
    plot(x,d,xlab = "Year", ylab="Total Crime Events", main=df$INSTNM[input$school], xlim=c(2006,2017),ylim = c(0,high)) +lines(x,d,type="o",col="blue",lwd=2)+lines(x,fitted,col="black",type="o",lwd=2)
    legend("topright",legend=c("User School","Average Crime"),col=c("blue", "black"),lty=1,lwd = 2,text.col=c("blue","black"))
      
    }
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
