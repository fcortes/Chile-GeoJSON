# Comunas chilenas en formato GeoJSON

## Descripción
TODO

## Instrucciones

Para generar el archivo `comunas.json` se pueden ejecutar los comandos necesarios con
```
make
```

### Dependencias
Los scripts para generar el archivo final utilizan GDAL, el cual se puede instalar en Ubuntu con
```
apt-add-repository ppa:ubuntugis/ppa
apt-get update
apt install gdal-bin
```
Además, es necesario instalar [underscore](https://www.npmjs.com/package/underscore-cli) para minimizar el tamaño final del json generado.

## Referencias

* La idea de este repositorio está basada en gran parte de este repositorio: [jlhonorato/geo](https://github.com/jlhonorato/geo)
* Mapas vectoriales de Chile de la Biblioteca del Congreso de Chile: [Mapas Vectoriales](https://www.bcn.cl/siit/mapas_vectoriales/index_html/)
