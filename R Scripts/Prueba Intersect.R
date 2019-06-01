#Se cargan las siguiente librerias

library(sf)
library(tidyverse)
library(leaflet)

#Se define la ruta

ruta=getwd() %>% substr(start = 1, stop = nchar(ruta)-9)
setwd(ruta)


ruta_base_datos<-"C:/Users/marce/Universidad de Los Andes/German Augusto Carvajal Murcia - UNIANDES - RAS - SDM/BASES DE DATOS/"
ruta_base_datos_nueva<-"C:/Users/marce/Documents/Academic/Tesis/Bases de datos/"

#Hacer capas

layer_calzadas<-st_read(paste0(ruta_base_datos,"Mapas de Referencia IDECA/MR0318.gdb"),layer = "Calz",stringsAsFactors = FALSE,type = 3) %>% st_transform(4326)
layer_malla_vial<-st_read(paste0(ruta_base_datos,"Mapas de Referencia IDECA/MR0318.gdb"),layer = "MVI",stringsAsFactors = FALSE,promote_to_multi = FALSE) %>% st_transform(4326) %>% filter(st_is_valid(.))

layer_calzadas_2019<-st_read(paste0(ruta_base_datos_nueva,"GDR_V03.19.gdb"),layer = "Calz",stringsAsFactors = FALSE,promote_to_multi = FALSE) %>% st_transform(4326)


#Polígonos viales

calzadas_final <- layer_calzadas %>% filter(st_is_valid(.))

poligonos <- calzadas_final %>% group_by(CalCIV) %>% summarise(N=n())

calle26jorge <- poligonos %>% filter(CalCIV==9004733)
plot(calle26jorge)
