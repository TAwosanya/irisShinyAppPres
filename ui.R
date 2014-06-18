library(shiny)
data(iris)
shinyUI(pageWithSidebar(
    headerPanel("Iris Data Set Analysis"),
    sidebarPanel(numericInput(inputId="noOfObs",label="Number of Observations to Show:",value=6, min=0, max=nrow(iris)),
                 radioButtons("option", h4("Select Analysis to be Performed:"),
                              c("Clustering (K-Means)" = "option1",
                                "Class Prediction (Random Forests)" = "option2"
                                )
                 ),
                 br(),
                 conditionalPanel(condition = "input.option == 'option1'",
                                  radioButtons("xVar", "Select X Variable:",
                                               c("Sepal Length" = "Sepal.Length",
                                                 "Sepal Width" = "Sepal.Width",
                                                 "Petal Length" = "Petal.Length",
                                                 "Petal Width" = "Petal.Width"),
                                               "Sepal.Length"),
                                  radioButtons("yVar", "Select Y Variable:",
                                               c("Sepal Length" = "Sepal.Length",
                                                 "Sepal Width" = "Sepal.Width",
                                                 "Petal Length" = "Petal.Length",
                                                 "Petal Width" = "Petal.Width"),
                                               "Sepal.Width"),
                                  numericInput(inputId="noOfClusters",label="Number of Clusters",value=3),
                                  checkboxInput("showSummary","Show Summary", TRUE)
                 ),
                 conditionalPanel(condition = "input.option == 'option2'",
                                  "Please enter input below:",
                                  numericInput(inputId="Sepal.Length",label="Sepal Length",value="",min=min(iris[,"Sepal.Length"]), max=max(iris[,"Sepal.Length"])),
                                  numericInput(inputId="Sepal.Width",label="Sepal Width",value="",min=min(iris[,"Sepal.Width"]), max=max(iris[,"Sepal.Width"])),
                                  numericInput(inputId="Petal.Length",label="Petal Length",value="",min=min(iris[,"Petal.Length"]), max=max(iris[,"Petal.Length"])),
                                  numericInput(inputId="Petal.Width",label="Petal Width",value="",min=min(iris[,"Petal.Width"]), max=max(iris[,"Petal.Width"])),
                                  br(),
                                  actionButton("submitInput","Submit Input")
                 )),
    mainPanel(h4("About this application"),
              helpText("This shiny application helps the user to cluster 
                          the iris data into desireable number of clusters and 
                          to predict classes of new data based on random forests 
                          technique.", 
                       "In the side panel, the user can choose which task he/she 
                          intends to perform i.e. clustering or prediction. Once 
                          clustering is selected, only the widgets that are associated 
                          with clustering are displayed i.e choose which variable to 
                          use as x and y axes, number of clusters and a checkbox 
                          to turn on and off summary of the clustering model.",
                       "In the same vein, when the prediction is selected only 
                          the widgets associated with the random forests prediction 
                          for the iris data are displayed which are the Sepal Lengths 
                          and Widths, Petal Lengths and Widths. The submit button is to 
                          pass the input data to the model for prediction.",
                       "Also note that the output display in the mainpanel also follows 
                          from the option of clustering or prediction selection from the 
                          side panel.",
                       "The ouput include the iris data table whose display can be controlled
                          by the number of observation input in the side panel. Under the 
                          clustering, the outputs are a plot of the iris data set distiguished 
                          colour for different clusters and the summary of the cluster model displayed 
                          in the pane below the plot.",
                       "Under the prediction, the output is a list of the model call and summary 
                          plus the outcome prediction based on input. The model had been trained 
                          with the entire iris data set."
                       ),
              h4("Iris Data"),
              dataTableOutput(outputId="irisData"),
              conditionalPanel(condition = "input.option == 'option1'",
                               h5("Clusters Plot"),
                               plotOutput(outputId="clustPlot"),
                               h5("Summary of K-Means Clustering Result"),
                               verbatimTextOutput(outputId="summResult")
                               ),
              conditionalPanel(condition = "input.option == 'option2'",
                               h5("Summary of Randon Forests Class Prediction"),
                               verbatimTextOutput(outputId="summRFResult")
                               )
              )
    ))