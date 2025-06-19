*** Settings ***
Library    RequestsLibrary
Resource   ../keywords/api_keywords.robot
Resource  ../resources/variables.robot

*** Test Cases ***

# Test Case: Get Single User 
Get single user successfully
    Given API URL & Header is set
    When User send request get single user with ID 2
    Then response status code 200
    And response should contain id, email, firts_name, last_name , avatar

# Test Case: Create User
Create user successfully
    Given Given API URL, body & Header is set
    When User send request create user
    Then response status code 201
    And response should contain name, job, id