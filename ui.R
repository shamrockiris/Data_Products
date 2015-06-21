library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("IRIS CLASSIFICATION"),
    sidebarPanel(
        h1('Description'),
        p('If your iris is among setosa,versicolor and virginica.
        Input Sepal or Petal Length/Width. We can tell you which one you have.'),
        numericInput('id1', 'Sepal Length', 5.8,min=0,max=10,step=0.1),
        numericInput('id2', 'Sepal Width', 3,min=0,max=6,step=0.1),
        numericInput('id3', 'Petal Length', 4.3,min=0,max=10,step=0.1),
        numericInput('id4', 'Petal Width', 1.3,min=0,max=4,step=0.1),
        checkboxGroupInput("id5", "Predictor",
                           list("Sepal Length" = "Sepal.Length",
                             "Sepal Width" = "Sepal.Width",
                             "Petal Length" = "Petal.Length",
                             "Petal Width" = "Petal.Width"))
    ),
    mainPanel(
        h3('Your Iris prediction'),
        h4('Predictor you enter'),
        verbatimTextOutput("oid1"),
        h4('Class'),
        verbatimTextOutput("oid2"),
        h4('Accuracy'),
        verbatimTextOutput("oid3")
    )
))