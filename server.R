library(class)
library(pdist)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3"))

shinyServer(function(input, output, session) {
        
        # Combine the selected variables into a new data frame
        selectedData <- reactive({
                                iris[, c(input$xcol, input$ycol)]
                        })
                
        targetPoint <- reactive({
                                selectedData()[input$target,]
                       })
        
        predictedClass <- reactive({
                                knn(selectedData(), targetPoint(), iris$Species, input$k)
                          })
        
        output$plot1 <- renderPlot({
                par(mar = c(5.1, 4.1, 0, 1))                
                plot(selectedData(),
                     col = unclass(iris$Species),
                     pch = 20, cex = 3)                
                
                distances <- pdist(targetPoint(), selectedData())
                nnIdxs <- order(as.matrix(distances))[1:input$k]                
                points(selectedData()[nnIdxs,], pch = 3, cex = 4, lwd = 4, col="orange")
                
                points(selectedData()[input$target,], pch = 4, cex = 4, lwd = 4, col=unclass(predictedClass()))
                
        })
                
        output$origClass <- reactive({iris$Species[input$target]})
        output$predClass <- reactive({predictedClass()})
})