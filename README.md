# Introducción

En esta practica realizada por Marc Negre Serra podremos conseguir desplegar tres contenedores simultaneamente con docker-compose

Todos los archivos/código...  ha sido cogido de este repositorio https://github.com/MarcusNeSe/loginwebapp-docker-compose.

Para esta practica necesitaremos tener bien instalados Docker y Docker-Compose.

El sistema operativo que vamos a usar para esta practica es Windows 10, también usaremos VisualStudio (Extensiones como Docker), DockerDesktop y también CMD.

En este repositorio podreis descargar todo lo encesario para realizar la practica, están todas las carpeta, archivos...

La forma más rápida sería hacer un git clone a este repositorio para descargarlo y solo deberías lanzar un par de comando y ya estaría funcionando. Pero os documentaré como hacerlo desde cero.

Para poder descargar todo lo de este repositorio lo que debemos hacer es abrir el CMD e ir al escritorio y usamos el siguiente comando `git clone https://github.com/MarcusNeSe/Prueba.git` y se creará una carpeta en el escritorio con todos los archivos.

![image](https://user-images.githubusercontent.com/101186662/173079605-3a9fa866-0e67-4936-aeb4-2292c315cb96.png)

# Creación de carpetas, archivos...

Lo primero que haremos será crear una carpeta en el escritorio llamada "ExamenCompose". Una vez de la carpeta crearemos un archivo llamado "Dockerfile" y escribiremos lo siguiente dentro del documento, yo estoy usando VisualStudio, entonces abro el archivo "Dockerfile" en Visual y le pongo la información siguiente. En la parte de "maintainer" podeis cambiarlo por vuestro nombre si quereis. La linea 5 sirve para que cuando se ejecute el comando para hacer el build de la imagen copiará el archivo .war a esa dirección.

![image](https://user-images.githubusercontent.com/101186662/173087285-dae56fd2-b141-43dc-9aab-46a608dec8fb.png)

Ahora crearemos otro archivo llamado "docker-compose.yml" en el cual pondremos en que puertos queremos la base de datos, phpMyAdmin y la web. En el puerto "8081" tendremos el phpMyAdmin, en el puerto "8082" está la web y en el "3036" está la base de datos.

![image](https://user-images.githubusercontent.com/101186662/173083514-063602cf-12a6-474c-9009-d8cf63c3ea99.png)

![image](https://user-images.githubusercontent.com/101186662/173083818-a3a304b3-3c02-4138-894d-035713d65d86.png)

