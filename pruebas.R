
library(rayshader)
library(sp)
library(raster)
library(scales)
library(rgl)
require(rgl)
library(ambient)

setwd("~/kitematic/data/data")


data_elevation <-  raster::raster("2769-23.img")

#And convert it to a matrix:
elmat = raster_to_matrix(data_elevation)

#We use another one of rayshader's built-in textures:
elmat %>%
  sphere_shade(texture = "desert") %>%
  #add_water(detect_water(elmat), color = "desert") %>%
  add_shadow(ray_shade(elmat), 0.5) %>%
  add_shadow(ambient_shade(elmat), 0) %>%
  plot_map()



elmat %>%
  sphere_shade(texture = "desert") %>%
  add_water(detect_water(elmat), color = "desert") %>%
  add_shadow(ray_shade(elmat, zscale = 3), 0.5) %>%
  add_shadow(ambient_shade(elmat), 0) %>%
  plot_3d(elmat, zscale = 10, fov = 0, theta = 135, zoom = 0.75, phi = 45, windowsize = c(1000, 800))
Sys.sleep(0.2)
render_snapshot()




elmat %>%
  sphere_shade(texture = "desert") %>%
  add_water(detect_water(elmat), color = "lightblue") %>%
  add_shadow(cloud_shade(elmat,zscale = 10, start_altitude = 500, end_altitude = 700, 
                         sun_altitude = 45, attenuation_coef = 2, offset_y = 300,
                         cloud_cover = 0.55, frequency = 0.01, scale_y=3, fractal_levels = 32), 0) %>%
  plot_3d(elmat, zscale = 10, fov = 0, theta = 135, zoom = 0.75, phi = 45, windowsize = c(1000, 800),
          background="darkred")
render_camera(theta = 125, phi=22,zoom= 0.47, fov= 60 )




montshadow = ray_shade(elmat, zscale = 50, lambert = FALSE)
montamb = ambient_shade(elmat, zscale = 50)

elmat %>%
  sphere_shade(zscale = 10, texture = "imhof1") %>%
  add_shadow(montshadow, 0.5) %>%
  add_shadow(montamb, 0) %>%
  plot_3d(montereybay, zscale = 50, fov = 0, theta = -45, phi = 45, 
          windowsize = c(1000, 800), zoom = 0.75,
          water = TRUE, waterdepth = 0, wateralpha = 0.5, watercolor = "lightblue",
          waterlinecolor = "white", waterlinealpha = 0.5)
Sys.sleep(0.2)
render_snapshot(clear=TRUE)




elmat %>% 
  sphere_shade(zscale = 10, texture = "desert") %>% 
  add_shadow(montshadow, 0.5) %>%
  add_shadow(montamb, 0) %>%
  plot_3d(elmat, zscale = 50, fov = 0, theta = -45, phi = 45, windowsize = c(1000, 800), zoom = 0.6,
         # water = TRUE, waterdepth = 0, wateralpha = 0.5, watercolor = "lightblue",
        #  waterlinecolor = "white", waterlinealpha = 0.5, baseshape = "hex")
  )
render_snapshot(clear = TRUE)


elmat %>%
  sphere_shade(texture = "desert") %>%
  add_water(detect_water(elmat), color = "lightblue") %>%
  add_shadow(cloud_shade(elmat,zscale = 10, start_altitude = 500, end_altitude = 700, 
                         sun_altitude = 45, attenuation_coef = 2, offset_y = 300,
                         cloud_cover = 0.55, frequency = 0.01, scale_y=3, fractal_levels = 32), 0) %>%
  plot_3d(elmat, zscale = 10, fov = 0, theta = 135, zoom = 0.75, phi = 45, windowsize = c(1000, 800),
          background="darkred")
render_camera(theta = 125, phi=22,zoom= 0.47, fov= 60 )

render_clouds(elmat, zscale = 10, start_altitude = 500, end_altitude = 700, 
              sun_altitude = 45, attenuation_coef = 2, offset_y = 300,
              cloud_cover = 0.55, frequency = 0.01, scale_y=3, fractal_levels = 32, clear_clouds = T)
render_snapshot(clear=TRUE)










elmat %>% 
  sphere_shade(zscale = 10, texture = "desert") %>% 
  add_shadow(montshadow, 0.5) %>%
  add_shadow(montamb, 0) %>%
  plot_3d(elmat, zscale = 50, fov = 0, theta = -45, phi = 45, windowsize = c(1000, 800), zoom = 0.6,
          baseshape = "hex")

render_snapshot(clear = TRUE)




elmat %>%
  sphere_shade(texture = "desert") %>%
 # add_water(detect_water(elmat), color = "desert") %>%
  add_shadow(ray_shade(elmat, zscale = 3), 0.5) %>%
  add_shadow(ambient_shade(elmat), 0) %>%
  plot_3d(elmat, zscale = 6, fov = 30, theta = -225, phi = 25, windowsize = c(1000, 800), zoom = 0.3)
Sys.sleep(0.2)
render_depth(focallength = 800, clear = TRUE)
render_snapshot(clear = TRUE)
