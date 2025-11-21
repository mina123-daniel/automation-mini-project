*** Settings ***
Resource    ../../Resources/Browser.resource
Resource    ../../Resources/Variables.resource
# robot -d Result .\Tests\UI\login_tests.robot
*** Variables ***



*** Test Cases ***
Login With Standerd User
    [Documentation]    Basic UI login test on saucedemo
    Open Demo Site
    Login With Credentials    standard_user          secret_sauce
    Inventory Page Should Be Visible
    sleep     2s
    Close Browser Session





*** Keywords ***



