shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("MT Cars - Mileage Per Gallon"),
    sidebarPanel(
      h3('Input Panel'),
      p('Here you can choose any variable to see how it behave with the Mileage per Gallon variable.'),
      p('Select the variable to compare its behavior with the MPG:'),
      selectInput("x", "Choose you Input:", choices = c('cyl'='cyl','disp'='disp', 'hp'='hp', 'drat'='drat', 'wt'='wt', 'qsec'='qsec', 'vs'='vs', 'am'='am', 'gear'='gear', 'carb'='carb')),
      
      
      numericInput('nHead', 'Number of rows in data head', 4, min = 1, max = 100, step = 1)
     
    ),
    mainPanel(
      h4('Summary of Selected Attribute'),
      h4(verbatimTextOutput("summary")),
      h4('Sample Data - Rows in Data Head'),
      h4(verbatimTextOutput("head")),
     
      
      plotOutput('newHist'),
      plotOutput('myPlot')
    )
  )
)