


## Para correr en docker si no podes instalar rayshader en el trabajo
Sacado de aquí [Link](https://gitlab.com/ben8t/rayshader_experiment/-/tree/master?ref_type=heads)

Esto en linux
```
git clone https://gitlab.com/ben8t/rayshader_experiment.git
cd rayshader_experiment
docker build -t rayshader .
docker container run -d --rm -v $(pwd):/home/rstudio/kitematic -p 8787:8787 -e USER=admin -e PASSWORD=root --name rstudio rayshader
```


## en windows
```
git clone https://gitlab.com/ben8t/rayshader_experiment.git
cd rayshader_experiment
docker build -t rayshader .
docker container run -d --rm -v D:/martin/Data:/home/rstudio/kitematic/data -v %cd%:/home/rstudio/kitematic -p 8787:8787 -e USER=admin -e PASSWORD=root --name rstudio rayshader 
```

## para borrar
docker container rm rstudio


##
para ejecutar rstudio en un navegador: *localhost:* 8787 *admin:* root

![Imagen](/imagenes/imagen3.png "Foco").
![Imagen](/imagenes/imagen2.png "Foco").
![Imagen](/imagenes/imagen1.png "Foco").

![Imagen](/imagenes/imagen4.png "Foco").
```R
elmat %>%
  sphere_shade(texture = "bw") %>%
 # add_water(detect_water(elmat), color = "desert") %>%
  add_shadow(ray_shade(elmat, zscale = 3), 0.5) %>%
  add_shadow(ambient_shade(elmat), 0) %>%
  plot_3d(elmat, zscale = 5, fov = 30, theta = -225, phi = 25, windowsize = c(1000, 800), zoom = 0.8)
Sys.sleep(0.2)
render_depth(focallength = 800, clear = TRUE)
render_snapshot(clear = TRUE)
```




