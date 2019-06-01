#Preparacionn del entorno de trabajo----

  #Se cargan las siguiente librerias
  
  library(sf)
  library(tidyverse)
  library(leaflet)
  
  #Se define la ruta
  
  ruta=getwd() %>% substr(start = 1, stop = nchar(getwd())-9)

  ruta_base_datos<-paste0(ruta,"IDECA")
  
  #Se cargan las capas (shapefiles)
  
  layer_andenes <- st_read(paste0(ruta_base_datos,"/Ande.shp"), stringsAsFactors = FALSE)
  layer_calzadas<- st_read(paste0(ruta_base_datos,"/Calz.shp"), stringsAsFactors = FALSE)
  layer_cicloruta <-st_read(paste0(ruta_base_datos,"/Cicl.shp"), stringsAsFactors = FALSE) 
  layer_separadores <- st_read(paste0(ruta_base_datos,"/Sepa.shp"), stringsAsFactors = FALSE)
  
#Procesamiento----
  
  #Procesamiento calzadas
  
  andenes <- layer_andenes  %>% filter(st_is_valid(.))
  calzadas <- layer_calzadas %>% filter(st_is_valid(.))
  cicloruta <-layer_cicloruta %>% filter(st_is_valid(.))
  separados <-layer_separadores %>% filter(st_is_valid(.)) 
  
  
  
  poligonos_calzadas <- calzadas %>% group_by(CalCIV) %>% summarise(N=n())

  #Procesamiento andenes
  
  andenes <- layer_andenes  %>% filter(st_is_valid(.))
  poligonos_andenes <- andenes %>% group_by(CalCIV) %>% summarise(N=n())



calle26jorge <- poligonos %>% filter(CalCIV==9004733)
plot(calle26jorge)
