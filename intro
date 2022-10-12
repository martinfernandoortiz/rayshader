library(rayshader)
library(sp)
library(raster)
library(scales)
library(rgl)
require(rgl)
setwd("~/Documents/data/gis/raster/mde/bariloche")



barilo_elevation <-  raster::raster("~/Documents/data/gis/raster/mde/bariloche/productosBariloche/3857/mde_ampliado3857.tif")

#height_shade(raster_to_matrix(barilo_elevation)) %>%
#  plot_map()


barilo_r11 <-  raster::raster("/home/martin/Downloads/LC09_L2SP_232089_20220828_20220830_02_T1/LC09_L2SP_232089_20220828_20220830_02_T1_SR_B4.TIF")
barilo_r12 <-  raster::raster("/home/martin/Downloads/LC09_L2SP_232088_20220828_20220830_02_T1/LC09_L2SP_232088_20220828_20220830_02_T1_SR_B4.TIF")
barilo_r <- raster::merge(barilo_r11,barilo_r12)


barilo_g11 <-  raster::raster("/home/martin/Downloads/LC09_L2SP_232089_20220828_20220830_02_T1/LC09_L2SP_232089_20220828_20220830_02_T1_SR_B3.TIF")
barilo_g12 <-  raster::raster("/home/martin/Downloads/LC09_L2SP_232088_20220828_20220830_02_T1/LC09_L2SP_232088_20220828_20220830_02_T1_SR_B3.TIF")
barilo_g <-  raster::merge(barilo_g11,barilo_g12)

barilo_b11 <-  raster::raster("/home/martin/Downloads/LC09_L2SP_232089_20220828_20220830_02_T1/LC09_L2SP_232089_20220828_20220830_02_T1_SR_B2.TIF")
barilo_b12 <-  raster::raster("/home/martin/Downloads/LC09_L2SP_232088_20220828_20220830_02_T1/LC09_L2SP_232088_20220828_20220830_02_T1_SR_B2.TIF")
barilo_b <-  raster::merge(barilo_b11,barilo_b12)

rm(barilo_r11,barilo_r12,barilo_g11,barilo_g12,barilo_b11,barilo_b12)


barilo_elevation <-  raster::projectRaster(barilo_elevation, crs = (barilo_b),
                                           method = "bilinear")
e <- raster::extent(barilo_elevation)
proje


barilo_r_cropped <- raster::crop(barilo_r, e)
barilo_g_cropped <- raster::crop(barilo_g, e)
barilo_b_cropped <- raster::crop(barilo_b, e)

elevation_cropped <- barilo_elevation

blue  <-  ((barilo_b_cropped - 7000) / 10000)
green <- ((barilo_g_cropped - 7000) / 10000)
red <- ((barilo_r_cropped - 7000) / 10000)

blue[blue < 0] <- 0
green[green < 0] <- 0
red[red < 0] <- 0

blue <- blue^0.95
green <- green^0.5
red <- red^0.4

rgb <- stack(red, green, blue)
plotRGB(rgb, scale=1, zlim=c(0, 1))




names(rgb) <-  c("r","g","b")

barilo_r_cropped <-  rayshader::raster_to_matrix(rgb$r)
barilo_g_cropped <-  rayshader::raster_to_matrix(rgb$g)
barilo_b_cropped <-  rayshader::raster_to_matrix(rgb$b)
maxValue(rgb)

bariloel_matrix <- rayshader::raster_to_matrix(elevation_cropped)

barilo_rgb_array <- array(0,dim<-c(nrow(barilo_r_cropped),ncol(barilo_r_cropped),3))

barilo_rgb_array[,,1] <-   barilo_r_cropped/2.026416#.8417 #Red layer
barilo_rgb_array[,,2] <-  barilo_g_cropped/2.417747#.8417 #Blue layer
barilo_rgb_array[,,3] <-  barilo_b_cropped/5.351562#.8417 #Green layer


barilo_rgb_array <-  aperm(barilo_rgb_array, c(2,1,3))


#barilo_rgb_contrast <-  scales::rescale(barilo_rgb_array,to<-c(1,255))
#barilo_rgb_contrast <-  scales::rescale(barilo_rgb_contrast,to<-c(0,1))

brc_rgb_contrast <-  scales::rescale(barilo_rgb_array,to=c(0,1))

plot_map(zion_rgb_contrast)

plot_3d(brc_rgb_contrast, bariloel_matrix, baseshape = "circle",
        windowsize = c(1100,900),
        zscale = 18, shadowdepth =-50,
        zoom=0.5, phi=25,theta=-25,fov=70, background = "#000000", shadowcolor = "#523E2B")
render_snapshot(title_text <- "Bariloche, Rio Negro | Imagery: Landsat 8 28-08-2022 | DEM: MDE-Ar",
                title_bar_color <- "#black", title_color <- "white", title_bar_alpha <- 1)


angles <-  seq(0,360,length.out = 1441)[-1]
for(i in 1:1440) {
  render_camera(theta=-45+angles[i])
  render_snapshot(filename = sprintf("barilo%i.png", i), 
                  title_text <- "Bariloche, Rio Negro | Imagery: Landsat 8 | DEM: MDE-Arc30m",
                  title_bar_color = "#1f5214", title_color = "white", title_bar_alpha = 1)
}
rgl::rgl.close()

#av::av_encode_video(sprintf("zionpark%d.png",seq(1,1440,by=1)), framerate = 30,
# output = "zionpark.mp4")

rgl::rgl.close()
system("ffmpeg -framerate 60 -i barilo%d.png -pix_fmt yuv420p barilo.mp4")
