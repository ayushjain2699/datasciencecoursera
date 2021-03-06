library(shiny)
shinyUI(fluidPage(

    titlePanel("Playing with mtcars data set"),
    sidebarLayout(
        sidebarPanel(
               selectInput("x","Choose the x axis",choices = c("disp","hp","drat","wt","qsec")),
               selectInput("factor","Choose the factor variable",c("gear","am","cyl")),
               checkboxInput("show_lm","Show/Hide Regression Line")
        ),
        mainPanel(
            tabsetPanel(
                type = "tab",
                tabPanel("Plot",br(),h3(textOutput("title")),plotOutput("plot")),
                tabPanel("Documentation",br(),textOutput("Doc"))
            )
        )
    )
))
