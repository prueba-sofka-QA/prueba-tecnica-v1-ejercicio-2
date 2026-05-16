Feature: Demoblaze API Tests

  Background:
    * url baseUrl

  Scenario: Crear usuario nuevo
    * def randomUsername = 'test_' + Math.floor(Math.random() * 10000)
    Given path '/signup'
    And request { username: '#(randomUsername)', password: 'Test123' }
    When method post
    Then status 200
    And match response !contains 'already exist'
    * def TestContext = Java.type('demoblaze.TestContext')
    * eval TestContext.setCreatedUsername(randomUsername)
    * print 'Created user: ' + randomUsername

  Scenario: Crear usuario existente
    * def TestContext = Java.type('demoblaze.TestContext')
    * def existingUser = TestContext.getCreatedUsername()
    Given path '/signup'
    And request { username: '#(existingUser)', password: 'Test123' }
    When method post
    Then status 200
    And match response.errorMessage contains 'already exist'
    * print 'Response: ' + response

  Scenario: Login con credenciales correctas
    * def TestContext = Java.type('demoblaze.TestContext')
    * def validUser = TestContext.getCreatedUsername()
    Given path '/login'
    And request { username: '#(validUser)', password: 'Test123' }
    When method post
    Then status 200
    And match response contains 'Auth_token'
    * print 'Response: ' + response

  Scenario: Login con credenciales incorrectas
    Given path '/login'
    And request { username: 'no_existe', password: 'wrong' }
    When method post
    Then status 200
    And match response.errorMessage contains 'User does not exist'
    * print 'Response: ' + response
