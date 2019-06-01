#Preparacionn del entorno de trabajo----

  #Se cargan las siguiente librerias
  
  library(sf)
  library(tidyverse)
  library(leaflet)
  
  #Se define la ruta
  
  ruta=getwd() %>% substr(start = 1, stop = nchar(getwd())-9)

  ruta_base_datos<-paste0(ruta,"IDECA")
  
  #Se cargan las capas (shapefiles)
  
  layer_calzadas<- st_read(paste0(ruta_base_datos,"/Calz.shp"), stringsAsFactors = FALSE)
  layer_andenes <- st_read(paste0(ruta_base_datos,"/Ande.shp"), stringsAsFactors = FALSE)
  layer_separadores <- st_read(paste0(ruta_base_datos,"/Sepa.shp"), stringsAsFactors = FALSE)
  
#Procesamiento----
  
  #Procesamiento calzadas
  
  calzadas <- layer_calzadas %>% filter(st_is_valid(.))
  poligonos_calzadas <- calzadas %>% group_by(CalCIV) %>% summarise(N=n())

  #
  
  andenes <- layer_andenes  %>% filter(st_is_valid(.))




calle26jorge <- poligonos %>% filter(CalCIV==9004733)
plot(calle26jorge)
