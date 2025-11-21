*** Settings ***
Resource    ../../Resources/Browser.resource
Resource    ../../Resources/Api.resource
Resource    ../../Resources/Db.resource
Resource    ../../Resources/Variables.resource

# robot -d Result .\Tests\E2E\user_e2e.robot
*** Test Cases ***
End To End Demo: Api To Db To Ui
    [Documentation]    Get user from API, store in DB, then use UI login
    # 1) API: get user data
    log to console    Now createing the API Session
    Create API Session
    ${body}=    Get User By Id    2
    ${email}=   Set Variable    ${body['data']['email']}
    ${first_name}=    Set Variable    ${body['data']['first_name']}
    log to console     API Session successfully created

    log     Connectting to Database
    # 2) Db: store user
    Connect To Test Database
    log to console     Database successfully connected
    Insert User Into Db    ${first_name}    ${email}
    ${user_row}=    Get Any User From Db
    log to console    User from DB: ${user_row}
    Disconnect From Test Database

    log to console    Logging to Demo Site
    # 3) UI: login using fixed credentials (demo logic)
    Open Demo Site
    Login With Credentials    standard_user    secret_sauce
    Inventory Page Should Be Visible
    sleep     3s
    Close Browser Session


