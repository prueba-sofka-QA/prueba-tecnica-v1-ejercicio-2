# Prueba técnica V1 Ejercicio 2

- **IDE** VSCode + Git Hub Copilot
- **Patron** Screenplay
- **Framework de automatización** Karate
- **Gestion de dependencias** Gradle

## Descripción

La página https://www.demoblaze.com/ proporciona la funcionalidad de registro
(signup) y login.

Utilizando un software para pruebas de servicios REST realizar una prueba de cada
uno de estos servicios:

- Signup: https://api.demoblaze.com/signup
- Login: https://api.demoblaze.com/login

Identificar las entradas y capturar las salidas en cada uno de los siguientes casos:

- Crear un nuevo usuario en signup
- Intentar crear un usuario ya existente
- Usuario y password correcto en login
- Usuario y password incorrecto en login

## Plan de acción para el proyecto

1. Hacer pruebas manuales para los casos de uso

    - Crear un nuevo usuario en signup

    ```
    Username: juan1032
    Password: 12946
    ```

    - Intentar crear un usuario ya existente

    ```
    Username: juan1032
    Password: 12946
    ```

    - Usuario y password correcto en login

    ```
    Username: juan1032
    Password: 12946
    ```
    
    - Usuario y password incorrecto en login

    Password incorrecto
    ```
    Username: juan1032
    Password: 12947
    ```

    Usuario incorrecto
    ```
    Username: noexiste
    Password: 123456
    ```

2. Crear el proyecto en formato gradle especial para el proyecto Karate



3. Editar el archivo build.gradle

