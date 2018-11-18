# Подключаем немножечко пакетов
library('ggplot2')
library('RColorBrewer')
library('rgdal')  # Для чтения .shp файлов и работы с ними (readOGR)
library('dplyr')


rus.map <- readOGR("RUS_adm_shp/RUS_adm1.shp")
rudf <- fortify(rus.map)

head(rudf)

# крым 
wld <- readOGR("ne_10m_admin_1_states_provinces/ne_10m_admin_1_states_provinces.shp")