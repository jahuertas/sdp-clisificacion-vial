library(sf)
library(tidyverse)

path<-"C:/Users/marce/Universidad de Los Andes/German Augusto Carvajal Murcia - UNIANDES - RAS - SDM/BASES DE DATOS/"

layer_malla_vial<-st_read(paste0(ruta_base_datos,"OpenStreetMaps/Malla Vial Bogotá/MVI.shp"), stringsAsFactors = FALSE)%>% filter(!(highway %in% c("cycleway","service","steps","footway","bus_stop","pedestrian","path","bridleway","proposed","raceway","construction","track"))) %>% st_transform(4326) 
layer_calzadas<-st_read(paste0(ruta_base_datos,"Mapas de Referencia IDECA/MR0318.gdb"),layer = "Calz",stringsAsFactors = FALSE,promote_to_multi = FALSE) %>% st_transform(4326) %>% filter(st_is_valid(.))

capa_lotes <- 
  
cat_usos <- read_csv(paste0(path,"Mapas de Referencia IDECA/UsosLote.csv"),locale = locale(encoding = stringi::stri_enc_get()))
usos_lote <- read_sf(paste0(path,"Mapas de Referencia IDECA/MR0318.gdb"),layer = "Uso",stringsAsFactors = FALSE)
capa_lote <- read_sf(paste0(path,"Mapas de Referencia IDECA/MR0318.gdb"),layer = "Lote",type = 3,stringsAsFactors = FALSE) %>% st_transform(4326) %>% 
  inner_join(usos_lote,by=c("LotCodigo"="UsoCLote")) %>% left_join(cat_usos) %>% select(UsoArea,Cat) %>% filter(!is.na(Cat))

