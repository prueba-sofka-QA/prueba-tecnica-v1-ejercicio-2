# Plan Tecnico - Ejercicio 2 (Karate)

## Objetivo

Probar los servicios REST de **demoblaze.com** (Signup y Login) usando Karate.

---

## 1. Estructura del Proyecto

```
prueba-tecnica-v1-ejercicio-2/
├── pom.xml
├── src/
│   └── test/
│       └── java/
│           └── demoblaze/
│               ├── DemoblazeTest.java        # Runner
│               ├── signup.feature             # Casos Signup
│               └── login.feature              # Casos Login
├── karate-config.js                           # Config global Karate
└── README.txt                                 # Instrucciones ejecucion
```

---

## 2. Dependencia Maven (pom.xml)

```xml
<dependency>
    <groupId>com.intuit.karate</groupId>
    <artifactId>karate-junit5</artifactId>
    <version>1.5.1</version>
    <scope>test</scope>
</dependency>
```

---

## 3. Archivos Feature

### 3.1 `signup.feature` — Endpoint: `POST https://api.demoblaze.com/signup`

| # | Caso | Request Body | Validacion |
|---|------|-------------|------------|
| 1 | Crear usuario nuevo | `{ "username": "test_<random>", "password": "Test123" }` | Status 200. No contiene "already exist". |
| 2 | Crear usuario existente | `{ "username": "<mismo_usuario>", "password": "Test123" }` | Status 200. Contiene "already exist". Extraer y loguear mensaje. |

> **Nota**: Ambos casos retornan HTTP 200. La diferenciacion se hace por el contenido del body.

### 3.2 `login.feature` — Endpoint: `POST https://api.demoblaze.com/login`

| # | Caso | Request Body | Validacion |
|---|------|-------------|------------|
| 1 | Credenciales correctas | `{ "username": "<usuario_valido>", "password": "Test123" }` | Status 200. Contiene auth token (`Auth_token: XXX`). Extraer token. |
| 2 | Credenciales incorrectas | `{ "username": "no_existe", "password": "wrong" }` | Status 200. Contiene "User does not exist" o "Wrong password". |

> **Nota**: Ambos casos retornan HTTP 200. El API no usa codigos HTTP de error, siempre responde 200 con mensaje en body.

---

## 4. Configuracion (`karate-config.js`)

```js
function fn() {
  var env = karate.env || 'test';
  var config = {
    baseUrl: 'https://api.demoblaze.com'
  };
  return config;
}
```

---

## 5. Runner Java (`DemoblazeTest.java`)

```java
package demoblaze;

import com.intuit.karate.junit5.Karate;

public class DemoblazeTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
```

---

## 6. Flujo de Ejecucion

```
1. signup.feature: Caso 1 → Crea usuario nuevo (username aleatorio, p.ej. "test_1684")
2. signup.feature: Caso 2 → Reintenta con el mismo username → valida "already exist"
3. login.feature:  Caso 1 → Login con credenciales del paso 1 → valida token
4. login.feature:  Caso 2 → Login con credenciales invalidas → valida error
```

El orden importa: el Caso 2 de signup y el Caso 1 de login dependen del usuario creado en el Caso 1 de signup.

---

## 7. Ejecucion

```bash
mvn test -Dtest=DemoblazeTest
```

Karate genera reporte HTML en `target/karate-reports/`.

---

## 8. Entregables

| Archivo | Contenido |
|---------|-----------|
| `pom.xml` | Proyecto Maven con dependencia Karate |
| `signup.feature` | 2 escenarios (nuevo + existente) |
| `login.feature` | 2 escenarios (valido + invalido) |
| `DemoblazeTest.java` | Runner Karate |
| `karate-config.js` | Configuracion base URL |
| `README.txt` | Instrucciones paso a paso |
| `conclusiones.txt` | Hallazgos y conclusiones |
