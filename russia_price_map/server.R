# Эта часть скрипта контролирует интерфейс

library('shiny')
library('ggplot2')
library('RColorBrewer')
library('dplyr')
# library('rgdal')

library('grid')
library('sp')
library('maptools') 
library('mapproj')
library('gpclib')

# Подгружаем координаты объектов для карты
russia_df <- readRDS("data/russia_map.rds")
# Подгружаем таблицу с данными и таблицу с сопоставлением каждому субъекту его id
alldata <- read.csv('data/Prod_price_03_17_m.csv',sep=',',header=TRUE)
years <- gsub("[.]"," ",names(alldata)[-c(1,2,3,4,5)])
newnames <- c(names(alldata)[1:5],years) 
names(alldata) <- newnames

subj_id <- read.csv('data/subj_id.csv', header=T, encoding = 'UTF-8')

source("helpers.R")

shinyServer(
  function(input, output) {

    output$map <- renderPlot({
    var2 <- paste0(input$var_mouth,' ',input$var_year)
    percent_map(var1 = input$var1,
                      var2 = var2,
                      russia_df = russia_df,
                      alldata = alldata,
                      subj_id = subj_id)
    })
    
    output$downloadData <- downloadHandler(
       filename = function() {
         'data.txt'},
       content = function(file) {
         write.csv(alldata, file)
       }
     )

  }
)

