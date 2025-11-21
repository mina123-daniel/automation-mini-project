*** Settings ***
Library     SeleniumLibrary
Resource    Variables.resource


*** Keywords ***
Open Demo Site
    Open Browser        ${BASE_URL}         ${BROWSER}
    Maximize Browser Window


Close Browser Session
    Close All Browsers



Login With Credentials
    [Arguments]     ${username}     ${password}
    Input Text      id=user-name    ${username}
    Input Text      id=password     ${password}
    Click Button       id=login-button


Inventory Page Should Be Visible
    Wait Until Page Contains Element    css=.inventory_list    10s