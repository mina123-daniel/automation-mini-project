*** Settings ***
Library    RequestsLibrary
Resource   Variables.resource

*** Keywords ***
Create API Session
    &{headers}=    Create Dictionary    x-api-key=${REQRES_API_KEY}
    Create Session    users_api    ${API_BASE_URL}       headers=${headers}

Get User By Id
    [Arguments]    ${user_id}
    ${response}=    Get On Session    users_api    /users/${user_id}
    Status Should Be    200    ${response}
    ${body}=    To Json    ${response.content}
    [Return]    ${body}

Get First User Email
    [Arguments]    ${user_id}
    ${body}=    Get User By Id    ${user_id}
    ${email}=   Set Variable    ${body['data']['email']}
    [Return]    ${email}
