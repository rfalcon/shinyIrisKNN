shinyUI(fluidPage(
        headerPanel('Iris K-Nearest Neighbor Demo'),
        sidebarPanel(
                selectInput('xcol', 'Predictive Attribute X', setdiff(names(iris), 'Species')),
                selectInput('ycol', 'Predictive Attribute Y', setdiff(names(iris), 'Species'),
                            selected=names(iris)[[2]]),
                sliderInput('target', 'Target data point index', 1, min = 1, max = dim(iris)[1]),
                sliderInput('k', 'Number of neighbors (K)', 3, min = 1, max = 15)
        ),
        mainPanel(
                plotOutput('plot1'),
                h3('Original class:'),
                textOutput("origClass"),
                h3('KNN predicted class:'),
                textOutput("predClass")
        ),
        
        fluidRow (
                mainPanel(h3("Documentation"),                          
                          tags$div(
                                  tags$ul(
                                          tags$li("I created this Shiny app to illustrate the behaviour of the K-nearest neighbor (KNN) method on the Iris data set"),
                                          tags$li("Select the two features to be displayed in the plot via the 'Predictive Attribute X' and 'Predictive Attribute Y' lists"),
                                          tags$li("Then select any of the 150 points in the Iris data to act as the target point, i.e., the point whose class value will be predicted via KNN"),
                                          tags$li("Finally, select the number of neighbors K for the algorithm"),                                          
                                          tags$li("The neighboring points used by KNN are shown as orange crosses (+). You could see which class they belong to by looking at their color"),                                          
                                          tags$li("The target point is shown with an X and colored by the class predicted by KNN"),
                                          tags$li("The KNN algorithm is run at the server side and the predicted class for the target point (together with its original class) are both displayed"),                                          
                                          tags$li("Some of the data points are overlaid upon each other. This may cause that when you visually count the number of neighboring points (+), they do not add up to the chosen value of K"),                                                                                    
                                          tags$li("Have fun!")
                                  )
                          )
                         )
                )
))