*** Settings ***
Resource    ../../Resources/Api.resource

# robot -d Result .\Tests\UI\login_tests.robot
*** Variables ***

*** Test Cases ***
Get User From Public API
    [Documentation]    Simple GET request to reqres.in
    Create API Session
    ${body}=    Get User By Id    2
    Should Be Equal         ${body['data']['id']}      ${2}
    Should Contain          ${body['data']['email']}    @






*** Keywords ***



