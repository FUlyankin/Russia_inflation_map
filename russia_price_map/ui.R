# Эта часть скрипта контролирует вывод и вход

library('shiny')
alldata <- read.csv('data/Prod_price_03_16_m.csv',sep=',',header=TRUE)
products <- as.character(unique(alldata$X.3)[-1])

shinyUI(fluidPage(
  titlePanel("Ценовая карта России"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Хотите узнать как различалась цена на товар по регионам?"),
      
      selectInput("var1", 
                  label = "Выберите товар",
                  choices = products,
                  selected = "Картофель, кг"
      ),
      
      selectInput("var_year", 
                  label = "Выберите год",
                  choices = c('2003','2004','2005','2006','2007','2008','2009','2010',
                              '2011','2012','2013','2014','2015','2016'),
                  selected = "2016"),
      
      selectInput("var_mouth", 
                  label = "Выберите месяц",
                  choices = c('январь','февраль','март','апрель','май','июнь','июль' 
                              ,'август','сентябрь','октябрь','ноябрь','декабрь'),
                  selected = "январь"),
      downloadButton('downloadData', 'Скачать данные'),
      br(),
      br(),
      "Карта создана на основе результатов научно-исследовательской работы",
      a(href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2920571", "Анализ Региональной Дифференциации Инфляции,"),
      "написанной в рамках Госзадания Академии на 2016г.",
      br(),
      br(),
      img(src = "http://www.ranepa.ru/images/logo.png", height = 75),
      br(),
      br(),
      "Карта сделана",
      a(href="https://github.com/FUlyankin/Russia_inflation_map", "Ульянкиным Филиппом"),
      width = 3),
    
    mainPanel(plotOutput("map"))
  )
))

