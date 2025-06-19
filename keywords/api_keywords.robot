*** Settings ***
Library    RequestsLibrary
Resource   ../resources/variables.robot


*** Keywords ***
# get user with ID 2 successfully

Given API URL & Header is set
    [Documentation]    Set the API URL for the requests
    Create Session    get_user_api    ${API_URL}    verify=${False}
    ${headers}=    Create Dictionary    Content-Type=application/json   x-api-key=reqres-free-v1
    Set Suite Variable    ${headers}
    
When User send request get single user with ID 2
    ${response}=    GET On Session    get_user_api    /api/users/2    headers=${headers}
    Set Suite Variable    ${response}
Then response status code 200
    # Log To Console    ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}    200
And response should contain id, email, firts_name, last_name , avatar
    ${json}=    To JSON    ${response.content}
    # Log To Console    ${response.content}
    Should Be Equal As Strings    ${json['data']['id']}    2
    Should Be Equal    ${json['data']['email']}    janet.weaver@reqres.in
    Should Be Equal    ${json['data']['first_name']}    Janet
    Should Be Equal    ${json['data']['last_name']}    Weaver
    Should Be Equal    ${json['data']['avatar']}    https://reqres.in/img/faces/2-image.jpg
    Should Be Equal    ${json['support']['url']}    https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral
    Should Be Equal    ${json['support']['text']}    Tired of writing endless social media content? Let Content Caddy generate it for you.


# Post Create user successfully
Given Given API URL, body & Header is set
    [Documentation]    User send request to create a new user with name and job
    Delete All Sessions
    Create Session    new_user_api    ${API_URL}    verify=${False}
    ${headers}=    Create Dictionary    Content-Type=application/json    x-api-key=reqres-free-v1
    ${name}=    Set Variable    morpheus
    ${job}=    Set Variable    leader
    ${body}=    Create Dictionary    name=${name}    job=${job}
    Set Suite Variable    ${headers}
    Set Suite Variable    ${body}
    Set Suite Variable    ${name}
    Set Suite Variable    ${job}

When User send request create user
    Log To Console    Body: ${body}
    Log To Console    Header: ${headers}
    ${response}=    POST On Session    new_user_api    /api/users    json=${body}    headers=${headers}
    Set Suite Variable    ${response}
Then response status code 201
    # Log To Console    ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}    201
And response should contain name, job, id
    ${json}=    To JSON    ${response.content}
    # Log To Console    ${response.content}
    Should Be Equal   ${json['name']}    ${name}
    Should Be Equal    ${json['job']}    ${job}
    Should Be True    "id" in ${json}