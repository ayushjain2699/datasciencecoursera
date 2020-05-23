library(shiny)

shinyServer(function(input, output) {

    library(ggplot2)
    data = mtcars
    data$cyl = factor(data$cyl)
    data$am = factor(data$am,labels = c("Automatic","Manual"))
    data$gear = factor(data$gear)
    output$plot = renderPlot({
            g = ggplot(data,aes_string(x = input$x,y = "mpg"))
            if(input$show_lm)
            {
                g + geom_point(aes_string(color = input$factor))+geom_smooth(method = "lm")
            }
            else{
                g + geom_point(aes_string(color = input$factor))
            }
    })
    output$Doc = renderText({
        t = "You need to select the variable against which the Mpg of the cars must be plotted. 
        Also, you need to chose the factor variable that can be helpful in comparisions. Moreover
        you can also choose to add a regression line that fits the model."
    })
    output$title = renderText({
        paste("Mpg vs ",input$x)
    })
})
