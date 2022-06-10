# Introducción

En esta practica realizada por Marc Negre Serra podremos conseguir desplegar tres contenedores simultaneamente con docker-compose

Todos los archivos/código...  ha sido cogido de este repositorio https://github.com/MarcusNeSe/loginwebapp-docker-compose.

Para esta practica necesitaremos tener bien instalados Docker y Docker-Compose.

El sistema operativo que vamos a usar para esta practica es Windows 10, también usaremos VisualStudio (Extensiones como Docker), DockerDesktop y también CMD.

En este repositorio podreis descargar todo lo encesario para realizar la practica, están todas las carpeta, archivos...

La forma más rápida sería hacer un git clone a este repositorio para descargarlo y solo deberías lanzar un par de comando y ya estaría funcionando. Pero os documentaré como hacerlo desde cero.

Para poder descargar todo lo de este repositorio lo que debemos hacer es abrir el CMD e ir al escritorio y usamos el siguiente comando `git clone https://github.com/MarcusNeSe/ExamenDocker.git` y se creará una carpeta en el escritorio con todos los archivos.

![image](https://user-images.githubusercontent.com/101186662/173107829-ce77a140-f994-42df-89cc-d897c4d04d77.png)

# Creación de carpetas, archivos...

Lo primero que haremos será crear una carpeta en el escritorio llamada "ExamenCompose". Una vez de la carpeta crearemos un archivo llamado "Dockerfile" y escribiremos lo siguiente dentro del documento, yo estoy usando VisualStudio, entonces abro el archivo "Dockerfile" en Visual y le pongo la información siguiente. En la parte de "maintainer" podeis cambiarlo por vuestro nombre si quereis. La linea 5 sirve para que cuando se ejecute el comando para hacer el build de la imagen copiará el archivo .war a esa dirección.

![image](https://user-images.githubusercontent.com/101186662/173087285-dae56fd2-b141-43dc-9aab-46a608dec8fb.png)

Ahora crearemos otro archivo llamado "docker-compose.yml" en el cual pondremos en que puertos queremos la base de datos, phpMyAdmin y la web. En el puerto "8081" tendremos el phpMyAdmin, en el puerto "8082" está la web y en el "3036" está la base de datos. Este archivo es creado para poder ejecutar todos los contenedores al mismo tiempo.

![image](https://user-images.githubusercontent.com/101186662/173083514-063602cf-12a6-474c-9009-d8cf63c3ea99.png)

![image](https://user-images.githubusercontent.com/101186662/173083818-a3a304b3-3c02-4138-894d-035713d65d86.png)

Despúes de esto crearemos las dos carpetas siguientes "mysql-dump" y "target", en la carpeta "mysql-dump" metermos crearemos el archivo "USER.sql" en el cual estará la base de datos.

![image](https://user-images.githubusercontent.com/101186662/173084149-1d14b886-2d2e-4a51-b9ca-dbfb54bcd266.png)

![image](https://user-images.githubusercontent.com/101186662/173084219-d9b73359-7afc-42f8-810c-eabdae0aaeb1.png)

En la carperta "target" meteremos el archivo "LoginWebApp.war" y una carpeta llamada "LoginWebApp" donde estará todo el tema del código.

![image](https://user-images.githubusercontent.com/101186662/173084857-136b9f21-40bc-4273-a24c-d2571f0c1c86.png)

Ahora crearemos archivos ".yml" para la base de datos, phpMyAdmin, esto lo haremos por si queremos iniciar una sola imagen en vez de las tres a la vez.

El primer achivo que crearemos será el de tomcat "docker-compose_tomcat.yml". Le hemos denominado el tomcat en el puerto "8082".

![image](https://user-images.githubusercontent.com/101186662/173085719-d5fa6118-74bb-4eca-9a47-2b1e1f8e1da4.png)

Ahora el de "docker-compose_mysql_phpMyAdmin.yml".

![image](https://user-images.githubusercontent.com/101186662/173086001-14c463eb-e89a-4532-80b7-c6d556cfcb38.png)

Y por último el de "docker-compose_mysql.yml".

![image](https://user-images.githubusercontent.com/101186662/173086154-32bfafad-98a2-4ffb-85d5-07c7628bd152.png)

# Despliegue de la apliación

Lo primero que haremos será entrar en la carpeta y abrir el cmd.

![image](https://user-images.githubusercontent.com/101186662/173086938-ed1e5844-d419-4edf-ab6b-f60045c5917a.png)

Ahora usaremos este comando `docker build --pull --rm -f "Dockerfile" -t examencompose:latest .` para poder construir la imagen del "Dockerfile". En el comando en la parte de "examencompose" lo puedes cambiar por el nombre que quieras para la imagen.

![image](https://user-images.githubusercontent.com/101186662/173087388-031d3479-f699-4ccc-bb5c-ce35dae43d7b.png)

Ahora vamos a ejecutar el docker-compose donde tenemos todos los contenedores el llamado "docker-compose.yml" con el comando `docker compose -f "docker-compose.yml" up -d --build`, en este comadno si cambiamos lo que está entre "" por otro nombre de los ".yml" que tenemos estaríamos ejecutando por separado los contenedores.

![image](https://user-images.githubusercontent.com/101186662/173088879-5e4696f4-feb6-49c6-afa4-a14091a7812d.png)

![image](https://user-images.githubusercontent.com/101186662/173088917-e9dc08c0-ffb8-42f0-911e-f1f831bf3a1c.png)

Así se ve en Docker Desktop

![image](https://user-images.githubusercontent.com/101186662/173111871-8c984ec9-e15c-434e-aaf9-d59e6d89d3a9.png)

Ahora está subido correctamente.

# Comprobación

Lo primero que haremos será ir al navegador y poner "localhost:8082/LoginWebApp" podremo comprobar que como no tenemos una cuenta creada no nos dejará logear para eso iremos a "Register Here".

![image](https://user-images.githubusercontent.com/101186662/173090491-0f93b7d0-c8d6-4055-afe3-4ff1f2a70828.png)

![image](https://user-images.githubusercontent.com/101186662/173090539-2f0a3405-690d-4873-9bc1-05daf710883f.png)

Pero da este error, ahora vamos a solucionarlo.

![image](https://user-images.githubusercontent.com/101186662/173090586-a209831e-3274-4df8-a763-1c3a3bb8a62a.png)

Para solucionar el error debemos entrar en "localhost:8081" para entrar en phpMyAdmin. Nos pedirá iniciar seisón que se inciar con lo siguiente.

![image](https://user-images.githubusercontent.com/101186662/173091136-9acfbf8a-e46a-4186-a23d-92f493ef9840.png)

El inicio de sesisón se saca de aquí.

![image](https://user-images.githubusercontent.com/101186662/173091077-2d370d16-2157-45f0-b2f5-745b911349e1.png)

Una vez dentro de phpMyAdmin vamos a crear una nueva columna llamda "regdate" con un valor/longitud "20". Y le damos a guardar.

![image](https://user-images.githubusercontent.com/101186662/173091491-f5697048-d425-4eb6-a4af-ddccbf761692.png)

Ahora ya si que podremos crear la cuenta. Vamos a repetir el intento. Si funciona ha de salir el siguiente mensaje.

![image](https://user-images.githubusercontent.com/101186662/173091735-a7bb4716-003c-4b5a-b9f0-09ba965bd938.png)

Ahora vamos a intentar logear para ver si funciona. Si funciona saldrá el siguiente mensaje.

![image](https://user-images.githubusercontent.com/101186662/173091807-d70ff49e-64cd-4ee5-8366-fa865cfd272d.png)

![image](https://user-images.githubusercontent.com/101186662/173091855-b3ec2e51-a187-46a5-956d-c7695cd78e0f.png)

Ahora vamos a ir a phpMyAdmin para ver si se ha guardado correctamente el usuario. Como podemos ver se ha creado correctamente.

![image](https://user-images.githubusercontent.com/101186662/173092112-78f8d663-de84-4b5a-96bc-cd7ee9a796e0.png)

El despliegue ha funcionado correctamente. Si has optado por la opción de hacer el "git clone" lo único que debes haber hecho ha sido usar el comando `docker build --pull --rm -f "Dockerfile" -t examencompose:latest .` y `docker compose -f "docker-compose.yml" up -d --build`.

Si queremos cerrar el despliegue puedes usar el siguiente comando `docker-compose down`.

# Push de las imagenes a DockerHub

Ahora vamos a realizar 3 push a mi DockerHub como todo se puede hacer a travez de VisualStudio o con el CMD.

Vamor a realizarlo con el VisualStudio lo primero que tenemos que tener instalado es la extensión de Docker, aunque si no estaba instalada desde un principo no puedes hacer el "Compose Up/Down" o "Build Image"...

Vamos a la extensión de Docker en Visual y iniciamos sesión con nuestra cuenta de DockerHub. Debería quedar algo como esto.

![image](https://user-images.githubusercontent.com/101186662/173109480-584bf31d-c0a2-4f9b-9ebe-bb5674bd8d0b.png)

Una vez iniciada la sesión vamos a ir a la parte de "Images" y vamos a hacer lo siguiente con cada una de las imagenes que queremos subir, empezamos con la de "mysql". Luego nos pedirá que eligamos una cuenta y el nombre, "Enter" y ya se estaría subiendo hay que repetir el mismo proceso con las otras dos imagenes.

![image](https://user-images.githubusercontent.com/101186662/173109799-7423368f-2e55-44a3-b41e-e2cd2bdc80d0.png)

![image](https://user-images.githubusercontent.com/101186662/173109950-a1131065-6132-4db2-a1f5-742131e4222f.png)

Como he tenido un problema con VisualStudio lo que voy a hacer será hacer el push a traves del CMD. Nos posicionamos en la carpeta donde está toda la aplicación, y primero hay que verificar que tenemos el incicio de sesión correctamente con un `docker login`

![image](https://user-images.githubusercontent.com/101186662/173110649-ee472607-c081-4bf9-b197-51e8864f85aa.png)

Ahora ejecutamos el siguiente comando `docker push marcsnese/mysql:5.7` que lo que hace es hacer un push de la imagen "mysql".

![image](https://user-images.githubusercontent.com/101186662/173111009-c4e849cc-20d7-46d0-9d9c-b2f435e5189e.png)

Una vez hecha está vamos a hacer las otras dos. Con `docker push marcsnese/phpmyadmin:latest` y `docker push marcsnese/tomcat:latest`.

![image](https://user-images.githubusercontent.com/101186662/173111414-ebfd3e33-c32d-4ff3-9ca3-9958d7207068.png)

![image](https://user-images.githubusercontent.com/101186662/173111534-41bef946-34eb-44bc-b02e-0372fb3d392c.png)

Si vamos a nuestra cuenta de DockerHub podremos ver que tenemos los push ahí.

![image](https://user-images.githubusercontent.com/101186662/173112118-6ce84cac-1ecd-47f1-8fb4-4106da89889e.png)

Pongo aquí los links para poder hacer el pull de los contenedores.

Tomcat: https://hub.docker.com/r/marcsnese/tomcat

MySQL: https://hub.docker.com/r/marcsnese/mysql

phpMyAdmin: https://hub.docker.com/r/marcsnese/phpmyadmin
