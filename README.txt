Prueba Técnica V1 Ejercicio 2

Stack

- IDE:  Vs Code
- Lenguajes: Java 21, Javascript
- Gestor de dependencias: Maven
- Framework: Karate  
 
Descripción

Probar los servicios REST de demoblaze.com (Signup y Login) usando Karate.

La página https://www.demoblaze.com/ proporciona la funcionalidad de registro
(signup) y login.
Utilizando un software para pruebas de servicios REST realizar una prueba de cada
uno de estos
servicios:
Signup: https://api.demoblaze.com/signup
Login: https://api.demoblaze.com/login

Identificar las entradas y capturar las salidas en cada uno de los siguientes casos:

- Crear un nuevo usuario en signup
- Intentar crear un usuario ya existente
- Usuario y password correcto en login
- Usuario y password incorrecto en logi

¿Cómo ejecutar esta prueba?


1. Verifica que estés usando Java 21

2. Para ejecutar todos los tests:
  mvn test -Dtest=DemoblazeTest

3. Para compilar y ejecutar (limpio):
  mvn clean test -Dtest=DemoblazeTest

Reportes:

Los reportes HTML se generan en: target/karate-reports/
Abrir karate-summary.html en un navegador para ver los resultados.

Casos de Prueba:


SIGNUP (POST https://api.demoblaze.com/signup):
  1. Crear usuario nuevo
     - Username: "test_<random>" (ej. test_4512)
     - Password: "Test123"
     - Validacion: Status 200, sin mensaje "already exist"

  2. Crear usuario existente
     - Username: mismo usuario creado en paso 1
     - Password: "Test123"
     - Validacion: Status 200, errorMessage contiene "already exist"

LOGIN (POST https://api.demoblaze.com/login):
  3. Login con credenciales correctas
     - Username: usuario creado en paso 1
     - Password: "Test123"
     - Validacion: Status 200, respuesta contiene "Auth_token"

  4. Login con credenciales incorrectas
     - Username: "no_existe"
     - Password: "wrong"
     - Validacion: Status 200, errorMessage contiene "User does not exist"

Notas Importantes:
-----------------
- El API siempre retorna HTTP 200, incluso en casos de error.
- Las respuestas de exito son texto plano; los errores vienen en JSON.
- La diferenciacion de casos se hace por el contenido del body.
- El orden de ejecucion es importante: el Caso 1 crea el usuario requerido
  por los Casos 2 y 3.
- TestContext.java es una clase auxiliar usada para compartir el nombre de
  usuario entre escenarios, ya que Karate aísla el contexto de cada uno.
