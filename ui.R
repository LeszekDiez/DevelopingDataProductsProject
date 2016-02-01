shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("MT Cars - Mileage Per Gallon"),
    sidebarPanel(
      h3('Input Panel'),
      p('Here you can choose any variable to see how it behave with the Mileage per Gallon variable.'),
      p('Select the variable to compare its behavior with the MPG:'),
      selectInput("x", "Choose you Input:", choices = c('cyl'='cyl','disp'='disp', 'hp'='hp', 'drat'='drat', 'wt'='wt', 'qsec'='qsec', 'vs'='vs', 'am'='am', 'gear'='gear', 'carb'='carb')),
      numericInput('nHead', 'Please, enter the number of rows to display:', 4, min = 1, max = 100, step = 1)
     
    ),
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Exp. Data", 
      
                    h2('Basic Introductory Exploratory Analysis'),
                    p('Please note that this is a very basic App intended to provide some introductory (really, really basic) exploratory analysis.'),
                    p("It uses solely the training dataset on Motor Trend Car Road Tests"),
                    h4('Summary of Selected Attribute'),
                    h4(verbatimTextOutput("summary")),
                    h4('Sample Data - Rows in Data Head'),
                    h4(verbatimTextOutput("head")),
                    plotOutput('newHist'),
                    plotOutput('myPlot')
                  ),
                  tabPanel("About", 
                           h3("Summary"),
                           p('For the Developing Data Products Course Project, I have developed a Shiny Application for use with the mtcars data package in R.'),
                           h3('Application Purpose'),
                           p('The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).'),
                           p('My Shiny application allows the user to choose to explore the relationship between a chosen feature and the Mileage Per Gallon (MPG) variable.'),
                           p('Reproducible Pitch Presentation:'),
                           p('http://rpubs.com/LeszekDiez/DevelopingDataProductsPrj'),
                           p('Github with the Shiny app'),
                           p('https://github.com/LeszekDiez/DevelopingDataProductsProject')
                  )
      )
    )
  )
)