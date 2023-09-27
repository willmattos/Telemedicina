
# Telemedicina

Este proyecto tiene como objetivo la creación de una plataforma web en la que los usuarios puedan crear consultas a medicos de distintas especialidades. Para ser medico debes tener un correo @comem.es, que es la forma en la que la pagina detecta si eres paciente o medico. Los medicos pueden responder consultas y cerrarlas. 
Los pacientes pueden puntuar las consultas ya cerradas.



## Instalación

Pasos de instalacion

    1. En XAMPP debes poner el proyecto en la carpeta htdocs.
    2. Agregar la base de datos telemedicina.sql.
    3. Revisar el .env si la direccion de la bd es correcta.
    4. Completar el mailer_dns en .env para probar las funciones de correo.
```bash
    Dentro del proyecto utilizar el comando
                            composer install
```
Con eso la aplicación esta lista para usarse.


    
## Screenshots

[![Captura-de-pantalla-2023-09-27-a-las-19-44-33.png](https://i.postimg.cc/0QYnx7hB/Captura-de-pantalla-2023-09-27-a-las-19-44-33.png)](https://postimg.cc/wyBLQRqX)

[![Captura-de-pantalla-2023-09-27-a-las-19-44-52.png](https://i.postimg.cc/C5wNKzgL/Captura-de-pantalla-2023-09-27-a-las-19-44-52.png)](https://postimg.cc/ygr9Q6xw)

[![Captura-de-pantalla-2023-09-27-a-las-19-45-54.png](https://i.postimg.cc/J46q1rdM/Captura-de-pantalla-2023-09-27-a-las-19-45-54.png)](https://postimg.cc/F7Scp44B)

[![Captura-de-pantalla-2023-09-27-a-las-19-46-09.png](https://i.postimg.cc/Y2xRsf64/Captura-de-pantalla-2023-09-27-a-las-19-46-09.png)](https://postimg.cc/4nmpKcFZ)

Los médicos no pueden crear consultas.

[![Captura-de-pantalla-2023-09-27-a-las-19-48-47.png](https://i.postimg.cc/TYY0ML0t/Captura-de-pantalla-2023-09-27-a-las-19-48-47.png)](https://postimg.cc/G9VGvpZD)

Esta consulta ha sido creada por un paciente para el médico.

[![Captura-de-pantalla-2023-09-27-a-las-19-50-59.png](https://i.postimg.cc/pLmBrwg8/Captura-de-pantalla-2023-09-27-a-las-19-50-59.png)](https://postimg.cc/zy1hPcDX)

La consulta ha sido realizada por Tyler Durden.

[![Captura-de-pantalla-2023-09-27-a-las-19-51-26.png](https://i.postimg.cc/sgb4hnrL/Captura-de-pantalla-2023-09-27-a-las-19-51-26.png)](https://postimg.cc/PCzDGQNb)

El paciente termino la consulta y la ha puntuado.

[![Captura-de-pantalla-2023-09-27-a-las-19-52-11.png](https://i.postimg.cc/D05c4nvQ/Captura-de-pantalla-2023-09-27-a-las-19-52-11.png)](https://postimg.cc/m1z90xFh)

Cuando una consulta se encuentra finalizada no se puede continuar enviando mensajes.

[![Captura-de-pantalla-2023-09-27-a-las-19-52-37.png](https://i.postimg.cc/MTS0svXb/Captura-de-pantalla-2023-09-27-a-las-19-52-37.png)](https://postimg.cc/f380yWcJ)