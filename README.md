


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



