


## Para correr en docker
Link
https://gitlab.com/ben8t/rayshader_experiment/-/tree/master?ref_type=heads


git clone https://gitlab.com/ben8t/rayshader_experiment.git
cd rayshader_experiment
docker build -t rayshader .
docker container run -d --rm -v $(pwd):/home/rstudio/kitematic -p 8787:8787 -e USER=admin -e PASSWORD=root --name rstudio rayshader



## en windows
docker container run -d --rm -v D:/martin/Data:/home/rstudio/kitematic/data -v %cd%:/home/rstudio/kitematic -p 8787:8787 -e USER=admin -e PASSWORD=root --name rstudio rayshader 

docker container rm rstudio



para ejecutar

localhost:8787
admin root



